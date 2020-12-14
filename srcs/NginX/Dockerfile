# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/01 15:31:31 by zenotan       #+#    #+#                  #
#    Updated: 2020/12/14 14:18:02 by ztan          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#		src: https://wiki.alpinelinux.org/wiki/Nginx
#		importing os && upgrading
FROM	alpine:latest

#		install nginx
RUN		apk update
RUN		apk add nginx
RUN		apk add openssh
RUN		apk add openssl
# idk why you have to do this
RUN		mkdir /var/run/nginx/

#		create new user and group for nginx, group off www for web
RUN		adduser -D -g 'www' www
#		create dir for html files
RUN		mkdir /www \
		&& chown -R www:www /var/lib/nginx \
		&& chown -R www:www /www

#		create new user for openssh
#		https://medium.com/@leicao.me/how-to-ssh-into-a-docker-container-remotely-as-root-or-a-non-root-user-b2105c797273
RUN		addgroup sshgroup \
		&& adduser -D ztan \
		&& echo "ztan:lmao" | chpasswd
RUN		ssh-keygen -A

#		https://stackoverflow.com/questions/44047315/generate-a-self-signed-certificate-in-docker
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=NL/ST=Noord-Holland/O=Codam/CN=services' -keyout /etc/ssl/services.key -out /etc/ssl/services.crt

COPY	srcs/nginx.conf /etc/nginx/
COPY	srcs/sshd_config /etc/ssh/sshd_config
COPY	setup.sh .
COPY	srcs/index.html /www
COPY	srcs/style.css /www

EXPOSE	80 443 22000

RUN		chmod 777 setup.sh
CMD		./setup.sh