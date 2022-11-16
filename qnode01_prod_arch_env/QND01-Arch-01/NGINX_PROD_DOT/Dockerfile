FROM nginx:1.23.0-alpine

COPY ./nginx/* /etc/nginx/
COPY ./nginx/run.sh /run.sh
COPY ./juansilvaphoto.com/* /etc/letsencrypt/live/juansilvaphoto.com


ENV LISTEN_PORT=80
ENV NGINX_PROXY=http://qnode01_app:9000
ENV APP_HOST=qnode01_app
ENV APP_PORT=9000

USER root

RUN apk add --no-cache openssl bash
RUN chmod +x /run.sh

RUN mkdir -p /qnode0.1_app/qnode01_app/staticfiles && \
    chmod 755 /qnode0.1_app/qnode01_app/staticfiles && \
    mkdir -p /qnode0.1_app/qnode01_app/mediafiles && \
    chmod 755 /qnode0.1_app/qnode01_app/mediafiles && \
    mkdir -p /qnode0.1_app/qnode01_app/media && \
    chmod 755 /qnode0.1_app/qnode01_app/media 

VOLUME /qnode0.1_app/qnode01_app/staticfiles
VOLUME /qnode0.1_app/qnode01_app/mediafiles
VOLUME /vol/www
VOLUME /vol/proxy
VOLUME /etc/letsencrypt

CMD ["/run.sh"]