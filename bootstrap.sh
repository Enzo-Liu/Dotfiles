#!/usr/bin/env bash
#
# bootstrap installs things.

DOTFILES_ROOT="`pwd`"

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_files () {
  ln -s $1 $2
  success "linked $1 to $2"
}

install_dotfiles () {
  info 'installing dotfiles'

  for source in $(ls -l |grep -v "bootstrap.sh"| awk '{print $9}')
  do
    source="$DOTFILES_ROOT/`basename \"${source}\"`"
    dest="$HOME/.`basename \"${source}\"`"
    rm -rf $dest
    link_files $source $dest
  done
}
install_dotfiles
echo "SUCCESS LINK ALL FILE"
