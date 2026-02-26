#!/bin/bash

set -e

echo "Installing Hyprland-like macOS setup..."

# Install dependencies
brew install koekeishiya/formulae/yabai koekeishiya/formulae/skhd FelixKratz/formulae/borders

# Copy configs
mkdir -p ~/.config/yabai ~/.config/skhd ~/.config/borders

cp yabai/yabairc ~/.config/yabai/yabairc
cp skhd/skhdrc ~/.config/skhd/skhdrc
cp borders/bordersrc ~/.config/borders/bordersrc

chmod +x ~/.config/yabai/yabairc ~/.config/borders/bordersrc

# Start services
yabai --start-service
skhd --start-service
brew services start felixkratz/formulae/borders

echo ""
echo "Done! Grant Accessibility permissions to yabai and skhd:"
echo "  System Settings > Privacy & Security > Accessibility"
echo ""
echo "For animations, disable SIP and run:"
echo "  echo \"\$(whoami) ALL=(root) NOPASSWD: sha256:\$(shasum -a 256 \$(which yabai) | cut -d \" \" -f 1) \$(which yabai) --load-sa\" | sudo tee /private/etc/sudoers.d/yabai"
