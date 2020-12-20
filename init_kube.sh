rm -rf ~/.minikube
mkdir -p ~/goinfre/.minikube
ln -s ~/goinfre/.minikube ~/.minikube
minikube start --vm-driver=virtualbox \
				--addons enable metalldb \
				--addons dashboard \
				--disk-size='10000mb'