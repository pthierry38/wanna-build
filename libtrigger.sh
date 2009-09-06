ARCHS_oldstable="alpha amd64 arm hppa i386 ia64 mips mipsel powerpc s390 sparc"
ARCHS_stable="alpha amd64 arm armel hppa i386 ia64 mips mipsel powerpc s390 sparc"
ARCHS_testing="alpha amd64 armel hppa i386 ia64 mips mipsel powerpc s390 sparc kfreebsd-amd64 kfreebsd-i386"
ARCHS_unstable="$ARCHS_testing"
CURLOPT="-q -s -S -R -f -Y 10 -y 120 -K /srv/wanna-build/trigger.curlrc"

curl_index () {
    local url tmpname destname appendname curlopt
    url="$1"
    destname="$2"
    appendname="$3"
    tmpname=".$destname"
    rc=0
    rm -f "$tmpname"
    if [ -e "$destname" ]; then
	refdate=`perl -e "print scalar gmtime(((stat ('$destname'))[9]))"`
        curl $CURLOPT -z "$refdate" "$url" -o "$tmpname"
        rc=$?
    else
	curl $CURLOPT "$url" -o "$tmpname"
	rc=$?
    fi
    if [ $rc -eq 0 -a -e "$tmpname" ]; then
	if gzip -t "$tmpname"; then
	    mv "$tmpname" "$destname"
	else
	    rc=$?
	fi
    fi
    gzip -dc "$destname" >> "$appendname"
    return $rc
}

