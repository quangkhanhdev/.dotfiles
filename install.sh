#!/bin/bash

# Navigate to the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"
DOWNLOADS_DIR="$HOME/Downloads"

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

# Install Yay
cd "$DOWNLOADS_DIR"
echo "Installing yay as AUR package manager"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Install i3
sudo pacman -S i3-wm i3lock i3status xorg-server xorg-xrandr xorg-xinit

# Install personal packages
yay -S zsh wget curl stow nano htop fastfetch alacritty flameshot rofi rofi-emoji pwvucontrol polybar dunst picom network-manager-applet nitrogen gdm flameshot copyq fcitx5-bamboo fcitx5-configtool fcitx5-gtk gnome-keyring --noconfirm

# Install audio
yay -S pipewire pipewire-jack pipewire-pulse wireplumber --noconfirm
systemctl --user enable pipewire
systemctl --user enable pipewire-pulse

# Enable Services
sudo systemctl enable NetworkManager
sudo systemctl enable gdm

# Install essential fonts
yay -S ttf-meslo-nerd ttf-noto-nerd ttf-meslo-nerd papirus-icon-theme --noconfirm
# refresh font cache
fc-cache -fv

# OhMyZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set background
nitrogen --set-zoom-fill $DOTFILES_DIR/Themes/background/anime_4k.jpeg --save

# Change default shell to ZSH
chsh -s $(which zsh)