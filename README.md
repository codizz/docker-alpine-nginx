![Docker Stars](https://img.shields.io/docker/stars/codizz/nginx.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/codizz/nginx.svg)
[![Image Size](https://img.shields.io/imagelayers/image-size/codizz/nginx/latest.svg)](https://imagelayers.io/?images=codizz/nginx:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/codizz/nginx/latest.svg)](https://imagelayers.io/?images=codizz/nginx:latest)

### doocker-alpine-nginx

This project is a Docker image project for [nginx](http://nginx.org/). The Docker image is based on [docker-alpine](https://github.com/gliderlabs/docker-alpine) v3.3 with installed `nginx` server.

### Dockerfile description

This docker image based on a super small Docker Image [docker-alpine](https://github.com/gliderlabs/docker-alpine) v.3.3.

    FROM alpine:3.3

Nginx server will be installed using Alpine Linux Package Management.

    RUN apk add --update nginx && \
    
After Nginx installation, clean `apk` cache

    rm -rf /var/cache/apk/* && \
    
Access and error log outputs should be forwarded to Docker log collector.

    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

Copy default Nginx Server configuration into the Docker Image.

    COPY nginx.conf /etc/nginx/nginx.conf

Exposing provided ports.

    EXPOSE 80 443

Start Nginx Server on Docker run.

    CMD nginx

### Usage

First start of the image as daemon with default static content:

    $ docker run -d -p 80:80 codizz/nginx

After starting the `nginx` server, try to access the default static content: [http://localhost](http://localhost).
In the console, where you started the Docker container, you see the forwarded `nginx` server log outputs.

Use own server configuration:

    $ docker run -d -p 80:80 -v ./my-nginx.conf:/etc/nginx/nginx.conf:ro codizz/nginx

Use own static content:

    $ docker run -d -p 80:80 -v ./my-index.html:/usr/share/nginx/html/index.html:ro codizz/nginx

Get `nginx` version:

    $ docker run codizz/nginx nginx -v

Get `nginx` help:

    $ docker run codizz/nginx nginx -h

Switch to `shell` process in the running Docker container:

    $ docker run -it codizz/nginx sh

### License

MIT