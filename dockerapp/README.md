### create docker image :
*    docker build -t lethehienl/centos68 .

### Build docker web container :
```

       docker run -d -p 80:80 -p 8443:443 \
        -v /home/hienlt/work/docker/dockerapp/conf/etc/httpd/conf.d:/etc/httpd/conf.d \
        -v /home/hienlt/work/docker/dockerapp/conf/etc/httpd/conf:/etc/httpd/conf \
        -v /home/hienlt/work/docker/dockerapp/conf/etc/php.ini:/etc/php.ini \
        -v /home/hienlt/work/docker/dockerapp/conf/etc/hosts:/etc/hosts  \
        -v /home/hienlt/work/docker/transfer:/transfer   \
        --name docker_app lethehienl/centos68

```

### Check IP:
```
    docker inspect --format '{{ .NetworkSettings.IPAddress}}' docker_db
    172.17.0.3
    $ mysql -h 172.17.0.3 -u root -p
```
