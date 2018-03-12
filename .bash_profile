#!/bin/bash

[[ -f ~/.secrets ]] && source ~/.secrets
[[ -f ~/.sensible.bash ]] && source ~/.sensible.bash
[[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
[[ -f /usr/local/opt/fzf/shell/completion.bash ]] && source /usr/local/opt/fzf/shell/completion.bash
[[ -f /usr/local/opt/fzf/shell/key-bindings.bash ]] && source /usr/local/opt/fzf/shell/key-bindings.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -f ~/.ssh/config ]] && complete -o default -W "$(awk '/^Host / {print $2}' < ~/.ssh/config)" scp sftp ssh

shopt -s nocaseglob
shopt -s histappend
shopt -s cdspell
shopt -s globstar

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
export HOMEBREW_NO_ANALYTICS=1
export GIT_EDITOR=$EDITOR
export ANDROID_HOME=/usr/local/opt/android-sdk
export EDITOR="$(which /usr/local/bin/nvim ||
                 which /usr/local/bin/vim ||
                 which /usr/bin/vim)"

if which nvim &>/dev/null; then
  export NVIM_PYTHON_LOG_FILE=/tmp/log
  export NVIM_PYTHON_LOG_LEVEL=DEBUG
fi

alias ..="cd .."
alias ll="ls -alFh"
alias l='ll'
alias vimrc="$EDITOR ~/.vimrc"
alias reload='. ~/.bash_profile'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

gs() { git status "$@"; }
gd() { git diff "$@"; }
gc() { git ci "$@"; }

onep() { osascript -e "open location \"x-onepassword-helper://search/$1\""; }

gencert() {
  local name="${1-server}"
  openssl req -x509 -newkey rsa:1024 -keyout "${name}.key" -out "${name}.crt" -days 3650 -nodes
  openssl pkcs12 -export -out "${name}.pfx" -inkey "${name}".key -in "${name}.crt"
}

# [[ "$TERM" != "screen"* ]] && tn

dcleanup() {
  # Delete all stopped containers
  docker ps -q -f status=exited | xargs docker rm

  # Delete all dangling (unused) images
  docker images -q -f dangling=true | xargs docker rmi
}

sshtor() {
	ssh -o ProxyCommand='nc -x 0:9050 %h %p' "$1"
}

maximize() {
	local path=~/maximize.applescript

	if [[ "$(uname)" != "Darwin" ]]; then
		echo "OS not supported"
		return 1
	fi

	if ! [[ -f $path ]]; then
		echo "maximize script not found: '$path'"
		return 1
	fi

	osascript $path
}

tn() {
	tmux new-session -s "${1-base}" -c "${2-HOME}" 2>/dev/null
}

tna() {
	tmux attach -t "${1-base}" 2>/dev/null || tn "$@"
}
