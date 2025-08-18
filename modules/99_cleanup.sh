#!/usr/bin/env bash
source "$(dirname "$0")/../scripts/helper_functions.sh"
log "Limpeza temporários…"
docker system prune -f --volumes
