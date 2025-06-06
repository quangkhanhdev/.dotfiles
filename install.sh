#!/bin/bash

# Navigate to the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/quangkhanhdev/.dotfiles.git "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

# Install Stow if not present (Arch Linux)
if ! command -v stow &> /dev/null
then
    echo "stow not found. Installing stow..."
    sudo pacman -S stow --noconfirm
fi

# Apply dotfiles using Stow
echo "Stowing dotfiles..."
stow .
echo "Dotfiles setup complete!"

# Install packages
echo "Installing essential packages..."
sudo pacman -S noto-fonts-emoji noto-fonts ttf-meslo-nerd ttf-firacode-nerd --noconfirm
sudo pacman -S alacritty zsh git i3 rofi polybar gnome-keyring flameshot copyq rofi-emoji --noconfirm

# Optional: Post-setup configurations
chsh -s $(which zsh)
