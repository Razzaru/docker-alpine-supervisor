FROM alpine:3.4

ENV SUPERVISOR_CONF_DIR=/etc/supervisor.d
ENV SUPERVISOR_CONF_FILE=/etc/supervisord.conf

RUN apk add --update --no-cache supervisor

RUN mkdir -p $SUPERVISOR_CONF_DIR
RUN mkdir -p /var/log/supervisor

COPY ./docker/supervisord.conf /etc/supervisord.conf
COPY ./docker/supervisor.d/* /etc/supervisor.d

VOLUME $SUPERVISOR_CONF_DIR

ENTRYPOINT supervisord -n -c $SUPERVISOR_CONF_FILE
