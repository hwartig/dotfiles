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

ruby_version=2.2.0

brew_taps="
caskroom/cask
homebrew/dupes
homebrew/python
homebrew/science
homebrew/versions
"

brew_packages="
R
apache-spark
autojump
awscli
boot2docker
curl
fish
gnu-sed
go
graphviz
hg
htop-osx
httpie
httrack
hub
imagemagick
jq
legit
maven
memcached
mongodb
mono
moreutils
mysql
node
ohcount
p7zip
postgresql
pv
pwgen
python
q
qt
rbenv
reattach-to-user-namespace
redis
ruby-build
sbt
sdl
sdl2
siege
the_silver_searcher
thrift
tig
tmux
tree
vim
wget
youtube-dl
"

cask_packages="
anvil
caffeine
cakebrew
calibre
cfxr
cheatsheet
colloquy
cyberduck
daisydisk
dropbox
filezilla
firefox
gas-mask
gimp
github
google-chrome
google-drive
handbrake
hipchat
inkscape
intellij-idea
iterm2
java
jdownloader
keycastr
kitematic
licecap
linein
mou
obs
psequel
razorsql
rescuetime
retroshare
robomongo
rstudio
screenhero
sequel-pro
shortcat
skitch
skype
soulver
soundflower
spectacle
teamviewer
transmission
vagrant
virtualbox
wineskin-winery
xquartz
"

files_to_symlink="
agignore
config/fish
gitconfig
githelpers
gitignore
janus
octaverc
omf
parallel
tmux.conf
vimrc.after
vimrc.before
"

brew update
brew upgrade --all

for brew_tap in $brew_taps; do
  brew tap $brew_tap
done

for brew_package in $brew_packages; do
  brew install $brew_package
done

brew install caskroom/cask/brew-cask

for cask_package in $cask_packages; do
  brew cask install $cask_package
done

# Install or update Janus
if [ -e "$HOME/.vim" ]; then
  cd "$HOME/.vim"
    rake
  cd -
else
  curl -Lo- https://bit.ly/janus-bootstrap | bash
fi
git submodule init
git submodule update

# Install or update oh-my-fish
if [ -e "${HOME}/.config/omf" ]; then
  omf update
else
  # set CI env variable so omf installation doesn't swap processes
  CI=true curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
  omf update
fi

# Remove some files oh-my-fish installation already created
rm -r ~/.config/fish
rm -r ~/.config/omf

fancy_echo "Creating Symlinks"
for file in $files_to_symlink; do
  ln -sfFh ~/.dotfiles/$file ~/.$file
done

eval "$(rbenv init - )"

if ! rbenv versions | grep -Fq "$ruby_version"; then
  rbenv install -s "$ruby_version"
fi

rbenv global "$ruby_version"
rbenv shell "$ruby_version"

gem update --system

gem_install_or_update 'bundler'

fancy_echo "Configuring Bundler ..."
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))

case "$SHELL" in
  */fish) : ;;
  *)
    fancy_echo "Changing your shell to fish ..."
      chsh -s "$(which fish)"
    ;;
esac

if [ -e "$HOME/Develop" ]; then
  find "$HOME/Develop" -name '.git' -execdir git fetch --all \;
else
  mkdir "$HOME/Develop"
fi
