ssh bind_admin@heahdk.net "cd dns-scripts; ./create_zone.sh $1" | head -1
/home/customer-backend/add_subdomain.sh $1 > /dev/null
#sudo /usr/sbin/adduser --disabled-password --disabled-login --gecos '' --uid $2 rs$2
#ssh web_admin@heahdk.net "./create_site.sh $1 $2"
