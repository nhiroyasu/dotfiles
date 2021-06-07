# よく分からんが便利そうなオプション## 補完機能有効にする

# ロケール
export LANG=ja_JP.UTF-8

# ビープ音をなくす
setopt no_beep

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 補完を有効化
autoload -U compinit
compinit -u

## 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

## 単語の入力途中でもTab補完を有効化
setopt complete_in_word
## 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
## キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
## 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 補完リストの表示間隔を狭くする
setopt list_packed

## コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "
