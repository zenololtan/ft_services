# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/01/05 14:46:09 by zenotan       #+#    #+#                  #
#    Updated: 2021/01/19 17:37:26 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk add --no-cache wget

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN     tar -xzvf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN		chmod +x telegraf/*
RUN		cp telegraf/telegraf /usr/bin/
RUN		rm -rf *.tar.gz* telegraf/

EXPOSE	4999

COPY	srcs/start.sh .
RUN		chmod +x ./start.sh

CMD		sh start.sh

# RUN apk upgrade
# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# EXPOSE 4999

# CMD telegraf