# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ztan <ztan@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/14 13:47:26 by ztan          #+#    #+#                  #
#    Updated: 2020/12/14 18:47:29 by ztan          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# https://wiki.alpinelinux.org/wiki/WordPress
FROM	alpine:latest

RUN		apk update

RUN		apk add --no-cache wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		mkdir -p /usr/share/webapps/
RUN		wget -c https://wordpress.org/latest.tar.gz
RUN		tar -xzvf latest.tar.gz -C /usr/share/webapps/
RUN		rm latest.tar.gz

COPY	srcs/wp-config.php /usr/share/webapps/wordpress/wp-config.php
COPY	srcs/start.sh .
RUN		chmod +x ./start.sh

EXPOSE	5050
