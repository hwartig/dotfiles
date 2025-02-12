## suppress fish greeting
#set fish_greeting ""

set -gx EDITOR nvim
set -gx GOPATH ~/gopath
set -gx GOROOT (go env GOROOT)
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
##set -gx FZF_DEFAULT_COMMAND "rg --no-ignore --column --line-number --no-heading --color=always --smart-case -- %s"
#set -gx FZF_DEFAULT_COMMAND 'rg --no-ignore --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'


#set PATH .git/safe/../../bin $HOME/bin $PATH $GOPATH/bin
fish_add_path $HOME/bin
fish_add_path $GOPATH/bin
# `touch .git/save` in a git repo will add bin to the path 
fish_add_path .git/save/../../bin
# uv
fish_add_path "/Users/harry/.local/bin"

# alias for dotfile repo management
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#set -gx PYTHONSTARTUP ~/.pythonrc

## set useful aliases
#alias ll='ls -lh'
#alias lla='ls -alhF'
#alias la='ls -A'
#alias l='ls'


alias vi=nvim
alias n=nvim
alias cl=commit-later
alias https="http --default-scheme=https"

alias space="op item get contentful.com --vault=Private --field label=space"
alias organization="op item get contentful.com --vault=Private --field label=organization"
alias cpa-token="op item get contentful.com --vault=Private --field label=cpa-token"
alias cda-token="op item get contentful.com --vault=Private --field label=cda-token"
alias cma-token="op item get contentful.com --vault=Private --field label=cma-token"
alias cda="https -a (cda-token) -Abearer"
alias cpa="https -a (cpa-token) -Abearer"
alias cma="https -a (cma-token) -Abearer"
alias gql="https -a (cda-token) -Abearer"

## use hub in favor of git
#alias git="hub"
#alias gti="hub"
#alias gi="hub"

#alias cmpmaster='git log (git symbolic-ref -q HEAD) --not master --pretty=oneline --abbrev-commit --decorate'

#alias b="bundle"
#alias bi="bundle install -j8"
#alias bo="bundle open"
#alias bx="bundle exec"
#alias bxr="bundle exec rake"
#alias bxc="bundle exec cap"
#alias bespec="bundle exec rspec"
#alias ax="aws-vault exec work -- bundle exec"
#alias axr="aws-vault exec work -- bundle exec rake"

alias rubyctags='ctags -R --languages=ruby --exclude=.git --exclude=log . (ruby -e "puts \$LOAD_PATH") (bundle list --paths)'
alias httpserver='ruby -run -e httpd . -p 1234'
alias wiki="nvim -c':VimwikiIndex' -c'lcd %:h'"
