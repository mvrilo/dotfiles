source ~/.colors
source ~/.aliases
[[ -f ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion

# autocomplete for hosts in ssh config
[[ -f ~/.ssh/config ]] && complete -o default -W "$(awk '/^Host / {print $2}' < ~/.ssh/config)" scp sftp ssh

[ "`type __git_ps1 | head -n1`" == "__git_ps1 is a function" ] && branch='`__git_ps1 " (%s)"`'

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

echo -e "\r$(fortune -s)"
