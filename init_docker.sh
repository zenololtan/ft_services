echo removing containers
rm -rf ~/Library/Containers/com.docker.docker
echo linking docker  with goinfre
mkdir ~/goinfre/docker
ln -s ~/goinfre/docker ~/Library/Containers/com.docker.docker

# docker run -p 80:80 -p 443:443 -it test