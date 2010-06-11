#!/usr/bin/perl -w -I lib

use Test::More tests => 1;

$src = <<EOF
Package: bash
Binary: bash, bash-static, bash-builtins, bash-doc, bashdb
Version: 4.1-3
Priority: required
Architecture: any
Section: shell

Package: test
Binary: test
Version: 4.1-3
Priority: optional
Architecture: any
Section: shell

Package: nfu
Binary: nfu
Version: 4.1-3
Priority: optional
Architecture: any
Section: shell

Package: all
Binary: all
Version: 4.1-3
Priority: optional
Architecture: all
Section: shell

Package: allbin
Binary: allbin
Version: 4.1-3
Priority: optional
Architecture: all
Section: shell

Package: e2fsprogs
Binary: e2fsck-static
Version: 1.41.12-1
Priority: required
Section: admin
Architecture: any

Package: e2fsprogs
Binary: e2fsck-static
Version: 1.41.11-1
Priority: required
Section: admin
Architecture: any

Package: base-files
Binary: base-files
Version: 5.7
Priority: required
Section: admin
Architecture: i386 all
Build-Depends: debhelper [i386 amd64], bash [!kfreebsd-i386], perl [!i386 !amd64]

Package: pbuilder
Binary: pbuilder, pbuilder-uml
Version: 0.196
Priority: extra
Section: devel
Build-Depends: debhelper (>= 7), docbook-xsl, ldp-docbook-xsl (>= 0.0.20040321-0.1), xsltproc, dpkg-dev (>= 1.13.19), dblatex, debconf | debconf-2.0, po-debconf, po4a
Build-Conflicts: dash
Architecture: all i386 amd64

EOF
;

$bin = <<EOF
Package: base-files
Priority: required
Section: admin
Architecture: i386
Version: 5.6

Package: bash
Source: bash (4.1-3)
Priority: required
Section: shells
Architecture: i386
Version: 4.1-3+b2

Package: bash-static
Priority: required
Section: shells
Architecture: i386
Version: 4.1-3+b1

Package: e2fsprogs
Priority: required
Section: admin
Architecture: i386
Version: 1.41.11-1

Package: all
Version: 4.1-3
Priority: optional
Architecture: all
Section: shell

Package: pbuilder
Priority: extra
Section: devel
Architecture: all
Version: 0.196

EOF
;

$pas = <<EOF
%nfu: amd64 # we fake to be i386 here
e2fsprogs: i386
pbuilder-uml: amd64                                              # depends on user-mode-linux
EOF
;

use WB::QD;
my $srcs = WB::QD::readsourcebins('i386', \$pas, [\$src], [\$bin]);
use Data::Dumper;

#print Dumper $srcs;
is_deeply ($$srcs, {
            'e2fsprogs' => {
                             'priority' => 'required',
                             'status' => 'out-of-date',
                             'version' => '1.41.12-1',
                             'name' => 'e2fsprogs',
                             'section' => 'admin',
                             'binary' => ['e2fsck-static', ],
                           },
            'bash' => {
                        'priority' => 'required',
                        'status' => 'installed',
                        'version' => '4.1-3',
                        'name' => 'bash',
                        'section' => 'shell',
                        'binnmu' => '2',
                             'binary' => ['bash', 'bash-static', 'bash-builtins', 'bash-doc', 'bashdb'],
                      },
            'base-files' => {
                              'priority' => 'required',
                              'status' => 'out-of-date',
                              'version' => '5.7',
                              'name' => 'base-files',
                              'section' => 'admin',
                              'depends' => 'debhelper [i386 amd64], bash [!kfreebsd-i386], perl [!i386 !amd64]',
                             'binary' => ['base-files'],
                            },
            'test' => {
                        'priority' => 'optional',
                        'status' => 'uncompiled',
                        'version' => '4.1-3',
                        'name' => 'test',
                        'section' => 'shell',
                             'binary' => ['test'],
                      },
            'nfu' => {
                        'priority' => 'optional',
                        'status' => 'not-for-us',
                        'version' => '4.1-3',
                        'name' => 'nfu',
                        'section' => 'shell',
                             'binary' => ['nfu'],
                      },
            'pbuilder' => {
                            'priority' => 'extra',
                            'status' => 'not-for-us',
                            'version' => '0.196',
                            'binary' => [
                                          'pbuilder',
                                          'pbuilder-uml'
                                        ],
                            'name' => 'pbuilder',
                            'section' => 'devel',
                            'depends' => 'debhelper (>= 7), docbook-xsl, ldp-docbook-xsl (>= 0.0.20040321-0.1), xsltproc, dpkg-dev (>= 1.13.19), dblatex, debconf | debconf-2.0, po-debconf, po4a',
                            'conflicts' => 'dash'
                          },
            '_binary' => {
                'e2fsprogs' => {'version' => '1.41.11-1', 'arch' => 'i386'},
                'bash' => {'version' => '4.1-3', 'arch' => 'i386'},
                'base-files' => {'version' => '5.6', 'arch' => 'i386'},
                'bash-static' => {'version' => '4.1-3', 'arch' => 'i386'},
                'all' => {'version' => '4.1-3', 'arch' => 'all'},
                'pbuilder' => { 'arch' => 'all', 'version' => '0.196' },
            },
}, 'reading packages');
