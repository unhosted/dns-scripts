#!/bin/bash
set -e
CONF_DIR=/etc/bind/
CUSTOMERS_DIR=${CONF_DIR}customers/


TLD=un.ht.
TTL=10

truncate ${CONF_DIR}customers.conf --size 0
chmod u=rw,g=rw,o= ${CONF_DIR}customers.conf
chgrp bind ${CONF_DIR}customers.conf

for i in $CUSTOMERS_DIR*.key; do
echo include \"$i\"\; >> ${CONF_DIR}customers.conf
done