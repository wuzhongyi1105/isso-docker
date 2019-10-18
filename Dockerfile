FROM alpine:3.9

ENV ISSO_SETTINGS /opt/isso/isso.conf

RUN apk upgrade --update \
 && apk add -t build-dependencies \
    python3-dev \
    libffi-dev \
    build-base \
 && apk add \
    python3 \
    sqlite \
    openssl \
    ca-certificates \
 && pip3 install isso gunicorn gevent \
 && mkdir -p /opt/isso \
 && wget -O /opt/isso/isso.conf https://raw.githubusercontent.com/posativ/isso/master/share/isso.conf \
 && apk del build-dependencies \
 && rm -rf /tmp/* /var/cache/apk/*

VOLUME /opt/issodb /opt/isso

EXPOSE 8080

CMD /usr/bin/gunicorn isso.dispatch -b 0.0.0.0:8080 -w 4
