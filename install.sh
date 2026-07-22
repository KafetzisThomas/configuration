#!/bin/bash
set -e

bash packages.sh
bash gnome.sh
bash git.sh

echo "================================"
echo "=== Setup has been completed ==="
echo "================================="
