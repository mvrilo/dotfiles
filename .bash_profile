#!/bin/bash

[[ -f "$HOME/.fzf.bash" ]] && source "$HOME/.fzf.bash"
[[ -f "$HOME/.sensible.bash" ]] && source "$HOME/.sensible.bash"
[[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
[[ -f "$HOME/.ssh/config" ]] && complete -o default -W "$(awk '/^Host / {print $2}' < "$HOME/.ssh/config")" scp sftp ssh

[[ -f "$HOME/.shellrc" ]] && source "$HOME/.shellrc"

shopt -s nocaseglob
shopt -s histappend
shopt -s cdspell
shopt -s globstar

DARKGRAY='\[\e[1;30m\]'
LIGHTGREEN='\[\e[1;32m\]'
LIGHTGRAY='\[\e[1;37m\]'
LIGHTCYAN='\[\e[1;96m\]'
WHITE='\[\e[1;37m\]'
NC='\[\e[0m\]' # reset color

if command -v __git_ps1 &>/dev/null; then
  branch='`__git_ps1 " (%s)"`'
fi

export PS1="${LIGHTCYAN}\h ${NC}\w${LIGHTGRAY}${branch}${NC} ${WHITE}\u ${LIGHTGREEN}\$${NC} "
