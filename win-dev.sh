#!/bin/bash

GIT_BASH="/c/Program Files/Git/git-bash.exe"
DIR="/d/Projetos/Waterservicestech/hgaweb"

YARN_INSTALL="yarn"
YARN_RUN="yarn dev"

# Comandos para iniciar cada serviço
proxyreverse="cd $DIR/proxyreverse-hgaweb-services; docker-compose up --build"
multilangcore="cd $DIR/multilangcore-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
auth="cd $DIR/auth-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
tenant="cd $DIR/tenant-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
 
# Abre cada comando em uma nova janela do Git Bash
start bash -c "$proxyreverse; exec bash"
start bash -c "$multilangcore; exec bash"
start bash -c "$auth; exec bash"
start bash -c "$tenant; exec bash"

#chmod +x win-dev.sh