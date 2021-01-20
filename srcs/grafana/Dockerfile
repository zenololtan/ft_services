FROM	alpine:3.12

ENV		GRAFANA_VERSION=7.3.3

RUN		apk update && \
		apk upgrade && \
		apk add curl && \
		apk add wget && \
		apk add libc6-compat

RUN		wget https://dl.grafana.com/oss/release/grafana-7.3.3.linux-amd64.tar.gz
RUN 	tar -zxvf grafana-7.3.3.linux-amd64.tar.gz
RUN		rm grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz \
		&& mv /grafana-${GRAFANA_VERSION} /usr/share/ \
		&& mv /usr/share/grafana-${GRAFANA_VERSION} /usr/share/grafana

COPY	srcs/*.json /usr/share/grafana/public/dashboards/
WORKDIR	/usr/share/grafana/bin

EXPOSE	3000

CMD		./grafana-server