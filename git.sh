#!/bin/bash
set -e

echo "Configuring Git..."
git config --global user.name "KafetzisThomas"
git config --global user.email "tomkafetzis06@gmail.com"
git config --global init.defaultBranch main

echo "Setting up GitHub CLI & repositories..."

PROJECTS_DIR="$HOME/Documents/Projects"
mkdir -p "$PROJECTS_DIR"

gh auth login --web

gh repo list --limit 1000 --json sshUrl --jq '.[].sshUrl' |
while read -r repo_url; do
    repo_name=$(basename "$repo_url" .git)
    gh repo clone "$repo_url" "$PROJECTS_DIR/$repo_name"
done

echo "==================================="
echo "=== Git configuration completed ==="
echo "==================================="
