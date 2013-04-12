source ~/.colors
source ~/.aliases
source ~/.git-completion
source ~/.rvm/scripts/rvm

branch='`__git_ps1 " (%s)"`'

[ $is_darwin ] && MACHINE="\h" || MACHINE=`hostname`

export PS1="$MACHINE : \W${DARKGRAY}${branch}${NC} ${WHITE}\u ${LIGHTGREEN}\$${NC} "
export PATH=~/bin:/usr/local/bin:$PATH:/usr/local/sbin:~/node_modules/.bin:~/.go/bin
export GOPATH=~/.go
export GOBIN=$GOPATH/bin
export NODE_PATH=`which node`
export EDITOR=`which vim`
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# autocomplete for hosts in ssh config
[ -f ~/.ssh/config ] && complete -o default -W "$(awk '/^Host / {print $2}' < ~/.ssh/config)" scp sftp ssh

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
