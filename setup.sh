#!/bin/bash
# creat link in goinfre to save memory
# rm -rf ~/.minikube
# mkdir -p ~/goinfre/.minikube
# ln -s ~/goinfre/.minikube ~/.minikube
# minikube stop

minikube delete

minikube start --vm-driver=virtualbox --disk-size=5GB

#enable necessary addons
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

# On first install only create the matallb scret memberlist
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

# set up minikube docker (env check if they are added)
eval $(minikube docker-env)

#nginx image
docker build -t ft_nginx ./srcs/nginx/

# deployment nginx
kubectl apply -f srcs/nginx/nginx.yaml

minikube dashboard