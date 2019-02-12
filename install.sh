#!/bin/sh

set -e

main() {
	brew tap 'homebrew/bundle'
	brew bundle install --verbose

	git submodule update --init

	pip  install -U pip neovim
	pip3 install -U pip neovim

	sudo gem install -u bundler neovim

	npm i -g \
		yarn \
		prettier \
		eslint \
		typescript \
		tslint \
		neovim \
		serve

	nvim \
		+PlugUpgrade \
		+PlugInstall \
		+UpdateRemotePlugins \
		+qa
}

main
