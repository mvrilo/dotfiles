#!/bin/sh

set -e

setup_base() {
	HOMEBREW_URL=https://raw.githubusercontent.com/Homebrew/install/master/install

	if ! which brew >/dev/null 2>/dev/null; then
		/usr/bin/ruby -e "$(curl -fsSL $HOMEBREW_URL)" 2>/dev/null >/dev/null
	fi

	brew tap 'homebrew/bundle'
	brew bundle check || brew bundle || true
	brew upgrade || true
	brew cleanup

	git submodule update --init

	pip3 install --user -U pip neovim pynvim msgpack
	gem install --no-document -u neovim

	nvim +PlugUpgrade +PlugUpdate +qa
	nvim +UpdateRemotePlugins +GoUpdateBinaries +qa
}

setup_shell() {
	fish_shell=$(brew --prefix fish)/bin/fish

	if ! grep fish /etc/shells; then
		echo "$fish_shell" | sudo tee -a /etc/shells
		chsh -s "$fish_shell"
		$fish_shell -l -c 'type -q fisher; and exit 0; or curl -sL https://git.io/fisher | source; fisher install jorgebucaran/fisher'
	fi
}

setup_node() {
	if which npm >/dev/null 2>/dev/null; then
		npm i -g \
			npm \
			eslint \
			neovim \
			prettier \
			tslint \
			typescript \
			yarn \
			quicktype \
			ts-node \
			bash-language-server \
			typescript-language-server
	fi
}

setup_rust() {
	if ! which rustc >/dev/null 2>/dev/null; then
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	fi

	rustup self update
	rustup update
	rustup component add clippy rls
	rustup +nightly component add clippy rls miri
	rustup default stable

	rustup target add \
		aarch64-linux-android \
		armv7-linux-androideabi \
		x86_64-linux-android \
		i686-linux-android \
		aarch64-apple-ios \
		x86_64-apple-ios

	cargo install \
		cargo-bloat \
		cargo-fuzz \
		cargo-fix \
		cargo-cache \
		cargo-make \
		cargo-watch
}

setup_cleanup() {
	brew cleanup
}

main() {
	if [ "$(uname -s)" != "Darwin" ]; then
		echo "only mac os supported"
		exit 1
	fi

	setup_base
	setup_shell
	setup_node
	setup_rust
	setup_cleanup
}

main
