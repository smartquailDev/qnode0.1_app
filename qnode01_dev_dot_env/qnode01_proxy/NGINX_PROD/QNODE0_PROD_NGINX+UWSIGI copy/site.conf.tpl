server {
    listen                     80;
    listen                     443 ssl;
    server_name                127.0.0.1 104.131.86.96 qnode01_app ${domain} www.${domain}; 

    ssl_certificate /etc/nginx/sites/ssl/dummy/${domain}/fullchain.pem;
    ssl_certificate_key /etc/nginx/sites/ssl/dummy/${domain}/privkey.pem;

    include /etc/nginx/includes/options-ssl-nginx.conf;

    ssl_dhparam /etc/nginx/sites/ssl/ssl-dhparams.pem;

    include /etc/nginx/includes/hsts.conf;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot/${domain};
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
        uwsgi_pass              qnode01_app:9000;
        include                 /etc/nginx/uwsgi_params;
        client_max_body_size    1000M;
    } 

}


    




