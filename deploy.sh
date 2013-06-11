ssh bind_admin@heahdk.net "cd dns-scripts; ./create_zone.sh $1" | head -1
./add_subdomain.sh $1 > /dev/null
#ssh root@heahdk.net "useradd $2"
#ssh web_admin@heahdk.net "./create_site.sh $1 $2"
