#! /usr/bin/bash

#
# XTC's arch based post installation script
# Version: 1.0
# Github: https://github.com/protoblaster/arch-psi.git
#

# check for sudo permissions
if [[ $EUID == 0 ]]; then
    echo -e "You have the correct permissions! \n"
else
    echo -e "You do not have the correct permissions \n"

fi

# update the system
read -p "Would you like to update the system? (y/n):> " choice1

if [[ $choice1 == 'n' ]]; then
    continue
elif [[ $choice1 == 'y' ]]; then
    pacman -Syyu
fi

# add packages to this list for them to be installed
packages=(
    'intellij-idea-community-edition',
    'jdk-openjdk'
    'python'
    'python-pip'
    'tk'
    'tcl'
    'base-devel'
    'linux-headers'
)

# display chosen packages
for $package in ${packages[@]}; do
    echo $package
done

# ask if you want packages to be installed
read -p "Install the following packages? (y/n):> " choice2

# install packages or leave script
if [[ $choice2 == 'n' ]]; then
    continue
elif [[ $choice2 == 'y' ]]; then
    for $package in ${packages[@]}; do
        pacman -S $package
    done
fi

# exit gracefully
echo -e "This script has exited successfully! \n"
