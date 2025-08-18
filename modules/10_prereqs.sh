#!/usr/bin/env bash
# Instalador one-liner:
# curl -L https://raw.githubusercontent.com/rluft/ReacktServer-Docker/main/install.sh | bash
set -euo pipefail 
REPO_URL="https://raw.githubusercontent.com/rluft/ReacktServer-Docker/main"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

download() { curl -fsSL "$REPO_URL/$1" -o "$TMP_DIR/$(basename "$1")"; }
for f in scripts/helper_functions.sh modules/*.sh; do download "$f"; done
source "$TMP_DIR/helper_functions.sh"
for mod in $TMP_DIR/*.sh; do bash "$mod"; done

echo -e "\n✅ Instalação concluída — reinicie a sessão ou execute 'newgrp docker' se necessário.\n"