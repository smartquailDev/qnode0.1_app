FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="smartquail.io"



COPY default.conf /etc/nginx/conf.d/
COPY gzip.conf options-ssl-nginx.conf hsts.conf /etc/nginx/includes/
COPY hsts.conf /etc/nginx/
COPY site.conf.tpl /customization/
COPY run.sh /customization/





COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

EXPOSE 80

ENV LISTEN_PORT=80
ENV NGINX_PROXY=http://qnode01_app:9000
#ENV APP_HOST=qnode01_app
#ENV APP_PORT=9000


USER root
RUN apk add --no-cache openssl
RUN  chmod +x /customization/run.sh

RUN mkdir -p /qnode0.1_app/qnode01_app/staticfiles && \
    chmod 755 /qnode0.1_app/qnode01_app/staticfiles && \
    mkdir -p /qnode0.1_app/qnode01_app/mediafiles && \
    chmod 755 /qnode0.1_app/qnode01_app/mediafiles 
  

VOLUME /qnode0.1_app/qnode01_app/staticfiles
VOLUME /qnode0.1_app/qnode01_app/mediafiles

USER root
#ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/customization/run.sh"]