#!/bin/bash
set -e
CONF_DIR=/etc/bind/
CUSTOMERS_DIR=${CONF_DIR}customers/

NAME=$1

rm $CUSTOMERS_DIR/keyfile-$NAME.conf
rm $CUSTOMERS_DIR/zone-$NAME.conf

./rebuild_customer_zones.sh