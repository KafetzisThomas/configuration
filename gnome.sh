#!/bin/bash
set -e

WALLPAPER_PATH="$HOME/Downloads/configuration/assets/wallpaper.jpg"

echo "Setting up font size, dark mode and wallpaper..."

gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.background picture-uri-dark "file://${WALLPAPER_PATH}"
gsettings set org.gnome.desktop.background picture-uri "file://${WALLPAPER_PATH}"

echo "Open Extension Manager:"

echo "Install Battery Health Charging. Press enter to continue..."
read -r

echo "Install Vitals. Press enter to continue..."
read -r

echo "Install Dash to Dock. Press enter to continue..."
read -r

echo "Install Blur My Shell. Press enter to continue..."
read -r

echo "====================================="
echo "=== GNOME configuration completed ==="
echo "====================================="
