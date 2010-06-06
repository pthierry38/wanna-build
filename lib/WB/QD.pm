package WB::QD;

use strict;
use IO::Uncompress::AnyInflate qw(anyinflate);
use Dpkg::Version qw(vercmp);

sub readsourcebins {
    my $arch = shift;
    my $pasfile = shift;
    my $SRC = shift;
    my $BIN = shift;
    my $binary = {};

    my $pas = {};
    local($/) = "\n";
    open(PAS, '<', $pasfile);
    while(<PAS>) {
        chomp;
        s,\s*#.*,,;
        next unless $_;
        my ($p, $c) = split(/:\s*/);
        $pas->{$p} = { arch => [ split(/\s+/, $c) ], mode => substr($c, 0, 1) ne '!' };
    }
    close PAS;

    my $srcs = {};
    local($/) = ""; # read in paragraph mode

    foreach my $s (@$SRC) {
        print "SRC: $s\n";
        my $S = new IO::Uncompress::AnyInflate($s) || return "WB::QD::SRC can't open $s";
        while(<$S>) {
            my $p={};
            /^Package:\s*(\S+)$/mi and $p->{'name'} = $1;
            /^Version:\s*(\S+)$/mi and $p->{'version'} = $1;
            /^Binary:\s*(.*)$/mi and $p->{'binary'} = $1;
            /^Architecture:\s*(.+)$/mi and $p->{'arch'} = $1;
            /^Priority:\s*(\S+)$/mi and $p->{'priority'} = $1;
            /^Section:\s*(\S+)$/mi and $p->{'section'} = $1;
            /^Build-Depends:\s*(.*)$/mi and $p->{'depends'} = $1;
            /^Build-Conflicts:\s*(.*)$/mi and $p->{'conflicts'} = $1;

            next unless $p->{'name'} and $p->{'version'};
            next if $p->{'arch'} eq 'all';
            # TODO: respect the architecture - or not / we already respect it via P-a-s
            delete $p->{'arch'};

            # ignore if package already exists with higher version
            if ($srcs->{$p->{'name'}}) {
                next if (vercmp($srcs->{$p->{'name'}}->{'version'}, $p->{'version'}) > 0);
            }
            my @a = split(/,? /, $p->{'binary'}) if $p->{'binary'};
            $p->{'binary'} = \@a;
            $srcs->{$p->{'name'}} = $p;
        }
        close $S;
    }

    foreach my $p (@$BIN) {
        my $P = new IO::Uncompress::AnyInflate($p) || return "WB::QD::PKGS can't open $p";
        while(<$P>) {
            my $p;
            /^Version:\s*(\S+)$/mi and $p->{'version'} = $1;
            /^Architecture:\s*(\S+)$/mi and $p->{'arch'} = $1;
            /^Package:\s*(\S+)$/mi and $p->{'binary'} = $1;
            /^Package:\s*(\S+)$/mi and $p->{'source'} = $1;
            /^Source:\s*(\S+)$/mi and $p->{'source'} = $1;
            /^Source:\s*(\S+)\s+\((\S+)\)$/mi and $p->{'source'} = $1 and $p->{'version'} = $2;
            $p->{'version'} =~ /(\S+)\+b([0-9]+)/ and $p->{'version'} = $1 and $p->{'binnmu'} = $2;

            $binary->{$p->{'binary'}} = { 'version' => $p->{'version'}, 'arch' => $p->{'arch'}} unless $binary->{$p->{'binary'}} and vercmp($binary->{$p->{'binary'}->{'version'}}, $p->{'version'}) < 0;

            #next if $pas->{$p->{'binary'}} && pasignore($pas->{$p->{'binary'}}, $arch);
            next if $p->{'arch'} eq 'all';
            next unless $srcs->{$p->{'source'}};
            $srcs->{$p->{'source'}}->{'compiled'} = 1;
            next unless $srcs->{$p->{'source'}}->{'version'} eq $p->{'version'};
            $srcs->{$p->{'source'}}->{'installed'} = 1;
            next unless $p->{'binnmu'};
            next if ($srcs->{$p->{'source'}}->{'binnmu'}) && ($srcs->{$p->{'source'}}->{'binnmu'} > $p->{'binnmu'});
            $srcs->{$p->{'source'}}->{'binnmu'} = $p->{'binnmu'};
        }
        close $P;
    }

    SRCS:
    for my $k (keys %$srcs) {
        if ($srcs->{$k}->{'installed'}) {
            $srcs->{$k}->{'status'} = 'installed';
            delete $srcs->{$k}->{'installed'};
        } elsif ($srcs->{$k}->{'compiled'}) {
            $srcs->{$k}->{'status'} = 'out-of-date';
        } else {
            $srcs->{$k}->{'status'} = 'uncompiled';
        }
        delete $srcs->{$k}->{'compiled'};
        $srcs->{$k}->{'status'} = 'installed' if $srcs->{$k}->{'arch'} && $srcs->{$k}->{'arch'} eq 'all';

        #my $p = $pas->{$k};
        #$p ||= $pas->{'%'.$k};
        #$srcs->{$k}->{'status'} = 'not-for-us' if pasignore($p, $arch);
        if (pasignore($pas->{'%'.$k}, $arch)) {
            $srcs->{$k}->{'status'} = 'not-for-us';
            next;
        }
        for my $bin (@{$srcs->{$k}->{'binary'}}) {
            next if pasignore($pas->{$bin}, $arch);
            next if $binary->{$bin} and $binary->{$bin}->{'arch'} eq 'all';
            next SRCS;
        }
        $srcs->{$k}->{'status'} = 'not-for-us';
    }
    $srcs->{'_binary'} = $binary;
    local($/) = "\n";

    return \$srcs;
}

sub pasignore {
    my $p = shift;
    my $arch = shift;
    if ($p && $p->{'mode'}) {
        return 1 unless grep { $_ eq $arch } @{$p->{'arch'}};
    }
    if ($p && not $p->{'mode'}) {
        return 1 if grep /^!$arch$/, @{$p->{'arch'}};
    }
    return 0;
}

1;
