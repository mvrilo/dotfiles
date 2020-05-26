#!/bin/sh

set -e

HOMEBREW_URL=https://raw.githubusercontent.com/Homebrew/install/master/install

install_mac() {
	if ! which brew >/dev/null 2>/dev/null; then
		echo 'Installing homebrew'
		/usr/bin/ruby -e "$(curl -fsSL $HOMEBREW_URL)" 2>/dev/null >/dev/null
	fi

	brew tap 'homebrew/bundle'
	brew bundle install
	brew cleanup

	pip3 install --user -U pip neovim pynvim msgpack
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
	go get -u -v \
		github.com/mvrilo/go-cpf/cmd/cpf \
		github.com/mvrilo/protog/cmd/protog \
		github.com/cjbassi/gotop \
		github.com/jesseduffield/lazydocker
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
