#!/bin/bash

set -e

echo "Installing Hyprland-like macOS tiling setup (Glide)..."

# Install Glide
brew install glide

# Copy config
mkdir -p ~/.config/glide
cp glide/glide.toml ~/.config/glide/glide.toml

# Start Glide and install as login service
glide launch
glide service install

echo ""
echo "Done! Grant Accessibility permissions to Glide:"
echo "  System Settings > Privacy & Security > Accessibility"
echo ""
echo "Then press Alt+Z on any space to activate tiling."
