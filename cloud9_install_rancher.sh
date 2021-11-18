#!/bin/bash

echo "Instalando o Rancher Server"

sudo docker run --name rancherserver --privileged -d --restart=unless-stopped -p 8088:80 -p 8443:443 rancher/rancher

echo ""
echo "Aguardando a configuração do Rancher."

while [ "$(docker logs rancherserver 2>&1 | grep "Bootstrap Password:" | wc -l)" != "1" ]; do
  printf "."
  sleep 1
done

echo ""
echo ""
echo "Senha de Bootstrap:"
echo ""

docker logs rancherserver 2>&1 | grep "Bootstrap Password:"

echo "URL de acesso:"
echo ""
echo https://$(curl -s checkip.amazonaws.com):8443
echo ""
