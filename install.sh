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


# Run the packages script
./packages.sh

# Run vs code script
./vscode.sh

echo "Installation Complete!"
