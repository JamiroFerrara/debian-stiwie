#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 

username=$(id -u -n 1000)
builddir=$(pwd)

# Add Custom Titus Rofi Deb Package
dpkg -i 'Custom Packages/rofi_1.7.0-1_amd64.deb'

# Update packages list
apt update

# Add base packages
apt install unzip picom ripgrep bspwm polybar sddm rofi kitty thunar flameshot neofetch sxhkd git lxpolkit lxappearance xorg curl snapd arandr -y
apt install papirus-icon-theme lxappearance fonts-noto-color-emoji fonts-firacode fonts-font-awesome libqt5svg5 qml-module-qtquick-controls mpv -y

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Fira Code Nerd Font variant needed
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
unzip Meslo.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
unzip Iosevka.zip -d /usr/share/fonts

fc-cache -vf

cd $builddir
mkdir -p /home/$username/.config
cp .Xresources /home/$username
cp .Xnord /home/$username
cp -R dotfiles/* /home/$username/.config/
chown -R $username:$username /home/$username

source $builddir/installbrave.sh

#source $builddir/installnvim.sh
#install nvim
sudo apt-get install -y neovim
mkdir /home/stiwie/Downloads
cd /home/stiwie/Downloads
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv /home/stiwie/Downloads/nvim-linux64/bin/nvim /usr/bin

#source $builddir/installnode.sh
apt install -y nodejs
apt-get install -y npm

#STAGE 2
npm install --location=global yarn

#source ./installspotify.sh
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update && sudo apt-get install -y spotify-client

#source $builddir/chezmoi.sh
