# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/01/05 14:46:09 by zenotan       #+#    #+#                  #
#    Updated: 2021/01/05 15:34:58 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk add --no-cache wget

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN     tar -xzvf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN		chmod +x telegraf/*
RUN		cp telegraf/telegraf /usr/bin/
RUN		rm -rf *.tar.gz* telegraf/

EXPOSE	8125

COPY	srcs/start.sh .
RUN		chmod +x ./start.sh

CMD		sh start.sh