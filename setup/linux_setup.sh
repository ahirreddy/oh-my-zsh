#!/bin/bash

# Update and install normal stuff
sudo apt update
sudo apt install -y wget iotop curl zsh mosh

# Create a ~/.bin dir for our binaries
mkdir -p ~/bin

# Setup oh-my-zsh
sh -c "$(wget https://raw.github.com/ahirreddy/oh-my-zsh/master/tools/install.sh -O -)"

# Change the shell to zsh
sudo chsh -s /usr/bin/zsh ahirreddy

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Download and install Zellij
# Create a temporary directory
mkdir -p /tmp/zellij
wget https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz -O /tmp/zellij/zellij.tar.gz
# It has a single file, and we want to extract it to ~/.bin
tar -xvf /tmp/zellij/zellij.tar.gz -C ~/bin
