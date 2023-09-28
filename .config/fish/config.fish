. ~/.config/fish/aliases.fish
. ~/.config/fish/secrets.fish

set -gx fish_greeting ''
set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'fd --type f'

set -gx GOPATH ~/.go
set -gx NPM_CONFIG_PREFIX ~/.npm-global
set -gx GEM_HOME ~/.gems
set -gx GRPC_GO_LOG_VERBOSITY_LEVEL 99
set -gx GRPC_GO_LOG_SEVERITY_LEVEL info
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_AUTO_UPDATE_SECS 604800
set -gx ANDROID_SDK ~/Library/Android/sdk
set -gx EDITOR (which nvim)
set -gx GIT_EDITOR $EDITOR

fish_add_path -gp PATH $GOPATH/bin
fish_add_path -gp PATH ~/.cargo/bin
fish_add_path -gp PATH ~/.npm-global/bin
fish_add_path -gp PATH ~/.rvm/bin
fish_add_path -gp PATH ~/.gems/bin
fish_add_path -gp PATH ~/bin
fish_add_path -gp PATH /opt/homebrew/bin
fish_add_path -gp PATH /usr/local/sbin
fish_add_path -gp PATH (brew --prefix)/bin
fish_add_path -gp PATH (brew --prefix ruby)/bin

if status is-login
end

if status is-interactive
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

