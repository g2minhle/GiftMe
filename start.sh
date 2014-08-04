#!/bin/sh

PATH_TO_NGINX_SRC=./servers/nginx
PATH_TO_CASSANDRA_BIN=./servers/cassandra

########### start cassandra db  ###########
chmod 700 $PATH_TO_CASSANDRA_BIN/bin/cassandra
gnome-terminal -e "$PATH_TO_CASSANDRA_BIN/bin/cassandra -f"

########### start the web server ###########
gnome-terminal -e "./node_modules/http-server/bin/http-server ./app -p 8000"
gnome-terminal -e "./node_modules/http-server/bin/http-server ./app -p 8001"
gnome-terminal -e "./node_modules/http-server/bin/http-server ./app -p 8002"

########### start nginx load balancer server ###########
cd $PATH_TO_NGINX_SRC/bin
chmod 700 ./nginx
gnome-terminal -e "./nginx"

