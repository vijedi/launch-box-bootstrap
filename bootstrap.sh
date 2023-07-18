#!/bin/bash

# Use this script to bootstrap a completely new environment. Should really only be used to 
# create a box that can run ansible and terraform for a real dev machine

# Install depedencies for the ansible and terraform install
DEBIAN_FRONTEND=noninteractive sudo apt install --yes gpg gnupg software-properties-common

./install_ansible.sh
./install_terraform.sh

DEBIAN_FRONTEND=noninteractive sudo apt-get --yes update
DEBIAN_FRONTEND=noninteractive sudo apt-get --yes upgrade

DEBIAN_FRONTEND=noninteractive sudo apt install --yes ansible terraform
# We will need mosh to login effectively from an iPad
DEBIAN_FRONTEND=noninteractive sudo apt install --yes mosh

# Copy over the basic tmux config
cp ./dot_files/.tmux.conf ~/

# Make vim the default editor, because nano is annoying
sudo update-alternatives --set editor /usr/bin/vim.basic
