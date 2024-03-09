#!/bin/bash
############################
# This script:
#   installs Linux [Ubuntu] Software
#   installs Apt & Snap Packages (Apps)
#   sets up VS Code
############################

# Run the ubuntu script
./ubuntu.sh

# Run the packages script
./packages.sh

# Run vs code script
./vscode.sh

echo "Installation Complete!"
