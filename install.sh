#!/bin/sh

set -e

install_base() {
	HOMEBREW_URL=https://raw.githubusercontent.com/Homebrew/install/master/install

	if ! which brew >/dev/null 2>/dev/null; then
		echo 'Installing homebrew'
		/usr/bin/ruby -e "$(curl -fsSL $HOMEBREW_URL)" 2>/dev/null >/dev/null
	fi

	brew tap 'homebrew/bundle'
	brew bundle install || true
	brew upgrade || true
	$(brew --prefix)/opt/fzf/install
	brew cleanup

	git submodule update --init

	pip3 install --user -U pip neovim pynvim msgpack
	gem install --no-document -u neovim

	nvim +PlugUpgrade +qa
	nvim +PlugUpdate +qa
	nvim +UpdateRemotePlugins +qa
}

install_node() {
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
			bash-language-server \
			ts-node \
			typescript-language-server
	fi
}

install_go() {
	if which go >/dev/null 2>/dev/null; then
		go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
		go install honnef.co/go/tools/cmd/staticcheck@latest
		go install github.com/cjbassi/gotop@latest
		go install github.com/jesseduffield/lazydocker@latest
		go install github.com/mgechev/revive@latest
	fi
}

install_rust() {
	if ! which rustc >/dev/null 2>/dev/null; then
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	fi

	rustup update
	rustup component add clippy rls
	rustup +nightly component add clippy rls
	rustup default stable
	cargo install cargo-bloat cargo-fuzz cargo-fix cargo-cache cargo-count
}

main() {
	if [ "$(uname -s)" != "Darwin" ]; then
		echo "only mac os supported"
		exit 1
	fi

	install_base
	# install_node
	install_go
	install_rust
}

main
