#!/usr/bin/env zsh
set -ue

configure_powerlevel10k() {
  if [ -d ./powerlevel10k ]; then
    command echo "powerlevel10k is already exist"
  else
    command echo "configure powerlevel10k"
    command p10k configure
  fi
}

configure_powerlevel10k
