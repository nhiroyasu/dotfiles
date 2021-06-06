#!/usr/bin/env bash
set -ue

# dotfileをシンボリックリンクでホームディレクトリに配置
link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
      command ln -snf $f $HOME
    done
  else
    command echo "same install src dest"
  fi
}

# gitconfigファイルを構築
config_git() {
  command echo "git configuration..."
  command git config --global include.path "~/.gitconfig_shared"
}

# デフォルトのシェルをzshに変更
change_shell_to_zsh() {
  command echo "change shell to zsh..."
  command chsh -s $(which zsh)
  command zsh
}

# powerlevel10kをインストール
install_powerlevel10k() {
  if [ -d $HOME/powerlevel10k ]; then
    command echo "powerlevel10k is alread exist"
  else
    command echo "install powerlevel10k"
    command git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    command echo "source ~/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
  fi
}

link_to_homedir
config_git
change_shell_to_zsh
install_powerlevel10k

# zshを再起動
command zsh

command echo "Install completed !!!"
