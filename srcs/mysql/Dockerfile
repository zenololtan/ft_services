# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ztan <ztan@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/13 15:39:00 by ztan          #+#    #+#                  #
#    Updated: 2021/02/02 19:29:25 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

# # Install MariaDB
# RUN		apk add --no-cache mysql mysql-client
# RUN		addgroup mysql mysql

# # copy wordpress database
# RUN		mkdir -p /tmp
# COPY	srcs/wordpress.sql /tmp/
# COPY	srcs/my.cnf /etc/mysql/my.cnf
# COPY	srcs/start.sh /tmp/
# COPY	srcs/start2.sh /tmp/
# RUN		chmod +x /tmp/start.sh
# RUN		chmod +x /tmp/start2.sh

# # default port for mysql
# EXPOSE	3306

# CMD		sh /tmp/start.sh

RUN	apk add mysql mysql-client
RUN rm -f /var/cache/apk/*

COPY srcs/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh
COPY srcs/my.cnf /etc/
# VOLUME /var/lib/mysql

EXPOSE	3306

CMD sh /tmp/init.sh