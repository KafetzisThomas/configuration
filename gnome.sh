#!/bin/bash
set -e

echo "Setting up GNOME extensions..."
sudo dnf install -y pipx
pipx install gnome-extensions-cli
pipx ensurepath


echo "Installing Battery-Health-Charging..."
$HOME/.local/bin/gext install Battery-Health-Charging@maniacx.github.com


echo "Installing Vitals..."
$HOME/.local/bin/gext install Vitals@CoreCoding.com


echo "Installing blur-my-shell..."
$HOME/.local/bin/gext install blur-my-shell@aunetx


echo "==============================================="
echo "=== GNOME extensions installed successfully ==="
echo "==============================================="
