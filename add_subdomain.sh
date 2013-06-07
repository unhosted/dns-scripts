#! /bin/bash

SUBDOMAIN=$1
NS="heahdk.net."
KEYFILE="Kadmin.un.ht.+157+53670.private""

nsupdate -k $KEYFILE -v <<EOF 
server un.ht
zone un.ht
update add $SUBDOMAIN.un.ht. 3600 NS $NS
show
send
EOF