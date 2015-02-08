#!/bin/bash

if command -v fortune &>/dev/null; then
  echo -e "\r$(fortune -s)"
fi

[[ -f ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion

# autocomplete for hosts in ssh config
[[ -f ~/.ssh/config ]] && complete -o default -W "$(awk '/^Host / {print $2}' < ~/.ssh/config)" scp sftp ssh

BLACK='\[\e[0;30m\]'
BLUE='\[\e[0;34m\]'
GREEN='\[\e[0;32m\]'
CYAN='\[\e[0;36m\]'
RED='\[\e[0;31m\]'
PURPLE='\[\e[0;35m\]'
BROWN='\[\e[0;33m\]'
LIGHTGRAY='\[\e[0;37m\]'
DARKGRAY='\[\e[1;30m\]'
LIGHTBLUE='\[\e[1;34m\]'
LIGHTGREEN='\[\e[1;32m\]'
LIGHTCYAN='\[\e[1;36m\]'
LIGHTRED='\[\e[1;31m\]'
LIGHTPURPLE='\[\e[1;35m\]'
YELLOW='\[\e[1;33m\]'
WHITE='\[\e[1;37m\]'
NC='\[\e[0m\]' # reset color

if command -v __git_ps1 &>/dev/null; then
  branch='`__git_ps1 " (%s)"`'
fi

export PS1="\h : \W${DARKGRAY}${branch}${NC} ${WHITE}\u ${LIGHTGREEN}\$${NC} "
export GOPATH=~/.go
export PATH=~/bin:$GOPATH/bin:$PATH
export EDITOR=`which vim`
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export RAILS_ENV=development
export GREP_OPTIONS=--color=auto
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CDPATH=.:~/dev
export rvmsudo_secure_path=1

osx() {
  [ "$(uname)" == "Darwin" ]
}

if osx; then
  alias ls="ls -G"
else
  alias ls="ls --color"
fi

alias ..="cd .."
alias ll="ls -alFh"
alias l='ll'
alias snv='svn'
alias quit='exit'
alias :e=$EDITOR
alias vimrc='vim ~/.vimrc'
alias myip='curl -s http://ip.appspot.com'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias reload='. ~/.bash_profile'

cat() {
  if ! type pygmentize >/dev/null 2>&1; then
    /bin/cat $@
    return
  fi
  pygmentize $@ 2> /dev/null
  [ $? -ne 0 ] && /bin/cat $@
}

# Syntax-highlight JSON strings or files
# https://github.com/mathiasbynens/dotfiles/blob/master/.functions
json() {
  if [ -p /dev/stdin ]; then
    # piping, e.g. `echo '{"foo":42}' | json`
    python -mjson.tool | pygmentize -l javascript
  else
    # e.g. `json '{"foo":42}'`
    python -mjson.tool <<< "$*" | pygmentize -l javascript
  fi
}

dataurl() {
  if [[ -f "$1" ]]; then
    echo "data:image/${1##*.};base64,$(openssl base64 -in "$1")" | tr -d '\n'
    return 0
  fi

  echo "dataurl - converts an image to base64 data format"
  echo ""
  echo "Usage:"
  echo -e "\tdataurl <path/to/image.png>"
  return 1
}

headers() {
  curl -sv "$@" 2>&1 >/dev/null |
    grep -v "^\*" |
    grep -v "^}" |
    cut -c3-
}
