#!/bin/bash
set -e

WALLPAPER_PATH="$HOME/Downloads/configuration/assets/wallpaper.jpg"

echo "Setting up font size, dark mode and wallpaper..."

gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.background picture-uri-dark "file://${WALLPAPER_PATH}"
gsettings set org.gnome.desktop.background picture-uri "file://${WALLPAPER_PATH}"

echo "Installing GNOME extensions..."
sudo dnf install -y pipx
pipx install gnome-extensions-cli
pipx ensurepath

export PATH="$HOME/.local/bin:$PATH"


echo "Installing Battery-Health-Charging..."
gext install Battery-Health-Charging@maniacx.github.com


echo "Installing Vitals..."
gext install Vitals@CoreCoding.com


echo "Installing Dash-to-Dock..."
gext install dash-to-dock@micxgx.gmail.com


echo "Installing blur-my-shell..."
gext install blur-my-shell@aunetx


echo "==============================================="
echo "=== GNOME extensions installed successfully ==="
echo "==============================================="
