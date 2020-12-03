#create a storage in goinfre
rm -rf ~/.minikube
mkdir -p ~/goinfre/.minikube
ln -s ~/goinfre/.minikube ~/.minikube
#

minikube delete

minikube start \
--vm-driver=virtualbox \
--addons metalldb \
--addons ingress \
--addons dashboard \
--addons metrics-server \
--disk-size='10000mb'

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f srcs/metallb.yaml

docker pull nginx
docker run docker.io/library/nginx:latest

kubectl create -f nginx.yaml
kubectl describe deployment nginx