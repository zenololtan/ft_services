# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ztan <ztan@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/13 15:39:00 by ztan          #+#    #+#                  #
#    Updated: 2021/01/15 17:45:56 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

# Setting environment variables
ENV		MYSQL_ROOT_PASSWORD=admin
ENV		MYSQL_DATABASE=wordpress
ENV		MYSQL_USER=admin
ENV		MYSQL_PASSWORD=admin

# Install MariaDB
RUN		apk add --no-cache mysql mysql-client
RUN		addgroup mysql mysql

# copy wordpress database
RUN		mkdir -p /tmp
COPY	srcs/wordpress.sql /tmp/
COPY	srcs/my.cnf /etc/mysql/my.cnf
COPY	srcs/wordpress.sh /tmp/
COPY	srcs/start.sh /tmp/
RUN		chmod +x /tmp/wordpress.sh
RUN		chmod +x /tmp/start.sh

# default port for mysql
EXPOSE	3306

CMD		sh /tmp/start.sh