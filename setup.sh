#!/bin/bash
# creat link in goinfre to save memory
# rm -rf ~/.minikube
# mkdir -p ~/goinfre/.minikube
# ln -s ~/goinfre/.minikube ~/.minikube
# minikube stop

minikube delete

minikube start --vm-driver=virtualbox --disk-size=5GB

# ---------------------------ADD MINIKUBE ADDONS--------------------
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

# ---------------------------DEPLOY METALLB-------------------------
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/yaml/metallb.yaml

# ---------------------------CONNECT MINIKUBE TO DOCKER-------------
eval $(minikube docker-env)

# ---------------------------DEPLOY SECRETS-------------------------
kubectl apply -f srcs/secret.yml

# ---------------------------DEPLOY SERVICES------------------------

#nginx
docker build -qt ft_nginx ./srcs/nginx/
kubectl apply -f srcs/yaml/nginx.yaml

#mysql
docker build -qt ft_mysql ./srcs/mysql/
kubectl apply -f srcs/yaml/mysql.yaml

#wordpress
docker build -qt ft_wordpress ./srcs/wordpress/
kubectl apply -f srcs/yaml/wordpress.yaml

#phpmyadmin
docker build -qt ft_phpmyadmin ./srcs/phpmyadmin/
kubectl apply -f srcs/yaml/phpmyadmin.yaml

#ftps
docker build -qt ft_ftps ./srcs/ftps/
kubectl apply -f srcs/yaml/ftps.yaml

#influxDB
docker build -qt ft_influxdb ./srcs/influxdb/
kubectl apply -f srcs/yaml/influxdb.yaml

#telegraf
docker build -qt ft_telegraf ./srcs/telegraf/
kubectl apply -f srcs/yaml/telegraf.yaml

#grafana
docker build -qt ft_grafana ./srcs/grafana/
kubectl apply -f srcs/yaml/grafana.yaml

# # ---------------------------MINIKUBE DASHBOARD---------------------
minikube dashboard