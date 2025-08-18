#!/usr/bin/env bash
source "$(dirname "$0")/../scripts/helper_functions.sh"

log "Clonando repositório da aplicação React e construindo container…"
git clone https://github.com/rluft/ReactAppTemplate.git ~/react-app
cd ~/react-app
docker build -t react-app:latest .
docker run -d --restart=unless-stopped -p 3000:3000 --name react-app react-app:latest
