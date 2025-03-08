#!/bin/bash

# update the system and repositories
echo -e "\e[32mupdating the system...\e[0m"
sudo pacman -Syu --noconfirm

# install git and base-devel
echo -e "\e[32minstalling git and base-devel...\e[0m"
sudo pacman -S --noconfirm git base-devel

# install yay if it's not already installed
if ! command -v yay &> /dev/null; then
    echo -e "\e[32minstalling yay...\e[0m"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# installations via pacman
echo -e "\e[32minstalling essential tools and editors...\e[0m"
sudo pacman -S --noconfirm \
    vim \
    nano \
    curl \
    wget \
    gcc \
    make \
    dkms \
    perl \
    flatpak \
    python \
    python-pip \
    nodejs \
    npm \
    gimp \
    neofetch \
    discord \
    lm_sensors \
    gnome-font-viewer \

# installations via yay
echo -e "\e[32minstalling applications from AUR...\e[0m"
yay -S --noconfirm \
    visual-studio-code-bin \
    pycharm-community-edition \
    whatsdesk \
    google-chrome \
    min

# install pyenv
echo -e "\e[32minstalling pyenv...\e[0m"
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
' >> ~/.bashrc

# install grub-customizer via wget
echo -e "\e[32minstalling grub-customizer...\e[0m"
wget https://aur.archlinux.org/cgit/aur.git/snapshot/grub-customizer-git.tar.gz
tar -xvf grub-customizer-git.tar.gz
cd grub-customizer-git
makepkg -si --noconfirm
cd ..
rm -rf grub-customizer-git grub-customizer-git.tar.gz

# install pfetch
echo -e "\e[32minstalling pfetch...\e[0m"
git clone https://github.com/dylanaraps/pfetch.git
chmod +x pfetch/pfetch
sudo mv pfetch/pfetch /usr/local/bin/
rm -rf pfetch

# finish
echo -e "\e[32minstallation complete! please restart the system if necessary.\e[0m"
