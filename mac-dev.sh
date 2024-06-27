#!/bin/bash

dir="/Users/joaomarcos/Projetos/Waterservicestech/hgaweb"

proxyreverse="cd $dir/proxyreverse-hgaweb-services && docker-compose up --build"
multilangcore="cd $dir/multilangcore-hgaweb-services && yarn dev"
auth="cd $dir/auth-hgaweb-services && yarn dev"
tenant="cd $dir/tenant-hgaweb-services && yarn dev"
pages="cd $dir/pages-hgaweb-services && yarn dev"
web="cd $dir/web-hgaweb-frontend && yarn dev"
widgets="cd $dir/widgets-hgaweb-services && yarn dev"


osascript <<EOF
tell application "Terminal"
    do script "$proxyreverse"
    do script "$multilangcore"
    do script "$auth"
    do script "$tenant"
    do script "$pages"
    do script "$web"
    do script "$widgets"
    activate
end tell
EOF
