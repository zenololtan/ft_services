FROM alpine:latest

# Update software packages
RUN		apk add wget
RUN     apk add libc6-compat
RUN     apk add ca-certificates
RUN     apk add su-exec
RUN     apk add bash

# Install grafana
RUN     wget -c https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz
RUN     tar -xzvf grafana-7.3.7.linux-amd64.tar.gz
RUN     rm grafana-7.3.7.linux-amd64.tar.gz
RUN     mv /grafana-7.3.7 /usr/share/
RUN     mv /usr/share/grafana-7.3.7 /usr/share/grafana

# # RUN apk update && \
# #     apk add wget bash && \
# #     apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# # COPY dashboards/*.json /usr/share/grafana/public/dashboards/

EXPOSE 3000

# WORKDIR /usr/share/grafana/bin
CMD grafana-server

# # CMD [ "grafana-server", "web" ]

# FROM alpine

# RUN apk update && \
#     apk add wget bash && \
#     apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# COPY dashboards/*.json /usr/share/grafana/public/dashboards/

# EXPOSE 3000

# WORKDIR /usr/share/grafana/bin
# CMD grafana-server