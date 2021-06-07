# dotfiles
自分用のdotfiles

# status
👨‍💻開発中👨‍💻

# 概要
[こちらのサイト](https://qiita.com/yutakatay/items/c6c7584d9795799ee164)を参考に作成する

# やりたいこと
- [ ] zshの設定
- [x] powerlevelを使えるようにする
- [x] vimの設定
- [x] git aliasの設定
- [x] git completionの設定
- [ ] powerlevelのconfig設定
- [ ] ファイル単位で設定を反映できるようにする
- [ ] gitで同期できない形で、インストールできるようにする

# セットアップ
```shell
cd ~
git clone https://github.com/cyan-0fbcf9/dotfiles.git
cd dotfiles
chmod +x ./.bin/install-*.sh
./.bin/install-all.sh
```

*WARNING: `sh` で起動しない*
