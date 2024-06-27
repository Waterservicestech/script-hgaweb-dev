#!/bin/bash

GIT_BASH="/c/Program Files/Git/git-bash.exe"
DIR="/c/Users/vinicius.dalanora/Projetos/hgaweb"

YARN_INSTALL="yarn"
YARN_RUN="yarn dev"

# Comandos para iniciar cada serviço
proxyreverse="cd $DIR/proxyreverse-hgaweb-services; docker-compose up --build"
multilangcore="cd $DIR/multilangcore-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
auth="cd $DIR/auth-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
tenant="cd $DIR/tenant-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
pages="cd $DIR/pages-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
web="cd $DIR/web-hgaweb-frontend; $YARN_INSTALL; $YARN_RUN"
widgets="cd $DIR/widgets-hgaweb-services; $YARN_INSTALL; $YARN_RUN"


 
# Abre cada comando em uma nova janela do Git Bash
start bash -c "$proxyreverse; exec bash"
start bash -c "$multilangcore; exec bash"
start bash -c "$auth; exec bash"
start bash -c "$tenant; exec bash"
start bash -c "$pages; exec bash"
start bash -c "$web; exec bash"
start bash -c "$widgets; exec bash"



#chmod +x win-dev.sh