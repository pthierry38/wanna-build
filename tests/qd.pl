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

Package: autonfu
Binary: autonfu
Version: 1.41.11-1
Priority: required
Section: admin
Architecture: amd64

Package: autonfu1
Binary: autonfu1
Version: 1.41.11-1
Priority: required
Section: admin
Architecture: linux-any

Package: lv2core
Binary: lv2core
Version: 4.0-5
Priority: optional
Section: sound
Architecture: any

Package: haskell-haxr
Binary: libghc6-haxr-prof
Version: 3000.2.1-2
Priority: extra
Section: haskell
Architecture: any

Package: haskall-dummy
Binary: libghc6-haxr-prof
Version: 1:3
Priority: extra
Section: haskell
Architecture: all

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

Package: lv2core
Priority: optional
Section: sound
Installed-Size: 112
Architecture: all
Version: 3.0-3

Package: libghc6-haxr-prof
Version: 1:3
Priority: extra
Section: haskell
Architecture: all

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
            'haskall-dummy' => {
                                 'priority' => 'extra',
                                 'status' => 'arch-all-only',
                                 'version' => '1:3',
                                 'binary' => [
                                               'libghc6-haxr-prof'
                                             ],
                                 'name' => 'haskall-dummy',
                                 'section' => 'haskell'
                               },
            'all' => {
                       'priority' => 'optional',
                       'status' => 'arch-all-only',
                       'version' => '4.1-3',
                       'binary' => [
                                     'all'
                                   ],
                       'name' => 'all',
                       'section' => 'shell'
                     },
            'allbin' => {
                          'priority' => 'optional',
                          'status' => 'arch-all-only',
                          'version' => '4.1-3',
                          'binary' => [
                                        'allbin'
                                      ],
                          'name' => 'allbin',
                          'section' => 'shell'
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
                        'status' => 'packages-arch-specific',
                        'version' => '4.1-3',
                        'name' => 'nfu',
                        'section' => 'shell',
                             'binary' => ['nfu'],
                      },
            'autonfu' => {
                        'priority' => 'required',
                        'status' => 'arch-not-in-arch-list',
                        'version' => '1.41.11-1',
                        'name' => 'autonfu',
                        'section' => 'admin',
                             'binary' => ['autonfu'],
                      },
            'autonfu1' => {
                        'priority' => 'required',
                        'status' => 'uncompiled',
                        'version' => '1.41.11-1',
                        'name' => 'autonfu1',
                        'section' => 'admin',
                             'binary' => ['autonfu1'],
                      },
            'pbuilder' => {
                            'priority' => 'extra',
                            'status' => 'packages-arch-specific',
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
            'lv2core' => {
                'priority' => 'optional',
                'status' => 'uncompiled',
                'version' => '4.0-5',
                'binary' => [
                        'lv2core'
                      ],
                'name' => 'lv2core',
                'section' => 'sound'
            },
            'haskell-haxr' => {
                'priority' => 'extra',
                'status' => 'overwritten-by-arch-all',
                'version' => '3000.2.1-2',
                'binary' => [
                        'libghc6-haxr-prof'
                      ],
                'name' => 'haskell-haxr',
                'section' => 'haskell'
            },
            '_binary' => {
                'e2fsprogs' => {'version' => '1.41.11-1', 'arch' => 'i386'},
                'bash' => {'version' => '4.1-3', 'arch' => 'i386'},
                'base-files' => {'version' => '5.6', 'arch' => 'i386'},
                'bash-static' => {'version' => '4.1-3', 'arch' => 'i386'},
                'all' => {'version' => '4.1-3', 'arch' => 'all'},
                'pbuilder' => { 'arch' => 'all', 'version' => '0.196' },
                'libghc6-haxr-prof' => { 'arch' => 'all', 'version' => '1:3' },
            },
}, 'reading packages');
