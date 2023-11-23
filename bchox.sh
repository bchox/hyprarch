#!/bin/bash
# Install yay

sudo pacman -S --needed base-devel git
mkdir -p ~/github
cd ~/github
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
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
config_fish=~/.config/fish
mkdir -p $config_fish
cp .config/fish/config.fish $config_fish/config.fish

# Set kitty configuration
config_kitty=~/.config/kitty
mkdir -p $config_kitty
cp .config/kitty/kitty.conf $config_kitty/kitty.conf

# Set Powerline-shell configuration
config_powerline=~/.config/powerline-shell
mkdir -p $config_powerline/themes
cp .config/powerline-shell/__init__.py /usr/lib/python3.11/site-packages/powerline-shell/__init__.py
cp .config/powerline-shell/themes/flames.py $config_powerline/themes/flames.py
cp .config/powerline-shell/config.json $config_powerline/config.json

# Set SWWW Random script
config_swww=~/.config/swww
mkdir -p $config_swww
cp .config/swww/swwwran.sh $config_swww/swwwran.sh

# Set Hyprland config file
config_hypr=~/.config/hypr
mkdir -p $config_hypr
cp .config/hypr/hyprland.conf $config_hypr/hyprland.conf
