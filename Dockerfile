FROM alpine:3.3
MAINTAINER Georg Koch <dev@codizz.de>

RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD nginx
