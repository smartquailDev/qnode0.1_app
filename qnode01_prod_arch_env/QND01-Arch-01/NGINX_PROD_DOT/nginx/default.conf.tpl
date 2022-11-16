server {
    listen 80;
    server_name ${DOMAIN} www.${DOMAIN} 138.197.8.253 127.0.0.1;

    location /.well-known/acme-challenge/ {
        root /vol/www/;
    }

    location /static {
    alias /qnode0.1_app/qnode01_app/staticfiles;
    client_max_body_size    1000M;
     }

    location /media {
    alias  /qnode0.1_app/qnode01_app/media;
    client_max_body_size    1000M;
     }

    location / {
        return 301 https://$host$request_uri;
    }
}

