#!/bin/bash

# Update and upgrade apt packages
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Packages to install using apt
packages=(
    "curl"
    "git"
    "tree"
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

# Install Google Chrome
cd ~/Downloads
echo "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Install VS Code
cd ~/Downloads
echo "Installing VS Code"
wget -qO- https://update.code.visualstudio.com/latest/linux-deb-x64/stable > code_latest_amd64.deb
sudo dpkg -i code_latest_amd64.deb

# Install GitHub Desktop
cd ~/Downloads
echo "Installing GitHub Desktop"
wget https://github.com/shiftkey/desktop/releases/download/release-3.2.1-linux1/GitHubDesktop-linux-3.2.1-linux1.deb
sudo dpkg -i GitHubDesktop-linux-3.2.1-linux1.deb

# Install Spotify
echo "Installing Spotify"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get install spotify-client

# Install Discord
cd ~/Downloads
echo "Installing Discord"
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb

# Install DB Browser for SQLite
echo "Installing DB Browser for SQLite"
sudo apt-get install sqlitebrowser

# Update and upgrade apt packages again for safety measures
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Delete downloaded files after installation
cd ~/Downloads
rm google-chrome-stable_current_amd64.deb
rm code_latest_amd64.deb
rm GitHubDesktop-linux-3.2.1-linux1.deb
rm discord.deb

echo "Applications have been installed."

# Change order of apps in the dock
dock_order="['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'firefox-esr.desktop', 'code.desktop', 'org.gnome.Terminal.desktop', 'spotify.desktop', 'github-desktop.desktop', 'discord.desktop', 'sqlitebrowser.desktop', 'org.gnome.Software.desktop']"
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
