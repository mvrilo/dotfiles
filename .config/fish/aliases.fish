alias ll="ls -alFh"
alias l='ll'
alias ..="cd .."
alias alpine="docker run --rm -it alpine:latest /bin/sh"
alias dc="docker-compose"
alias genpass="openssl rand -hex 64"
alias k="kubectl"
alias nv="nvim"
alias reload=". ~/.bash_profile"
alias scurl="curl --fail --silent --show-error"
alias vimrc="$EDITOR ~/.vimrc"

alias gd="git diff"
alias gl="git log"
alias gls="git log --stat"
alias gs="git status"
alias gss="git status -s"

if type -q bat
  alias cat="bat -p"
end

function _top
  if type -q btm;
    command btm
    return 0
  end

  if type -q htop;
    command htop
    return 0
  end

  top
end


function tn
  set name $1;
  set -q $name;
  or set name "base";

  set dir $2;
  set -q $dir;
  or set dir "~";

  set cmd $3;
  set -q $cmd;
  or set cmd _top;

  echo "$name $dir (_top)";
  tmux new-session -A -s "$name" -c "$dir" "$cmd"
end
