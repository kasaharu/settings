alias mvim='open -a MacVim'

alias ls='ls -G'
alias ll='ls -al'
alias la='ls -A'

alias ps='ps aux'

# npm scripts の補完
alias yarn-run='yarn $(find_npm_scripts | peco)'
function find_npm_scripts() {
  cat package.json | jq -r '.scripts | keys[]'
}
