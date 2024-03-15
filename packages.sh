#!/bin/bash

# Update and upgrade apt packages
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Packages to install using apt
packages=(
    "wget"
    "git"
    "tree"
    "sqlite3"
    "python3-pip"
)

# Install each package using apt
for package in "${packages[@]}"; do
    if dpkg -l | grep -q "^ii  $package"; then
        echo "$package is already installed. Skipping..."
    else
        echo "Installing $package..."
        sudo apt install $package -y
    fi
done

# Update and upgrade apt packages again for safety measures
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "Packages have been installed."

# Git config name and email
echo "Please enter your FULL NAME for Git configuration:"
read git_user_name

echo "Please enter your EMAIL for Git configuration:"
read git_user_email

git config --global user.name "$git_user_name"
git config --global user.email "$git_user_email"

echo "Git has been configured."

# Update and refresh snap packages
sudo snap refresh

# Applications to install using Snap
apps=(
    "firefox"
    "code"
    "spotify"
    "discord"
    "vlc"
)

# Install each application using Snap
for app in "${apps[@]}"; do
    if snap list | grep -q "^$app"; then
        echo "$app is already installed. Skipping..."
    else
        echo "Installing $app..."
        sudo snap install $app
    fi
done

# Update and refresh snap packages again for safety measures
sudo snap refresh

echo "Applications have been installed."

# Install Google Chrome for Ubuntu
cd ~/Downloads
echo "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Delete downloaded file after installation
rm google-chrome-stable_current_amd64.deb

# Get the @shiftkey package feed & install Github Desktop for Ubuntu
echo "Installing GitHub Desktop"
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop

# Change order of apps in the dock
dock_order="['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'firefox_firefox.desktop', 'code_code.desktop', 'org.gnome.Terminal.desktop', 'snap-store_ubuntu-software.desktop', 'spotify_spotify.desktop', 'github-desktop.desktop', 'discord_discord.desktop']"
gsettings set org.gnome.shell favorite-apps "$dock_order"
echo "Order of apps in the dock changed."

echo "Sign in to Google Chrome. Press enter to continue..."
google-chrome
read

echo "Sign in to GitHub Desktop. Press enter to continue..."
github-desktop
read

echo "Sign in to Spotify. Press enter to continue..."
spotify
read

echo "Sign in to Discord. Press enter to continue..."
discord
read
