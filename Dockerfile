FROM bitnami/redis-cluster:latest

RUN mkdir /opt/bitnami/redis/modules
COPY ./*.so* /opt/bitnami/redis/modules/

USER root
RUN apt-get update && apt-get install libgomp1
COPY redis.conf /opt/bitnami/redis/etc
RUN chmod g+rwX /opt/bitnami/redis/etc/redis.conf

EXPOSE 6379
USER 1001


ENTRYPOINT [ "/opt/bitnami/scripts/redis-cluster/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/redis-cluster/run.sh" ]