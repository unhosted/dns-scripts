ssh bind_admin@heahdk.net "cd dns-scripts; ./create_zone.sh $1" | head -1
./add_subdomain.sh $1 > /dev/null
