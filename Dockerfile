FROM ubuntu

WORKDIR /
RUN mkdir /etc/aria2
COPY ./aria2/ /etc/aria2/
RUN apt-get update \
    && apt-get -y install --no-install-recommends aria2 nginx \
    && mkdir /data \
    && chmod -R 777 /etc/aria2/ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 
CMD aria2c --conf-path=/etc/aria2/aria2.conf -D && nginx -g "daemon off;"
