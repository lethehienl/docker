### GUIDE
```
RUN DOCKER IMAGE

    docker build -t lethehienl/centos68db .

RUN DOCKER CONTAINER

    docker run --name docker_db -idt -p 3306:3306  -v \
    /home/hienlt/work/docker/dockerdb/etc/my.cnf:/etc/my.cnf \
    -v /home/hienlt/work/docker/transfer:/transfer   \
    lethehienl/centos68db

Check IP:


docker inspect --format '{{ .NetworkSettings.IPAddress}}' docker_db
172.17.0.2

$ mysql -h 172.17.0.2 -u root -p

```
