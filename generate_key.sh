
#!/bin/bash
set -e
set -x

ZONE=$1
TMPFILE=$2
RAND=/dev/urandom # find source of true randomness that is not slow
#find out about diffrent keytype USER/ZONE


/usr/sbin/dnssec-keygen -r $RAND -a HMAC-MD5 -b 512 -n USER $ZONE > $TMPFILE

cat $(cat $TMPFILE).private |grep Key:\ .* | cut -d " " -f 2

