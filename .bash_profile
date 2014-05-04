source ~/.colors
source ~/.aliases
source ~/.git-completion
rvm=~/.rvm/scripts/rvm; [ -f $rvm ] && source $rvm
tmux=/usr/local/opt/tmux/etc/bash_completion.d/tmux; [ -f $tmux ] && source $tmux
branch=''

[ "`type __git_ps1 | head -n1`" == "__git_ps1 is a function" ] && branch='`__git_ps1 " (%s)"`'

export PS1="\h : \W${DARKGRAY}${branch}${NC} ${WHITE}\u ${LIGHTGREEN}\$${NC} "
export PATH=~/bin:/usr/local/bin:$PATH:/usr/local/sbin:/usr/local/share/npm/bin:~/node_modules/.bin:~/.go/bin
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=~/.go
export GOBIN=$GOPATH/bin
export NODE_PATH=/usr/local/opt/node/bin
export EDITOR=`which vim`
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export RAILS_ENV=development
export GREP_OPTIONS='--color=auto'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export DOCKER_HOST=tcp://localhost:4243
export CDPATH=.:~/dev

# autocomplete for hosts in ssh config
[ -f ~/.ssh/config ] && complete -o default -W "$(awk '/^Host / {print $2}' < ~/.ssh/config)" scp sftp ssh

echo -e "\r$(fortune -s)"
