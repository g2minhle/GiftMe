#!/bin/sh

PATH_TO_NGINX_SRC=./servers/nginx

########### start mongodb ###########
chmod 700 ./servers/mongodb/bin/mongo
gnome-terminal -e "./servers/mongodb/bin/mongod --config ./mongodb_conf/mongodb.conf"

########### start the web server ###########
gnome-terminal -e "./node_modules/http-server/bin/http-server ./app -p 8000"
gnome-terminal -e "./node_modules/http-server/bin/http-server ./app -p 8001"
gnome-terminal -e "./node_modules/http-server/bin/http-server ./app -p 8002"

########### start nginx load balancer server ###########
cd $PATH_TO_NGINX_SRC/bin
chmod 700 ./nginx
gnome-terminal -e "./nginx"

