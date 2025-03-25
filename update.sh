#!/bin/bash

echo " Atualizando repositórios..."
docker pull php:latest-apache

echo " Parando contêiner antigo..."
docker stop meu_sistema
docker rm meu_sistema

echo " Removendo imagem antiga..."
docker rmi meu_sistema:latest

echo " Criando nova imagem..."
docker build -t meu_sistema:latest .

echo " Iniciando novo contêiner..."
docker run -d -p 8080:80 --name meu_sistema meu_sistema:latest

echo " Verificando versões instaladas..."
docker exec meu_sistema php -v
docker exec meu_sistema node -v
docker exec meu_sistema apachectl -v