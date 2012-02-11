source $HOME/.colors
source $HOME/.aliases
source $HOME/.git-completion
source $HOME/.rvm/scripts/rvm

branch=$(echo '`__git_ps1 "(%s)"`')

# PS1
export PS1="\h : \W ${DARKGRAY}${branch}${NC} ${WHITE}\u ${LIGHTGREEN}\$${NC} "
export PATH=$PATH:/usr/local/bin
export NODE_PATH=`which node`
export EDITOR=`which vim`
export HISTFILESIZE=2000
export HISTCONTROL=ignoredups
