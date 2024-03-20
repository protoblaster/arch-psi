#!/usr/bin/env bash

PERMISSION=$EUID

check_permission() {
  if [[ $PERMISSION == 0 ]]; then
    echo -e "Congrats... You have root permissions... Proceeding...\n"
    perform_update
    install_packages
  else
    echo -e "Oops... You do not have root permissions! Exiting...\n"
  fi
}

perform_update() {
  read -p "Would you like to update the system (y/n): " choice

  if [[ $choice == 'y' ]]; then
    pacman -Syyu
    if [[ $? == 0 ]]; then
      echo "The system update was successful..."
    else
      echo "The update was not successful..."
      read -p ""
      exit
    fi
  else
    echo "Not proceeding with the system update..."
  fi
}

install_packages() {
  packages=(
    neovim
    jdk-openjdk
    intellij-idea-community-edition
    kotlin
    linux-headers
    base-devel
    chromium
    firefox
    hugo
  )

  for pkg in ${packages[@]}; do
    sudo pacman -S $pkg
  done

  if [[ $? == 0 ]]; then
    echo "The command completed successfully..."
  else
    echo "The command did not complete successfully..."
  fi
}

check_permission
