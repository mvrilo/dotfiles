if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi

if [ -f $HOME/.git-completion ]; then
  . $HOME/.git-completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# PS1
export PS1='\h : \W$(__git_ps1 " (%s)") \u \$ '
export PATH=$PATH:/usr/local/bin
