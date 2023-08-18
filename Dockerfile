FROM bitnami/redis:latest

RUN mkdir /opt/bitnami/redis/modules
COPY ./*.so* /opt/bitnami/redis/modules/

USER root
RUN apt-get update && apt-get install libgomp1
COPY redis.conf /opt/bitnami/redis/mounted-etc
RUN chmod g+rwX /opt/bitnami/redis/mounted-etc/redis.conf

EXPOSE 6379
USER 1001
