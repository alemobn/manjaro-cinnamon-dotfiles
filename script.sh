#!/bin/bash

# define colors
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
red='\033[0;31m'
nc='\033[0m' # no color

# update the system
echo -e "${blue}updating the system...${nc}"
sudo pacman -Syu --noconfirm

# install git first
echo -e "${green}installing git...${nc}"
sudo pacman -S --noconfirm git

# enable aur support in yay
echo -e "${yellow}enabling aur support in yay...${nc}"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# install basic packages
echo -e "${green}installing basic packages...${nc}"
sudo pacman -S --noconfirm \
    vim \
    htop \
    wget \
    curl \
    neofetch \
    gcc \
    base-devel \
    python \
    python-pip \
    firefox \
    gnome-terminal \
    vlc \
    unzip

# install google chrome (via pamac)
echo -e "${yellow}installing google chrome...${nc}"
pamac build google-chrome

# install min browser (via pamac)
echo -e "${yellow}installing min browser...${nc}"
pamac build min

# install discord
echo -e "${green}installing discord...${nc}"
sudo pacman -S --noconfirm discord

# install grub customizer (via pamac)
echo -e "${yellow}installing grub customizer...${nc}"
pamac build grub-customizer

# install node.js, npm and yarn (via pamac)
echo -e "${green}installing node.js and npm...${nc}"
sudo pacman -S --noconfirm nodejs npm
echo -e "${yellow}installing yarn...${nc}"
pamac build yarn

# install whatsdesk (via pamac)
echo -e "${yellow}installing whatsdesk...${nc}"
pamac build whatsdesk

# install pycharm community edition
echo -e "${green}installing pycharm community edition...${nc}"
sudo pacman -S --noconfirm pycharm-community-edition

# install visual studio code (via pamac)
echo -e "${yellow}installing visual studio code...${nc}"
pamac build visual-studio-code-bin

# install pyenv
echo -e "${green}installing pyenv...${nc}"
curl https://pyenv.run | bash

# finish
echo -e "${blue}installation complete! you may need to reboot the system.${nc}"

# cleanup
echo -e "${red}cleaning up unnecessary packages...${nc}"
sudo pacman -Rns $(pacman -Qdtq) --noconfirm
echo -e "${red}removing cached packages...${nc}"
sudo pacman -Sc --noconfirm

# pamac cleanup
echo -e "${red}cleaning up pamac cache...${nc}"
pamac clean

# yay cleanup
echo -e "${red}cleaning up yay...${nc}"
yay -Rns $(yay -Qdtq) --noconfirm
yay -Sc --noconfirm

echo -e "${green}cleanup complete!${nc}"
