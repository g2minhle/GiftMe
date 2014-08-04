#!/bin/sh

PATH_TO_NGINX_SRC=./servers/nginx
PATH_TO_CASSANDRA_BIN=./servers/cassandra

########### load cassandra db conf ###########
cp -ar ./cassandra_conf/* $PATH_TO_CASSANDRA_BIN/conf/ 
chmod 700 $PATH_TO_CASSANDRA_BIN/bin/cassandra

########### load web server files ###########
# install the web sever 
npm install --unsafe-perm
# put the right bower_components in the right place
cp -ar ./bower_components/ ./app/bower_components/

########### load nginx conf  ###########
cp ./nginx_conf/* $PATH_TO_NGINX_SRC
cd $PATH_TO_NGINX_SRC
chmod 700 *
./configure --prefix=./ --sbin-path=bin/nginx --conf-path=conf/nginx.conf --pid-path=pid/nginx.pid --error-log-path=logs/error.log --http-log-path=logs/http.log
make
mkdir ./bin
cp ./objs/nginx ./bin/nginx
mkdir ./bin/pid
echo "" > ./bin/pid/nginx.pid
mkdir ./bin/logs
echo "" > ./bin/logs/error.log
echo "" > ./bin/logs/http.log
mkdir ./bin/conf
cat nginx.conf > ./bin/conf/nginx.conf
chmod 700 ./bin/nginx