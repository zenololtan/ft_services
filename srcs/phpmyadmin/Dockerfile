# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/24 16:47:51 by zenotan       #+#    #+#                  #
#    Updated: 2020/12/24 16:53:01 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk update \
		&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip \
		&& mkdir www

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz \
		&& tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www \
		&& mkdir /www/tmp \
		&& chmod 777 /www/tmp

COPY	config.inc.php /www

COPY	start.sh .
RUN		chmod +x start.sh

EXPOSE	5000

CMD		./start.sh