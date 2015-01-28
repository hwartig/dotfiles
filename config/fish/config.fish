# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# suppress fish greeting
set fish_greeting ""

set -x EDITOR /usr/local/bin/vim
set -x GOPATH ~/Develop/gopath
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

set fish_plugins localhost extract brew rbenv

. /usr/local/etc/autojump.fish

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

#status --is-interactive; and . (rbenv init -|psub)

. $fish_path/custom/virtualfish/virtual.fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Hard code path till we find out why tmux does reorder it.
set -g -x PATH /Users/harry/.rbenv/shims /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin /Users/harry/Develop/gopath/bin /Users/harry/.dotfiles/bin /opt/X11/bin
