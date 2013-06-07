#! /bin/bash

SUBDOMAIN=$1
NS="heahdk.net."
KEYFILE="Kadmin.un.ht.+157+53670.private "

nsupdate -k $KEYFILE -v <<EOF 
server un.ht
zone un.ht
update delete $SUBDOMAIN.un.ht. ANY
show
send
EOF