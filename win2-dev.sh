#!/bin/bash

GIT_BASH="/c/Program Files/Git/git-bash.exe"
DIR="/c/Users/vinicius.dalanora/Projetos/hgaweb"

YARN_INSTALL="yarn"
YARN_RUN="yarn dev"

# Função para iniciar cada serviço em uma nova janela do Git Bash
start_service_in_gitbash() {
    local command="$1"
    start bash -c "$command; exec bash" &
}

# Comandos para iniciar cada serviço
start_service_in_gitbash "cd $DIR/proxyreverse-hgaweb-services; trap 'stop_services' INT; docker-compose up --build"
start_service_in_gitbash "cd $DIR/multilangcore-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
start_service_in_gitbash "cd $DIR/auth-hgaweb-services; $YARN_INSTALL; $YARN_RUN"
start_service_in_gitbash "cd $DIR/tenant-hgaweb-services; $YARN_INSTALL; $YARN_RUN"

# Função para parar todos os serviços
stop_services() {
    echo "Parando todos os serviços..."
    docker-compose down -v --remove-orphans  # Ajuste conforme necessário para cada serviço
    exit 0
}

# Captura o sinal de interrupção Ctrl+C para parar todos os serviços
trap stop_services INT

# Espera indefinidamente
wait
