#!/bin/bash

set -e

echo "Installing Hyprland-like macOS tiling setup..."

# Install dependencies
brew install glide koekeishiya/formulae/skhd

# Copy configs
mkdir -p ~/.config/glide ~/.config/skhd
cp glide/glide.toml ~/.config/glide/glide.toml
cp skhd/skhdrc ~/.config/skhd/skhdrc

# Start Glide and install as login service
glide launch
glide service install

# Start skhd (app launcher keybindings)
skhd --install-service
skhd --start-service

echo ""
echo "Done! Grant Accessibility permissions to Glide and skhd:"
echo "  System Settings > Privacy & Security > Accessibility"
echo ""
echo "Then press Alt+Z on any space to activate tiling."
