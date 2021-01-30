# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/24 16:47:51 by zenotan       #+#    #+#                  #
#    Updated: 2021/01/28 00:50:33 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN apk update && \
    apk add nginx && \
    apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip && \
    apk add wget

RUN mkdir www
RUN mkdir -p /run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.1-english.tar.gz
RUN rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english/* /www
RUN rm -rf phpMyAdmin-5.0.1-english
RUN mkdir -p /www/tmp
RUN chmod 777 /www/tmp

COPY	./srcs/config.inc.php /www
COPY	./srcs/nginx.conf /etc/nginx

COPY	srcs/start.sh .
RUN		chmod +x start.sh

RUN adduser -D -g 'www' www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

EXPOSE	5000

CMD		./start.sh