#!/usr/bin/env bash
set -ue

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd) 

# dotfileをシンボリックリンクでホームディレクトリに配置
link_to_homedir() {
    echo "[INFO] Setup dotfiles..."
    local dotdir=$(dirname ${script_dir})
    if [ ! -d "$HOME/.dotbackup" ]; then
        echo "[INFO] $HOME/.dotbackup not found. Auto Make it"
        echo "[CMD] mkdir $HOME/.dotbackup"
        mkdir "$HOME/.dotbackup"
    fi

    if [[ "$HOME" != "$dotdir" ]]; then
        for f in $dotdir/.??*; do
            [[ $(basename $f) == ".git" ]] && continue
            if [[ -L "$HOME/$(basename $f)" ]]; then
                echo "[INFO] symbolic link is exist. it will delete this"
                echo "[CMD] rm -f $HOME/$(basename $f)"
                rm -f "$HOME/$(basename $f)"
            fi
            if [[ -e "$HOME/$(basename $f)" ]]; then
                echo "[INFO] Backup old dotfiles..."
                echo "[INFO] Backup directory is $HOME/.dotbackup"
                echo "[CMD] mv $HOME/$(basename $f) $HOME/.dotbackup"
                mv "$HOME/$(basename $f)" "$HOME/.dotbackup"
            fi
            ln -snf $f $HOME
        done
        echo "[SUCCESS] All dotfiles is configured !"
    else
        echo "[WARN] Same install src dest"
    fi
}

# gitconfigファイルを構築
config_git() {
    echo "[INFO] git configuration..."
    git config --global include.path "~/.gitconfig_shared"
    echo "[SUCCESS] git configuration is succeeded !"
}

# デフォルトのシェルをzshに変更
change_shell_to_zsh() {
    echo "[INFO] Change shell to zsh..."
    chsh -s $(which zsh)
    echo "[SUCCESS] Changed shell to zsh !"
}

link_to_homedir
config_git
change_shell_to_zsh

echo "[SUCCESS] All Process completed !!!"
echo "--- You should execute this command ↓ ---"
echo "[ zsh ]"
