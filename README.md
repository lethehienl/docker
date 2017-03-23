* I'm study from community =>  i want to send my thinkings
### Introdutions
* Base on Centos 6.8
* Dockerfile
* build two docker iamges : one for app , one for db
* Docker app: APACHE2 , PHP 7 + nano vim + mysql client + composer + supervisor
* Docekr db: mysql 5.6 + vim + nano + supervisor
### Build Docker
```
Step1: Create dockerfile
step2: build iamge:
- docker build -t lethehienl/centos68 .
- docker build -t lethehienl/centos68db .
step3: PUSH TO DOCKER HUB
	docker images
	docker tag d16964ffefb1 lethehienl/centos68:latest
	docker login
	docker push lethehienl/centos68


step4: Build Container:
- docker_app
 docker run -d -p 80:80 -p 8443:443 \
        -v /home/hienlt/work/docker/dockerapp/conf/etc/httpd/conf.d:/etc/httpd/conf.d \
        -v /home/hienlt/work/docker/dockerapp/conf/etc/httpd/conf:/etc/httpd/conf \
        -v /home/hienlt/work/docker/dockerapp/conf/etc/php.ini:/etc/php.ini \
        -v /home/hienlt/work/docker/dockerapp/conf/etc/hosts:/etc/hosts  \
        -v /home/hienlt/work/docker/transfer:/transfer   \
        --name docker_app lethehienl/centos68
- docker_db
 docker run --name docker_db -idt -p 3306:3306  \
 -v /home/hienlt/work/docker/dockerdb/etc/my.cnf:/etc/my.cnf \
 -v /home/hienlt/work/docker/transfer:/transfer   \
 lethehienl/centos68db

step5: setup app remote to db
    docker inspect --format '{{ .NetworkSettings.IPAddress}}' docker_db
    172.17.0.2
    $ mysql -h 172.17.0.2 -u root -p

    Database information
    host: 172.17.0.2
    username: root
    pass: root
    port: 3306
    database: docker

-> Default IP : 172.17.0.2
Step6: Copy source code to projects folder into dockerapp
step7: create host : docker.local
step8:  Goto: docker.local/
```
### Use Docker
```
## Check docker:
* docker ps

## SSH Docker
* docker exec -ti [DOCKER_NAME] bash
* ex: * docker exec -ti docker_app bash

## ISSUE not found app as nano or vim
* export TERM=xterm

Start docker
RUN: ./start.sh

Stop docker
RUN: ./stop

Export database
docker exec -ti docker_db mysqldump -u root -p docker > transfer/dump.sql
Import database:
docker exec -ti docker_db mysql -u root -p docker < transfer/dump.sql

REBUILD DOCKER WHEN we need change some things about enviroment
 Method 1:
 - update docker file:
 - run: docker build --no-cache=true -t lethehienl/centos68  .
 - commit change to docker hub (docker push again)
    docker tag 013a473a2569 lethehienl/centos68:latest
    docker login
    docker push lethehienl/centos68
 Method 2 update  from container's change
 https://docs.docker.com/engine/reference/commandline/commit/#description

```
