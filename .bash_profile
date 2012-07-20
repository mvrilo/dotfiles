source $HOME/.colors
source $HOME/.aliases
source $HOME/.git-completion
source $HOME/.rvm/scripts/rvm

branch='`__git_ps1 " (%s)"`'

[ "`uname`" == "Darwin" ] && H="\h" || H="xen"

export PS1="$H : \W${DARKGRAY}${branch}${NC} ${WHITE}\u ${LIGHTGREEN}\$${NC} "
export PATH=./bin:/usr/local/bin:$PATH:/usr/local/sbin:~/node_modules/.bin
export NODE_PATH=`which node`
export EDITOR=`which vim`
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:* --help"
