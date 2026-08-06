#!/bin/bash
set -e

PROJECTS_DIR="$HOME/Projects"
mkdir -p "$PROJECTS_DIR"

echo "Configuring Git..."

echo "Enter your Git username:"
read GIT_USERNAME

echo "Enter your Git email:"
read GIT_EMAIL

git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main

echo "Setting up GitHub CLI & cloning repos to $PROJECTS_DIR..."

gh auth login --web

gh repo list --limit 1000 --json sshUrl --jq '.[].sshUrl' |
while read -r repo_url; do
    repo_name=$(basename "$repo_url" .git)
    gh repo clone "$repo_url" "$PROJECTS_DIR/$repo_name"
done

echo "==================================="
echo "=== Git configuration completed ==="
echo "==================================="
