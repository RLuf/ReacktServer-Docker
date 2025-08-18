
#!/usr/bin/env bash
source "$(dirname "$0")/../scripts/helper_functions.sh"

log "Instalando Docker Engine + Compose…"
pkg_install ca-certificates gnupg lsb-release

if command -v apt >/dev/null 2>&1; then
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg \
       | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
  sudo apt-get update -y
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
else
  curl -fsSL https://get.docker.com | sh
fi

sudo usermod -aG docker "$USER"