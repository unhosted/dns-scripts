#!/bin/bash
set -e
set -x

CONF_DIR=/etc/bind
CUSTOMERS_DIR=${CONF_DIR}/customers
DB_DIR=/var/cache/bind

NAME=$1
TLD=un.ht.

rm $CUSTOMERS_DIR/keyfile-$NAME.key
#rm $CUSTOMERS_DIR/zone-$NAME.conf
./rebuild_customer_zones.sh

rm $DB_DIR/db.$NAME

/usr/sbin/rndc delzone $NAME.$TLD
/usr/sbin/rndc reload
