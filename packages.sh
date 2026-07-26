#!/bin/bash
set -e

echo "Upgrading system and cleaning temp files..."
sudo dnf upgrade -y
sudo dnf clean all


echo "Adding external repositories..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null


echo "Installing Google Chrome..."
sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm


echo "Installing Docker..."
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker


dnf_packages=(
    "gnome-tweaks"
    "gnome-extensions-app"
    "gh"
    "code"
    "maven"
    "sqlitebrowser"
    "ghidra"
)


flatpak_packages=(
    "io.dbeaver.DBeaverCommunity"
    "com.discordapp.Discord"
    "com.usebottles.bottles"
)


echo "Installing DNF packages..."
sudo dnf install -y "${dnf_packages[@]}"


echo "Installing Flatpak packages..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub "${flatpak_packages[@]}"


echo "Installing external CLI tools..."
curl -fsSL https://antigravity.google/cli/install.sh | bash
curl -LsSf https://astral.sh/uv/install.sh | sh


echo "Upgrading system and cleaning temp files again..."
sudo dnf upgrade -y
sudo dnf clean all


echo "Sign in to Google Chrome. Press enter to continue..."
read -r


echo "Sign in to VS Code. Press enter to continue..."
read -r


echo "Sign in to Discord. Press enter to continue..."
read -r


echo "======================================="
echo "=== Packages installed successfully ==="
echo "======================================="
