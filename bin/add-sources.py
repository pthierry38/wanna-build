#!/usr/bin/python

# Given as input a Packages and a Sources file, produces as output a new
# Packages containing fake packages which are installable if and only if the
# corresponding source package has satisfiable build dependencies.

# Copyright (C) 2008 Stefano Zacchiroli <zack@debian.org>
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.

# $Id: add-sources.py 5957 2008-08-16 18:32:17Z zack $

import string
import sys

from optparse import OptionParser
from debian_bundle import deb822

usage = 'Usage: cat Packages | add-sources [OPTION...] Sources ARCH > Packages.new'
cli = OptionParser(usage=usage)
cli.add_option('-p', '--prefix', dest='prefix', default='source---',
        help='set the prefix for fake source packages to PREFIX (default: source---)',
        metavar='PREFIX')
(options, args) = cli.parse_args()
if len(args) != 2:
    cli.print_help()
    sys.exit(2)
sources_file = args[0]
architecture = args[1]

def pkg_of_src(src):
    global architecture, options
    pkg = deb822.Packages()
    pkg['Package'] = options.prefix + src['Package']

    def dep_for_me(dep):
        for_me = None
        if dep['arch'] is None:
            for_me = True
        elif dep['arch']:
            (polarity, _) = dep['arch'][0]
            if polarity:    # list is inclusive
                for_me = (True, architecture) in dep['arch']
            else:   # list is exclusive
                for_me = not ((False, architecture) in dep['arch'])
        else:
            for_me = False
        return for_me

    def mk_bin_rels(fields, relations):
        def strip_arch(dep):
            dep['arch'] = None
            return dep

        def get_rels(fields, relations):
            rels = []
            for name in fields:
                if relations.has_key(name):
                    rels.extend(relations[name])
            return rels

        src_rels = get_rels(fields, relations)
        bin_rels = []
        for or_deps in src_rels:
            my_or_deps = map(strip_arch, filter(dep_for_me, or_deps))
            if my_or_deps:
                bin_rels.append(my_or_deps)

        return bin_rels

    def str_of_relations(rels):
        # XXX this is cut and paste from python-debian's deb822.py, more
        # precisely it matches the str() method of the PkgRelation class
        # TODO to be removed as soon as python-debian 0.1.12 hits unstable
        def pp_arch(arch_spec):
            (excl, arch) = arch_spec
            if excl:
                return arch
            else:
                return '!' + arch
        def pp_atomic_dep(dep):
            s = dep['name']
            if dep.has_key('version') and dep['version'] is not None:
                s += ' (%s %s)' % dep['version']
            if dep.has_key('arch') and dep['arch'] is not None:
                s += ' [%s]' % string.join(map(pp_arch, dep['arch']))
            return s
        pp_or_dep = lambda deps: string.join(map(pp_atomic_dep, deps), ' | ')
        return string.join(map(pp_or_dep, rels), ', ')

    for field in ['Version', 'Priority', 'Section', 'Maintainer']:
        if src.has_key(field):
            pkg[field] = src[field]
    bin_depends = mk_bin_rels(['build-depends', 'build-depends-indep'],
            src.relations)
    if bin_depends:
        #pkg['Depends'] = deb822.PkgRelation.str(bin_depends)
        pkg['Depends'] = str_of_relations(bin_depends)
    bin_conflicts = mk_bin_rels(['build-conflicts', 'build-conflicts-indep'],
            src.relations)
    if bin_conflicts:
        #pkg['Conflicts'] = deb822.PkgRelation.str(bin_conflicts)
        pkg['Conflicts'] = str_of_relations(bin_conflicts)
    pkg['Description'] = 'dummy counterpart of "%s" source package' % \
            src['Package']
    pkg['Description'] += "\n I don't exist, go away."
    pkg['Architecture'] = 'all'

    return pkg

#for pkg in deb822.Packages.iter_paragraphs(sys.stdin):
for line in sys.stdin:
    print line,
print
for src in deb822.Sources.iter_paragraphs(file(sources_file)):
    if src['Architecture'] in ['any', 'all'] \
            or architecture in src['Architecture'].split():
        pkg = pkg_of_src(src)
        print pkg

