#!/bin/sh

ARCHES="alpha amd64 arm armel hppa i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc"

rm arches-tables.sql
for arch in $ARCHES; do sed -e "s/ARCH/$arch/g" < arches-tables.in >> arches-tables.sql ; done
