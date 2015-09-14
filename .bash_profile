#!/bin/bash

[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion
[[ -f "$HOME/.ssh/config" ]] && complete -o default -W "$(awk '/^Host / {print $2}' < ~/.ssh/config)" scp sftp ssh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.secrets" ]] && source "$HOME/.secrets"

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
export EDITOR="$(which vim)"
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export RAILS_ENV=development
export GREP_OPTIONS=--color=auto
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export rvmsudo_secure_path=1
export LESS="-R"
export CLICOLOR=1

alias ..="cd .."
alias ll="ls -alFh"
alias l='ll'
alias snv='svn'
alias vimrc='vim ~/.vimrc'
alias reload='. ~/.bash_profile'

gs() { git status "$@"; }
gd() { git diff "$@"; }
gc() { git ci "$@"; }

onep() { osascript -e "open location \"x-onepassword-helper://search/$1\""; }

gencert() {
  local name="${1-server}"
  openssl req -x509 -newkey rsa:1024 -keyout "${name}.key" -out "${name}.crt" -days 3650 -nodes
  openssl pkcs12 -export -out "${name}.pfx" -inkey "${name}".key -in "${name}.crt"
}
