#!/bin/sh

TARGET_DIR="$HOME/.tmux/plugins/tpm"
REPO_URL="https://github.com/tmux-plugins/tpm"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory $TARGET_DIR does not exist. Cloning repository..."
  git clone "$REPO_URL" "$TARGET_DIR"
else
  echo "Directory $TARGET_DIR already exists. Skipping clone."
fi

