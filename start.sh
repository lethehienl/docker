#!/bin/bash
docker run --name docker_db -idt -p 3306:3306  \
-v /home/hienlt/work/docker/dockerdb/etc/my.cnf:/etc/my.cnf \
-v /home/hienlt/work/docker/transfer:/transfer   \
lethehienl/centos68db


docker run -d -p 81:80 -p 8443:443  \
 -v /home/hienlt/work/docker/projects:/var/www/html \
 -v /home/hienlt/work/docker/dockerapp/conf/etc/httpd/conf.d:/etc/httpd/conf.d \
 -v /home/hienlt/work/docker/dockerapp/conf/etc/httpd/conf:/etc/httpd/conf \
 -v /home/hienlt/work/docker/dockerapp/conf/etc/php.ini:/etc/php.ini \
 -v /home/hienlt/work/docker/dockerapp/conf/etc/hosts:/etc/hosts   \
 -v /home/hienlt/work/docker/transfer:/transfer   \
 --name docker_app lethehienl/centos68




