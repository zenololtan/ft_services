# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ztan <ztan@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/14 13:47:26 by ztan          #+#    #+#                  #
#    Updated: 2021/01/30 16:57:12 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# https://wiki.alpinelinux.org/wiki/WordPress
FROM	alpine:3.12

RUN		apk update

RUN apk add nginx && \
    apk add curl wget gettext bash \
    php7-common php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
    php7-phar php7-cli php7-zip php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
    php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom mysql-client

RUN adduser -D -g 'www' www
RUN mkdir www
RUN mkdir -p /run/nginx

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp && chown www:www /usr/bin/wp

RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz -C /www
RUN rm -f latest.tar.gz
RUN chown -R www:www /www/*
RUN chown -R www:www /tmp

COPY	srcs/nginx.conf etc/nginx
COPY srcs/wp-config.php /tmp/wp-config.php
RUN cp /tmp/wp-config.php /www/wordpress/wp-config.php
COPY	srcs/start.sh .
COPY srcs/wpinstall.sh .
RUN		chmod +x ./start.sh
RUN		chmod +x ./wpinstall.sh
RUN rm /tmp/wp-config.php


EXPOSE	5050

CMD		sh ./start.sh