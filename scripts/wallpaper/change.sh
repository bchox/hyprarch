#!/usr/bin/env bash

# Get the directory of the script
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Get the current wallpaper
current="$(swww query | grep -o -m 1 -P '(?<=image: ).*')"

# Find wallpapers in the specified directory
files=($(find ~/wallpaper/ -type f))
files=(${files[@]/$current})

# Check if there are wallpapers to choose from
if [ ${#files[@]} -ge 1 ]; then
  # Choose a random wallpaper
  random="${files[RANDOM % ${#files[@]}]}"

  # Set the new wallpaper
  swww img "${random}"
else
  # No wallpapers available or the current one is the only option
  printf "It was not possible to change the wallpaper because it is either missing or such wallpaper is already installed.\n"
fi

# Get the new wallpaper
newwp="$(swww query | grep -o -m 1 -P '(?<=image: ).*')"
cp -f $newwp ~/.cache/current_wallpaper.jpg

# Wallpy grab colors of new wallpaper\
wal -q -i "$newwp"

# Restart Waybar
killall waybar
sleep 0.2
waybar
