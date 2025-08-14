FROM bitnamilegacy/redis:7.2.4

RUN mkdir /opt/bitnami/redis/modules
COPY ./*.so* /opt/bitnami/redis/modules/

USER root

RUN apt-get update
RUN apt-get install -y wget

RUN wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb10u6_amd64.deb
RUN dpkg -i libssl1.1_1.1.1n-0+deb10u6_amd64.deb

COPY redis.conf /opt/bitnami/redis/etc
RUN chmod g+rwX /opt/bitnami/redis/etc/redis.conf

EXPOSE 6379
USER 1001
