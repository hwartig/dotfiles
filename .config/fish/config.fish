set -gx EDITOR nvim
set -gx GOPATH ~/gopath
set -gx GOROOT (go env GOROOT)
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

fish_add_path $HOME/bin
fish_add_path $GOPATH/bin
# `touch .git/save` in a git repo will add bin to the path 
fish_add_path .git/save/../../bin
# uv
fish_add_path "/Users/harry/.local/bin"

# alias for dotfile repo management
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias brewi="cat ~/Library/Caches/Homebrew/api/formula_names.txt | fzf --bind 'enter:become(brew info {})'"
alias brewif="cat ~/Library/Caches/Homebrew/api/formula_names.txt | fzf --bind 'enter:execute(jq \".payload | fromjson | .[] | select(.name == \\\\"{}\\\\") | .name, .full_name, .desc, .homepage, .license, .versions.stable, .installed, .deprecated\" ~/Library/Caches/Homebrew/api/formula.jws.json)'"
alias cl=commit-later
alias https="http --default-scheme=https"
alias httpserver='ruby -run -e httpd . -p 1234'
alias vi=nvim
alias wiki="nvim -c':VimwikiIndex' -c'lcd %:h'"
