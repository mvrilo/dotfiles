#!/bin/sh

set -e

install_mac() {
  if ! which brew 2>/dev/null; then
    /usr/bin/ruby -e \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2>/dev/null >/dev/null
  fi

	brew tap 'homebrew/bundle'
	brew bundle install --verbose

	pip  install -U pip neovim
	pip3 install -U pip neovim
	gem install -u neovim

	nvim +PlugUpgrade +qa
	nvim +PlugUpdate +qa
	nvim +UpdateRemotePlugins +qa
}

install_linux() {
	sudo apt install -y \
		bash \
		git \
		golang \
		htop \
		jq \
		nmap \
		nodejs \
		npm \
		python \
		python-pip \
		python3 \
		python3-pip \
		ruby \
		tmux \
		tree \
		vim
}

install_node() {
	npm i -g \
		eslint \
		neovim \
		prettier \
		serve \
		tslint \
		typescript \
		yarn \
		ts-node
}

install_go() {
  go get -v -u github.com/mvrilo/go-cpf/cmd/cpf
  go get -v -u github.com/cjbassi/gotop
  go get -v -u github.com/jesseduffield/lazydocker
}

main() {
  if [ "$(uname -s)" = "Darwin" ]; then
		install_mac
	else
		install_linux
	fi

	git submodule update --init

  install_node
  install_go
}

main
