set -x LANG ja_JP.UTF-8
ssh-add -K ~/.ssh/id_rsa

# alias 設定
alias ps='ps aux'

## exa: https://the.exa.website/docs/command-line-options
alias ls='exa'
alias ll='exa -lh'
alias la='exa -lah'

# 言語設定 ----------------------------------------------------------------------
## asdf 設定
source ~/.asdf/asdf.fish

## Starship 設定
starship init fish | source

