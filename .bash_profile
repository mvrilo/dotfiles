alias ll='ls -aGlF'
alias la='ls -AG'
alias l='ls -CFG'
alias sl='ls -G'

alias quit='exit'
alias :q='exit'

#if [ -f ~/bash/.aliases ]; then
#    . ~/bash/.aliases
#fi

alias myip='curl -s http://ip.appspot.com'

# This loads RVM into a shell session.
[[ -s "/Users/mvrilo/.rvm/scripts/rvm" ]] && source "/Users/mvrilo/.rvm/scripts/rvm"

# Git completion
. /Users/mvrilo/.bash_completion/git-completion.bash

# PS1
export PS1='\h : \W$(__git_ps1 " (%s)") \u \$ '
