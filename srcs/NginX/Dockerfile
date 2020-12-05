# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/01 15:31:31 by zenotan       #+#    #+#                  #
#    Updated: 2020/12/01 17:52:31 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#		src: https://wiki.alpinelinux.org/wiki/Nginx
#		importing os && upgrading
FROM	alpine:latest

#		install nginx
RUN		apk update
RUN		apk add nginx

#		create new user and group
RUN		adduser -D -g 'www' www
#		create dir for html files
RUN		mkdir /www && \
			chown -R www:www /var/lib/nginx && \
			chown -R www:www /www

#		creating a config
copy	nginx.conf /etc/nginx/