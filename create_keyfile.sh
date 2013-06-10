
set -x
set -e

CUSTOMERS_DIR=/etc/bind/customers
ZONE=$1
KEY=$2

#creating keyfile
cat > ${CUSTOMERS_DIR}/keyfile-$ZONE.key <<EOF
key "$ZONE" {
        algorithm $ALGORITHM;
        secret "$KEY";
};
EOF

chmod u=rw,g=rw,o= ${CUSTOMERS_DIR}/keyfile-$ZONE.key

