# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ztan <ztan@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/13 15:39:00 by ztan          #+#    #+#                  #
#    Updated: 2021/02/03 19:13:39 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN	apk add mysql mysql-client
RUN rm -f /var/cache/apk/*

COPY srcs/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh
COPY srcs/my.cnf /etc/
# VOLUME /var/lib/mysql

EXPOSE	3306

CMD sh /tmp/init.sh