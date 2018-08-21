test -r ~/.bashrc && . ~/.bashrc

# Git 補間のためのスクリプト読み込み
# $HOME/work/ 配下に https://github.com/git/git を clone しておく
source $HOME/work/git/contrib/completion/git-completion.bash
source $HOME/work/git/contrib/completion/git-prompt.sh

LANG=ja_JP.UTF-8
