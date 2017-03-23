#!/bin/bash

#docker exec -ti vietlink_db mysqldump -u root -proot docker > transfer/dump.sql
docker stop docker_app
docker stop docker_db
