#!/bin/bash
#USER=$1
set -e
set -x

CONF_DIR=/etc/bind/
CUSTOMERS_DIR=${CONF_DIR}customers/
ZONE_DIR=/var/cache/bind/

TLD=un.ht.
TTL=10

ZONE=$1
ALGORITHM=$2


if [ -z "$ALGORITHM" ]; then
    ALGORITHM=hmac-md5
fi

mkdir -p $CUSTOMERS_DIR
#dnssec-keygen -a HMAC-MD5 -b 512 -n ZONE $ZONE

# creating minimal zonefile
cat > ${ZONE_DIR}db.${ZONE} <<EOF
\$TTL $TTL
$ZONE.$TLD			IN SOA	$ZONE.$TLD admin.un.ht. ( ;FIXME wrong email
				15         ; serial
				3600       ; refresh (1 hour)
				600        ; retry (10 minutes)
				86400      ; expire (1 day)
				600        ; minimum (10 minutes)
				)
@   NS root.un.ht.
@	A	217.11.53.245
EOF

chmod u=rw,g=rw,o= ${ZONE_DIR}db.${ZONE}

/usr/sbin/rndc addzone $ZONE.$TLD "
{                      
  type master;              
  file \"db.${ZONE}\"; 
  allow-update { 
    key \"$ZONE\";
  };
};"

# regenerate customers config
./rebuild_customer_zones.sh

# restart server
#/etc/init.d/bind9 restart
#/usr/sbin/rndc reload
# now done in create_zone.sh
