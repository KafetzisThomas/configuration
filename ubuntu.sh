#!/bin/bash

# Get the absolute path to the image
IMAGE_PATH="${HOME}/configuration/settings/Mirror_by_Uday_Nakade.jpg"

# Set the desktop wallpaper using gsettings
gsettings set org.gnome.desktop.background picture-uri "file://$IMAGE_PATH"

echo "Desktop wallpaper set successfully."
