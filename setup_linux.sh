#!/bin/sh
# set up file for LinuX

echo "Setting up for LinuX"

sudo apt-get install vim
sudo apt-get install git
sudo apt-get install zsh
sudo apt-get install tmux
sudo apt-get install curl

dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < dotfiles/green_machine.dconf


