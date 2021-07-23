#!/bin/bash

# Update
sudo pacman -Syu --noconfirm
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change theme
sed -i '/ZSH_THEME="robbyrussell"/c\ZSH_THEME="agnoster"' ~/.zshrc

# Install terminator
sudo pacman -S terminator --noconfirm
# Setup terminator config
cp config/terminator.txt ~/.config/terminator/config

# Install docker
sudo pacman -S docker --noconfirm

# Start and enable service
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Install PHPStorm
PSTORM="https://data.services.jetbrains.com/products/download?code=PS&platform=linux"
curl -s $PSTORM

# Change default shell
chsh -s $(which zsh)
zsh
