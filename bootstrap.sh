#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    fancy_echo "Updating %s ..." "$1"
    gem update "$@"
  else
    fancy_echo "Installing %s ..." "$1"
    gem install "$@"
    rbenv rehash
  fi
}

sudo -v

fancy_echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  fancy_echo "Couldn't find Homebrew... so lets install it"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

fancy_echo "Update Homebrew and install Brewfile dependencies"

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

fancy_echo "Restoring mackup"

if [ ! -e "${HOME}/.mackup.cfg" ]; then
  ln -sfFh $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg
fi
mackup restore

`which fish`<<UPDATE_FISHER
fisher update
UPDATE_FISHER

if [ -e "$HOME/Develop" ]; then
  find "$HOME/Develop" -name '.git' -not -path "*node_modules*" -execdir pwd \; -execdir git fetch --all \;
else
  mkdir "$HOME/Develop"
fi
