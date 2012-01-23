if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.git-completion ]; then
  . ~/.git-completion
fi

[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"

# PS1
export PS1='\h : \W$(__git_ps1 " (%s)") \u \$ '
export PATH=$PATH:/usr/local/bin
