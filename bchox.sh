# Set Hyprland config file

cp .config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf

# Install yay

sudo pacman -S --needed base-devel git
mkdir ~/github
cd github
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/
rm -rf ~/github/yay

# Install fish shell and kitty terminal

sudo pacman -S fish kitty

# Set fish configuration

# Set kitty configuration

cp .config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Download nerd fonts



# Install Powerline-shell

# Set Powerline-shell configuration

# Download wallpapers in ~/wallpaper
