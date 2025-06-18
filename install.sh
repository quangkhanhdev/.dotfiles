#!/bin/bash

# Navigate to the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/quangkhanhdev/.dotfiles.git "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

# Install Stow if not present (Arch Linux)
if ! command -v stow --adopt &> /dev/null
then
    echo "stow not found. Installing stow..."
    sudo pacman -S stow --noconfirm
fi

# Apply dotfiles using Stow
echo "Stowing dotfiles..."
stow .
echo "Dotfiles setup complete!"

# create Folders
mkdir ~/Downloads ~/Pictures

# install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git ~/Downloads/yay
cd yay
makepkg -si

# Install packages
echo "Installing essential packages..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S noto-fonts-emoji noto-fonts noto-fonts-cjk ttf-meslo-nerd ttf-firacode-nerd ttf-font-awesome --noconfirm
# Refresh font cache
fc-cache -fv
sudo pacman -S alacritty fcitx5-bamboo fcitx5-configtool zsh git i3 rofi polybar gnome-keyring flameshot copyq rofi-emoji pavucontrol dunst picom  --noconfirm
sudo pacman -S pipewire pipewire-audio pipewire-pulse pipewire-alsa wireplumber lightdm lightdm-gtk-greeter xorg-xrandr --noconfirm

# Enable service
sudo systemctl enable NetworkManager
sudo systemctl enable lightdm

# Optional: Post-setup configurations
chsh -s $(which zsh)
