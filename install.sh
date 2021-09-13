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
			eslint \
			neovim \
			prettier \
			serve \
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
		go get -u -v \
			google.golang.org/protobuf/cmd/protoc-gen-go \
			honnef.co/go/tools/cmd/staticcheck \
			github.com/mvrilo/go-cpf/cmd/cpf \
			github.com/mvrilo/protog/cmd/protog \
			github.com/cjbassi/gotop \
			github.com/jesseduffield/lazydocker \
			github.com/mgechev/revive
	fi
}

install_rust() {
	if ! which rustc >/dev/null 2>/dev/null; then
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	fi

	rustup update
	rustup component add clippy miri rls
	rustup +nightly component add clippy miri rls
	rustup default nightly
	cargo install cargo-bloat cargo-fuzz cargo-fix

	(
		cd /tmp
		curl -sSfLo rust_analyzer.gz https://github.com/rust-analyzer/rust-analyzer/releases/download/2021-05-24/rust-analyzer-x86_64-apple-darwin.gz
		gunzip rust_analyzer.gz
		chmod +x rust_analyzer
		mv rust_analyzer $HOME/bin/
	)
}

main() {
	if [ "$(uname -s)" != "Darwin" ]; then
		echo "only mac os supported"
		exit 1
	fi

	install_base
	install_node
	install_go
	install_rust
}

main
