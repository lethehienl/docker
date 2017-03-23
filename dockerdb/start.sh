#!/bin/bash
docker run --name docker_db -idt -p 3306:3306  \
-v /home/hienlt/work/docker/dockerdb/etc/my.cnf:/etc/my.cnf \
-v /home/hienlt/work/docker/transfer:/transfer   \
lethehienl/centos68db
