#!/bin/bash

if [ -f ~/.sensible.bash ]; then
  source ~/.sensible.bash
fi

[[ -s "$HOME/.secrets" ]] && source "$HOME/.secrets"
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion
[[ -f "$HOME/.ssh/config" ]] && complete -o default -W "$(awk '/^Host / {print $2}' < ~/.ssh/config)" scp sftp ssh

DARKGRAY='\[\e[1;30m\]'
LIGHTGREEN='\[\e[1;32m\]'
WHITE='\[\e[1;37m\]'
NC='\[\e[0m\]' # reset color

if command -v __git_ps1 &>/dev/null; then
  branch='`__git_ps1 " (%s)"`'
fi

export PS1="\h : \W${DARKGRAY}${branch}${NC} ${WHITE}\u ${LIGHTGREEN}\$${NC} "
export GOPATH="$HOME/.go"
export PATH="$HOME/.rvm/bin:$GOPATH/bin:/usr/local/sbin:$PATH"
export RAILS_ENV=development
export GREP_OPTIONS=--color=auto
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export rvmsudo_secure_path=1
export LESS="-R"
export CLICOLOR=1
export EDITOR="$(which /usr/local/bin/nvim ||
                 which /usr/local/bin/vim ||
                 which /usr/bin/vim)"
export HOMEBREW_NO_ANALYTICS=1
export GIT_EDITOR=$EDITOR

if which nvim &>/dev/null; then
  export EDITOR="$(which nvim)"
  export NVIM_PYTHON_LOG_FILE=/tmp/log
  export NVIM_PYTHON_LOG_LEVEL=DEBUG
fi

alias ..="cd .."
alias ll="ls -alFh"
alias l='ll'
alias snv='svn'
alias vimrc='vim ~/.vimrc'
alias reload='. ~/.bash_profile'
alias v="$EDITOR"

gs() { git status "$@"; }
gd() { git diff "$@"; }
gc() { git ci "$@"; }

onep() { osascript -e "open location \"x-onepassword-helper://search/$1\""; }

gencert() {
  local name="${1-server}"
  openssl req -x509 -newkey rsa:1024 -keyout "${name}.key" -out "${name}.crt" -days 3650 -nodes
  openssl pkcs12 -export -out "${name}.pfx" -inkey "${name}".key -in "${name}.crt"
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ "$TERM" != "screen"* ]] && tmux a -t base 2>/dev/null || tmux new-session -s base 2>/dev/null

dcleanup() {
  # Delete all stopped containers
  docker ps -q -f status=exited | xargs --no-run-if-empty docker rm

  # Delete all dangling (unused) images
  docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi
}
