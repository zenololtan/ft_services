# #create a storage in goinfre
# rm -rf ~/.minikube
# mkdir -p ~/goinfre/.minikube
# ln -s ~/goinfre/.minikube ~/.minikube
# #

# minikube delete

# minikube start \
# --vm-driver=virtualbox \
# # --addons metallb \
# # --addons dashboard \
# # --addons metrics-server \
# --disk-size=5gb

# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
# # kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# kubectl create -f srcs/metallb.yaml

# # docker pull nginx
# # docker run docker.io/library/nginx:latest

# kubectl create -f srcs/nginx.yaml
# # kubectl describe deployment nginx

# kubectl dashboard



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
docker build -t my_nginx ./srcs/nginx/

# deployment nginx
kubectl apply -f srcs/NginX/nginx.yaml

minikube dashboard