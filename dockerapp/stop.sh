#!/bin/bash

docker exec -ti docker_db mysqldump -u root -proot docker > transfer/dump.sql
docker stop docker_app