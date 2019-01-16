# isso-docker

Docker Image for [isso](https://posativ.org/isso/) - A commenting server similar to Disqus

## Default usage:

```
docker run --name bind -d -p 8080:8080 \
-v /isso/isso.conf:/opt/isso/isso.conf \
-v /isso/data:/opt/issodb \
--restart=always luizeof/isso-docker:latest
```

## Docker-compose:
```
version: '2'
services:
    isso:
      image: luizeof/isso-docker:latest
      ports:
        - "8080:8080"
      volumes:
        - /isso/isso.conf:/opt/isso/isso.conf
        - /isso/data:/opt/issodb
      restart: always
```

```
docker-compose up -d
```

## Configuring isso Instance

There are some minimal configuration for *isso* work at [https://posativ.org/isso/docs/configuration/server/](https://posativ.org/isso/docs/configuration/server/)

```
# file: isso.conf
[general]
dbpath = /opt/issodb/comments.db
host = https://example.tld/
[server]
listen = http://0.0.0.0:8080
```
