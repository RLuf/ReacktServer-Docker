#!/usr/bin/env bash
# Instalador one-liner:
# curl -L https://raw.githubusercontent.com/rluft/ReacktServerDocker/main/install.sh | bash
set -euo pipefail
REPO_URL="https://raw.githubusercontent.com/rluft/ReacktServerDocker/main"
TMP_DIR="$(mktemp -d)"

download() { curl -fsSL "$REPO_URL/$1" -o "$TMP_DIR/$(basename "$1")"; }
for f in ft