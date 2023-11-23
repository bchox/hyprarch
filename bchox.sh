#!/bin/bash
# Install yay

sudo pacman -S --needed base-devel git
mkdir ~/github
cd github
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/
rm -rf ~/github/yay

##====INSTALL ALL YAY PACKAGES====##

install_packages() {
    local packages="$@"  # Capture all the packages passed as parameters.

    yay -S --noconfirm $packages
}

# Install the specified packages.
install_packages extra/fish extra/kitty extra/ttf-sourcecodepro-nerd aur/powerline-shell aur/swww extra/firefox

##====DONE INSTALLING PACKAGES====##

# Download wallpapers in ~/wallpaper

cd ~
git clone https://gitlab.com/stephan-raabe/wallpaper.git

# Set fish configuration
mkdir ~/.config/fish
cp .config/fish/config.fish ~/.config/fish/config.fish

# Set kitty configuration
mkdir ~/.config/kitty
cp .config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Set Powerline-shell configuration
sudo cp .config/powerline-shell/__init__.py /usr/lib/python3.11/site-packages/powerline-shell/__init__.py
mkdir -p ~/.config/powerline-shell/themes
cp .config/powerline-shell/themes/flames.py ~/.config/powerline-shell/themes/flames.py
cp .config/powerline-shell/config.json ~/.config/powerline-shell/config.json

# Set SWWW Random script
mkdir ~/.config/swww
cp .config/swww/swwwran.sh ~/.config/swww/swwwran.sh

# Set Hyprland config file

cp .config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
