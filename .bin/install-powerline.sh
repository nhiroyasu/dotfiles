#!/usr/bin/env bash
set -ue

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# powerlevel10kをインストール
install_powerlevel10k() {
    echo "[INFO] Setup powerlevel10k..."
    if [[ -d "$HOME/powerlevel10k" ]]; then
        echo "[INFO] powerlevel10k is already exist"
    else
        echo "[INFO] Install powerlevel10k"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
        echo "[INFO] Add source param to .zshrc"
        echo "source $HOME/powerlevel10k/powerlevel10k.zsh-theme" >>$HOME/.zshrc
    fi
}

install_powerlevel10k

echo "[SUCCESS] Install completed !!!"
echo "--- You should execute this command ↓ ---"
echo "[ zsh ]"
echo "[ p10k config ]"
