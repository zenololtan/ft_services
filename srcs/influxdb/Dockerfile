# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/01/05 14:48:57 by zenotan       #+#    #+#                  #
#    Updated: 2021/01/15 17:45:49 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk add --no-cache influxdb

COPY	srcs/start.sh .
RUN		chmod +x ./start.sh

EXPOSE	8086

CMD		sh start.sh