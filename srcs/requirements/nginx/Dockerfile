FROM debian:buster
LABEL maintainer="mpeharpr <mpeharpr@student.s19.be>"

RUN apt-get update && apt-get install -y nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout /etc/ssl/private/mpeharpr.key \
    -out /etc/ssl/certs/mpeharpr.crt \
    -subj "/C=BE/ST=BECentral/L=Brussels/O=wordpress/OU=mpeharpr/CN=mpeharpr.42.fr"

COPY tools/default.conf /etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
