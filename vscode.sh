#!/bin/bash

# Visual Studio Code extensions to install
extensions=(
    "ms-python.python"
    "ms-python.pylint"
    "ms-python.vscode-pylance"
    "ms-python.debugpy"
    "formulahendry.code-runner"
    "GitHub.github-vscode-theme"
    "ritwickdey.LiveServer"
)

# Check and install each extension using the code command
for extension in "${extensions[@]}"; do
    if code --list-extensions | grep -q "$extension"; then
        echo "$extension is already installed. Skipping..."
    else
        echo "Installing $extension..."
        code --install-extension "$extension"
    fi
done

echo "Visual Studio Code extensions have been installed."

# Target directory for VS Code user settings on Ubuntu
VSCODE_USER_SETTINGS_DIR="${HOME}/.config/Code/User/"

# Check if VS Code settings directory exists
if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    # Backup existing settings.json, if exists
    cp "${VSCODE_USER_SETTINGS_DIR}/settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json.backup"
    # Copy custom settings.json to the VS Code settings directory
    cp "settings/VSCode-Settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json"

    echo "VS Code settings have been updated."
else
    echo "VS Code user settings directory does not exist. Please ensure VS Code is installed."
fi
