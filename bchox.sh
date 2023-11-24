#!/bin/bash

# Get the directory of the script
script_dir=$(dirname "$(readlink -f "$0")")

# Update pacman reps and Install Hyprland
sudo pacman -Syu hyprland 

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
install_packages extra/fish extra/kitty extra/ttf-sourcecodepro-nerd aur/swww extra/firefox core/nano aur/nvchad-git extra/fisher extra/github-cli extra/neofetch extra/htop extra/rofi extra/pavucontrol extra/python-pywal extra/thunar extra/gtk4

##====DONE INSTALLING PACKAGES====##

# Download wallpapers in ~/wallpaper

cd ~
git clone https://gitlab.com/stephan-raabe/wallpaper.git

# Set fish configuration
config_fish=.config/fish
mkdir -p ~/$config_fish
cp -f $script_dir/$config_fish/config.fish ~/$config_fish/config.fish

# Set kitty configuration
config_kitty=.config/kitty
mkdir -p ~/$config_kitty
cp -f $script_dir/$config_kitty/kitty.conf ~/$config_kitty/kitty.conf

# Set SWWW Random script
#config_swww=~/.config/swww
#mkdir -p $config_swww
#cp -f $script_dir/.config/swww/swwwran.sh $config_swww/swwwran.sh


# Set waybar > pywal > swww > config and script
config_waybar=.config/waybar
waltempl_dir=.config/wal/templates
scriptwp_dir=scripts/wallpaper
mkdir -p ~/$config_waybar
mkdir -p ~/$waltempl_dir
mkdir -p ~/$scriptwp_dir
cp -f $script_dir/$config_waybar/* ~/$config_waybar/
cp -f $script_dir/$waltempl_dir/colors-placeholders.css ~/$waltempl/colors-placeholders.css
cp -f $script_dir/$scriptwp_dir/change.sh ~/$scriptwp_dir/change.sh


# Set Hyprland config file
config_hypr=~/.config/hypr
mkdir -p $config_hypr
cp -f $script_dir/.config/hypr/hyprland.conf $config_hypr/hyprland.conf

# Go into fish > Install Tide > Configure Tide > Exit fish

fish
fisher install IlanCosman/tide@v6
tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time=No --rainbow_prompt_separators=Round --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='One line' --prompt_spacing=Sparse --icons='Many icons' --transient=no 
exit



