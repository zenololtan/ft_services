# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/01/05 14:48:57 by zenotan       #+#    #+#                  #
#    Updated: 2021/01/19 17:12:14 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

# RUN		apk add --no-cache influxdb

# COPY	srcs/start.sh .
# RUN		chmod +x ./start.sh

# EXPOSE	8086

# CMD		sh start.sh

RUN apk upgrade && \
    apk add influxdb

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf