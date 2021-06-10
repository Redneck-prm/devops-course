#!/bin/bash 
docker build --tag nginx_local .
docker run --rm --name helloworld -p 80:80 nginx_local