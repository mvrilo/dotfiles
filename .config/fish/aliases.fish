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

alias gd="git diff -w"
alias gl="git log"
alias gls="git log --stat"
alias gs="git status"
alias gss="git status -s"
alias gm="git merge -Xignore-all-space"
alias pbclone="pbpaste | xargs -o git clone"

if type -q bat
  alias cat="bat -p"
end

if type -q bat
  alias cat="bat -p"
end

function _top_path
  if type -q btop
    type -p btop
  else if type -q btm
    type -p btm
  else if type -q htop
    type -p htop
  else
    type -p top
  end
end

function _top
  command _type_path
end

function tn
  set name $argv[1]
  if test -z "$name"
    set name "base"
  end

  set dir $argv[2];
  if test -z "$dir"
    set dir "~"
  end

  set cmdd $argv[3];
  if test -z "$cmdd"
    set cmdd $(_top_path)
  end

  echo "$name $dir $cmdd"

  tmux new-session -A -s "$name" -c "$dir" "$cmdd"
end
