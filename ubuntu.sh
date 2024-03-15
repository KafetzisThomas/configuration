#!/bin/bash

# Get the absolute path to the image
IMAGE_PATH="${HOME}/configuration/settings/Mirror_by_Uday_Nakade.jpg"

# Set the desktop wallpaper using gsettings
gsettings set org.gnome.desktop.background picture-uri "file://$IMAGE_PATH"
echo "Desktop wallpaper set successfully."

# Enable auto-hide dock utility
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
echo "Auto-hide dock utility enabled."

# Change the dock position to the bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
echo "Dock position moved to the bottom."

# Set the icon size of apps in the dock to 48
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size 48

# Disable the appearance of the personal folder icon on the desktop
gsettings set org.gnome.shell.extensions.ding show-home false

# Enable dark mode
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

# Include volumes and devices, network volumes, and trash to the dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true

# Exclude unmounted volumes from the dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-unmounted-volumes false
