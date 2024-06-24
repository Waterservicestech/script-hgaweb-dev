#!/bin/bash

dir="/c/Users/vinicius.dalanora/Projetos/hgaweb"


proxyreverse="cd $dir/proxyreverse-hgaweb-services && docker-compose up --build"
multilangcore="cd $dir/multilangcore-hgaweb-services && yarn dev"
auth="cd $dir/auth-hgaweb-services && yarn dev"
tenant="cd $dir/tenant-hgaweb-services && yarn dev"
pages="cd $dir/pages-hgaweb-services && yarn dev"


osascript <<EOF
tell application "Terminal"
    do script "$proxyreverse"
    do script "$multilangcore"
    do script "$auth"
    do script "$tenant"
    do script "$pages"
    activate
end tell
EOF
