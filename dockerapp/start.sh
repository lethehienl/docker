#!/bin/bash
docker run -d -p 81:80 -p 8443:443  \
 -v /home/hienlt/work/docker/dockerapp/projects:/var/www/html \
 -v /home/hienlt/work/docker/dockerapp/conf/etc/httpd/conf.d:/etc/httpd/conf.d \
 -v /home/hienlt/work/docker/dockerapp/conf/etc/httpd/conf:/etc/httpd/conf \
 -v /home/hienlt/work/docker/dockerapp/conf/etc/php.ini:/etc/php.ini \
 -v /home/hienlt/work/docker/dockerapp/conf/etc/hosts:/etc/hosts   \
 -v /home/hienlt/work/docker/transfer:/transfer   \
 --name docker_app lethehienl/centos68
# docker run -d -p 80:80 -p 3306:3306 -v E:/projects/laravel/projects:/var/www/html -v E:/projects/laravel/etc/hosts:/etc/hosts -v E:/projects/laravel/etc/apache2/sites-enabled:/etc/apache2/sites-enabled -v E:/projects/laravel/etc/mysql:/etc/mysql --name lavarel lethehienl/hienlt

#-v /home/hienlt/work/docker/conf/etc/httpd/conf.d:/etc/httpd/conf.d
# docker cp etc/hosts lavarel:/etc/hosts
