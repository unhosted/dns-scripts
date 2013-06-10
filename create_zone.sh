#!/bin/bash

set -e
set -x

ZONE=$1
if [ -z "$ZONE" ] ; then
  echo "No zone name given :P"
  exit 127
fi

TMPFILE=$$-keygen.tmp

./generate_key.sh $ZONE $TMPFILE

./add_zone.sh $ZONE

# have to find out how jobcontrole works in sh script

KEY=$($(cat $TMPFILE).private |grep Key:\ .* | cut -d " " -f 2 )
./create_keyfile.sh $ZONE $KEY

#tidy up
rm $TMPFILE
/usr/sbin/rndc reload

echo $KEY
