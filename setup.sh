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
docker build -t ft_nginx ./srcs/nginx/
kubectl apply -f srcs/yaml/nginx.yaml

#mysql
docker build -t ft_mysql ./srcs/mysql/
kubectl apply -f srcs/yaml/mysql.yaml

#wordpress
docker build -t ft_wordpress ./srcs/wordpress/
kubectl apply -f srcs/yaml/wordpress.yaml

#phpmyadmin
docker build -t ft_phpmyadmin ./srcs/phpmyadmin/
kubectl apply -f srcs/yaml/phpmyadmin.yaml

#ftps

# ---------------------------MINIKUBE DASHBOARD---------------------
minikube dashboard