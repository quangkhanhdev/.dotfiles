# my dotfiles for Arch Linux (i3wm)

Welcome to my personal dotfiles repository! These configurations are primarily for my Arch Linux setup, featuring the i3 window manager. I aim to keep my environment clean, efficient, and highly personalized.

This repository is managed using `GNU Stow` to create symbolic links, ensuring a tidy home directory while keeping all configurations under version control.

## Table of Contents

* [Features](#features)
* [Screenshots](#screenshots)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
    * [Using the Setup Script](#using-the-setup-script)
* [Included Configurations](#included-configurations)
* [Customization](#customization)
* [Contributing](#contributing)

## Features

* **Window Manager:** `i3-gaps` for a highly customizable tiling experience.
* **Terminal:** `Alacritty` for a fast, GPU-accelerated terminal.
* **Shell:** `Zsh` with `Oh My Zsh` (or a custom prompt/plugins) for an enhanced command-line experience.
* **Status Bar:** `Polybar` for a feature-rich and aesthetic status bar.
* **Application Launcher:** `Rofi` for quick application launching and various utilities.
* **Compositor:** `Picom` for eye candy like shadows and transparency.
* **Credential Management:** Integration with `gnome-keyring` for secure storage of secrets (like GitHub tokens in VS Code).

## Screenshots

*(Here, you would typically add screenshots of your desktop environment. You can remove this section if you don't plan to add screenshots.)*

* **i3wm Desktop:** [in future update]
* **Alacritty:** [in future update]
* **Rofi Menu:** [in future update]

## Prerequisites

Before installing, ensure you have the following installed on your Arch Linux system:

* `git`
* `i3wm`

## Installation

### Using the Setup Script (Recommended)

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/quangkhanhdev/.dotfiles.git](https://github.com/quangkhanhdev/.dotfiles.git) ~/.dotfiles
    ```

2.  **Navigate into the dotfiles directory:**
    ```bash
    cd ~/.dotfiles
    ```

3.  **Run the installation script:**
    ```bash
    ./install.sh
    ```
    *This script will handle installing `stow` (if not present), creating symlinks for all configurations, and potentially install other core packages. Review the script contents before running it.*

4.  **Update**
    * Reload your i3 configuration (`$mod+Shift+r`) or, preferably, log out and log back in to ensure the keyring starts correctly.

## Included Configurations

This repository contains configurations for the following applications and tools:

* `.bashrc`: Bash shell configuration
* `.gitconfig`: Global Git configuration
* `.config/alacritty/`: Alacritty terminal emulator settings
* `.config/i3/`: i3wm configuration files
* `.config/polybar/`: Polybar status bar setup
* `.config/rofi/`: Rofi launcher configuration
* `.config/dunst/`: Dunst notification daemon config
* `.config/picom/`: Picom compositor config
* `scripts/`: Automation scripts (Bash and potentially TypeScript)

## Customization

Feel free to fork this repository and customize it to your liking! Remember that my configurations are tailored to my specific workflow and preferences.

* **Themes and Colors:** Most theming is handled within each application's configuration file.
* **Keybindings:** Check `i3/config` for my i3 keybindings.
* **Shell Customization:** Dive into the `zsh` directory for shell prompt and plugin settings.

## Contributing

If you have suggestions or find issues, feel free to open an issue or pull request.