# suppress fish greeting
set fish_greeting ""

set -x EDITOR /usr/local/bin/vim
set -x GOPATH ~/Develop/gopath
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

set PATH $PATH $HOME/Develop/gopath/bin $HOME/.dotfiles/bin


# set useful aliases
alias ll='ls -lh'
alias lla='ls -alhF'
alias la='ls -A'
alias l='ls'

alias rgrep='grep -R --color=auto'

alias vi='vim -p'
alias vim='vim -p'

# use hub in favor of git
alias git="hub"
alias gti="hub"
alias gi="hub"

alias cmpmaster='git log (git symbolic-ref -q HEAD) --not master --pretty=oneline --abbrev-commit --decorate'

alias b="bundle"
alias bi="bundle install -j8"
alias bo="bundle open"
alias bx="bundle exec"
alias bxr="bundle exec rake"
alias bxc="bundle exec cap"

alias pigl='pig -x local'
