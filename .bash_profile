#!/bin/bash

[[ -f "$HOME/.sensible.bash" ]] && source "$HOME/.sensible.bash"
[[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"
[[ -f "$HOME/.ssh/config" ]] && complete -o default -W "$(awk '/^Host / {print $2}' < "$HOME/.ssh/config")" scp sftp ssh
[[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion

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

export PS1="${LIGHTCYAN}\h ${NC}\w${DARKGRAY}${branch}${NC} ${WHITE}\u ${LIGHTGREEN}\$${NC} "
export GOPATH="$HOME/.go"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESS="-R"
export CLICOLOR=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800
export ANDROID_SDK="$HOME/Library/Android/sdk"
export EDITOR="$(which /usr/local/bin/nvim 2>/dev/null ||
                 which /usr/local/bin/vim  2>/dev/null ||
                 which /usr/bin/vim        2>/dev/null)"
export GIT_EDITOR=$EDITOR

alias ..="cd .."
alias ll="ls -alFh"
alias l='ll'
alias vimrc="$EDITOR $HOME/.vimrc"
alias reload=". $HOME/.bash_profile"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

tn() { tmux new-session -A -s "${1-base}" -c "${2-HOME}" "${3-htop}" 2>/dev/null; }

sshtor() { ssh -o ProxyCommand='nc -x 0:9050 %h %p' "$1"; }

ga()  { git add "$@"; }
gc()  { git ci "$@"; }
gca() { git ci --amend "$@"; }
gd()  { git diff "$@"; }
gl()  { git log "$@"; }
gls() { git log --stat "$@"; }
gs()  { git status "$@"; }
gss() { git status -s "$@"; }
gpl() { git pull "$@"; }
gps() { git push "$@"; }

onep() { osascript -e "open location \"x-onepassword-helper://search/$1\""; }

genpass() { openssl rand -hex "${1-64}"; }

gencert() {
  local name="${1-server}"
  openssl req -x509 -newkey rsa:1024 -keyout "${name}.key" -out "${name}.crt" -days 3650 -nodes
  openssl pkcs12 -export -out "${name}.pfx" -inkey "${name}".key -in "${name}.crt"
}

[[ -f /usr/local/opt/fzf/shell/completion.bash ]] && source /usr/local/opt/fzf/shell/completion.bash
[[ -f /usr/local/opt/fzf/shell/key-bindings.bash ]] && source /usr/local/opt/fzf/shell/key-bindings.bash

# [[ "$TERM" != "screen"* ]] && tn

# eval "$(jump shell)"
