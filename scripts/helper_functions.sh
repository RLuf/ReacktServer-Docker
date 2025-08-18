#!/usr/bin/env bash
log()   { printf '\033[1;34m[INFO]\033[0m %s\n' "$*"; }
error() { printf '\033[1;31m[ERRO]\033[0m %s\n' "$*" >&2; exit 1; }

pkg_install() {
  if command -v apt >/dev/null 2>&1; then
      sudo apt-get update -y && sudo apt-get install -y "$@"
  elif command -v dnf >/dev/null 2>&1; then
      sudo dnf install -y "$@"
  elif command -v pacman >/dev/null 2>&1; then
      sudo pacman -Sy --noconfirm "$@"
  else
      error "Distribuição não suportada"
  fi
}
