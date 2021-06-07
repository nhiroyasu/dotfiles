#!/usr/bin/env bash
set -ue

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# オートサジェスチョンをインストール
install_auto_suggestion() {
    echo "[INFO] Setup auto-suggestion..."
    if [[ -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
        echo "[INFO] zsh-autosuggestion is already exist"
    else
        echo "[INFO] Install setup_zsh_autosuggestion"
        git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
        echo "[INFO] Add source param to .zshrc"
        echo "source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >>$HOME/.zshrc
    fi
}

install_auto_suggestion

echo "[SUCCESS] All Process completed !!!"
echo "--- You should execute this command ↓ ---"
echo "[ zsh ]"