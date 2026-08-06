#!/bin/bash
set -e

bash packages.sh
bash battery.sh
bash gnome.sh
bash git.sh

echo "================================"
echo "=== Setup has been completed ==="
echo "================================"
