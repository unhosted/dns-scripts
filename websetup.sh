sudo mkdir -p /home/rs$2/storage/www/$1.un.ht/
echo "echo \"<html><h1>Welcome to $1.un.ht</h1></html>\" > /home/rs$2/storage/www/$1.un.ht/index.html" | sudo su
ln -s /home/rs$2/storage/www/$1.un.ht /home/michiel/www/$1.un.ht
