# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: zenotan <zenotan@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2021/01/07 11:57:10 by zenotan       #+#    #+#                  #
#    Updated: 2021/01/19 17:13:57 by zenotan       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN apk upgrade && \
    apk --update --no-cache add \
    openssl \
    vsftpd

RUN openssl req -x509 -nodes -newkey rsa:4096 -days 365 -subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=vsftpd' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

RUN mkdir -p /var/ftps

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh

EXPOSE 20 21 30000

ENTRYPOINT ["/tmp/setup.sh"] 
# run a shell witouth command :o