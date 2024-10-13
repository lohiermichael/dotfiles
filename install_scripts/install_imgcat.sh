#!/bin/bash

# Variables
IMG_CAT_URL="https://iterm2.com/utilities/imgcat"
INSTALL_DIR="/tmp"             # Temporary directory for downloading
EXECUTABLE_DIR="/usr/local/bin"
IMG_CAT_NAME="imgcat"

# Function to print messages
function info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

function success() {
    echo -e "\033[1;32m[SUCCESS]\033[0m $1"
}

function error() {
    echo -e "\033[1;31m[ERROR]\033[0m $1"
}

# 1. Check if curl is installed
if ! command -v curl &>/dev/null; then
    error "curl is not installed. Please install curl first."
    exit 1
fi

# 2. Download the imgcat script to INSTALL_DIR
info "Downloading imgcat script from $IMG_CAT_URL to $INSTALL_DIR..."

curl -L "$IMG_CAT_URL" -o "$INSTALL_DIR/$IMG_CAT_NAME" || {
    error "Failed to download imgcat script."
    exit 1
}

# 3. Make the script executable
info "Making imgcat script executable..."

chmod +x "$INSTALL_DIR/$IMG_CAT_NAME" || {
    error "Failed to make imgcat executable."
    exit 1
}

# 4. Check if imgcat already exists in EXECUTABLE_DIR and remove it if necessary
info "Checking if imgcat script already exists in $EXECUTABLE_DIR..."

if [ -f "$EXECUTABLE_DIR/$IMG_CAT_NAME" ]; then
    info "Removing existing imgcat script from $EXECUTABLE_DIR..."
    sudo rm -f "$EXECUTABLE_DIR/$IMG_CAT_NAME" || {
        error "Failed to remove existing imgcat script."
        exit 1
    }
fi

# 5. Move the imgcat script to EXECUTABLE_DIR
info "Moving imgcat script to $EXECUTABLE_DIR..."

sudo mv "$INSTALL_DIR/$IMG_CAT_NAME" "$EXECUTABLE_DIR" || {
    error "Failed to move imgcat script to $EXECUTABLE_DIR."
    exit 1
}

# 6. Ensure EXECUTABLE_DIR is in the PATH if not already
if ! echo "$PATH" | grep -q "$EXECUTABLE_DIR"; then
    info "Adding $EXECUTABLE_DIR to your PATH."
    echo "export PATH=\$PATH:$EXECUTABLE_DIR" >> "$HOME/.bashrc"
    echo "export PATH=\$PATH:$EXECUTABLE_DIR" >> "$HOME/.zshrc"
    source "$HOME/.bashrc" || source "$HOME/.zshrc"
fi

# 7. Verify installation
if command -v imgcat &>/dev/null; then
    success "imgcat installed successfully!"
    echo "You can now use imgcat to display images in iTerm2."
else
    error "Installation failed. imgcat not found."
    exit 1
fi

