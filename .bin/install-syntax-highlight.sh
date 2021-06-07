#!/usr/bin/env bash
set -ue

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# ハイライトのツールをインストール
install_syntax_highlight() {
    echo "[INFO] Setup syntax-highlight..."
    if [[ -d "$HOME/.zsh/zsh-syntax-highlighting" ]]; then
        echo "[INFO] zsh-syntax-highlighting is already exist"
    else
        echo "[INFO] Install setup_zsh_syntax_highlight"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
        echo "[INFO] Add source param to .zshrc"
        echo "source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>$HOME/.zshrc
    fi
}

install_syntax_highlight

echo "[SUCCESS] All Process completed !!!"
echo "--- You should execute this command ↓ ---"
echo "[ zsh ]"
