#!/bin/bash

# Project Title: configuration (https://github.com/KafetzisThomas/configuration)
# Author / Project Owner: KafetzisThomas (https://github.com/KafetzisThomas)
# License: MIT

########################################
# This script:
#   installs Linux [Ubuntu] Software
#   installs Apt & Snap Packages (Apps)
#   sets up VS Code
########################################


# Make scripts executable
chmod +x packages.sh
chmod +x vscode.sh

# Run scripts
./packages.sh
./vscode.sh

echo "Installation Complete!"
