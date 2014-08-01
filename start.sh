#!/bin/sh

npm install --unsafe-perm
cp -ar ./bower_components/ ./app/bower_components/
npm start --unsafe-perm
