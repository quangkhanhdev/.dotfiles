#!/bin/bash

# Define colors for rofi (optional, adjust to your theme)
# You can get these from your rofi theme or define them here.
# For a simple approach, you can remove these lines and rely on rofi's default theme.
BG="#282a36"    
FG="#f8f8f2"
ACCENT="#bd93f9"

# Define choices for the power menu
# Unicode characters are used for icons, ensure your font supports them (e.g., Nerd Fonts)
#  - Power,  - Restart,  - Lock,  - Logout,  - Suspend,  - Hibernate
shutdown="  Shutdown"
reboot="  Reboot"
lock="  Lock"
logout="  Logout"
suspend="  Suspend"
hibernate="  Hibernate"

# Options to be passed to rofi/dmenu
# You can customize the order or remove options you don't need
options="$shutdown\n$reboot\n$lock\n$logout\n$suspend\n$hibernate"

# Use rofi (preferred)
# You can customize rofi arguments, e.g., -theme-str 'window {width: 15%;}'
chosen=$(echo -e "$options" | rofi -dmenu \
    -i \
    -p "Power Menu" \
    -theme-str "window {width: 350px;}" \
    -theme-str "listview {columns: 1; lines: 6;}" \
    -theme-str "element {children: [element-icon, element-text];}" \
    -theme-str "element-icon {size: 1.5ch;}" \
    -theme-str "element {padding: 5px;}" \
    -theme-str "element-text {horizontal-align: center;}" \
    -theme-str "element-icon {horizontal-align: center;}" \
    -color-window "$BG,$FG,$BG" \
    -color-normal "$BG,$FG,$BG,$ACCENT,$FG")

# Fallback to dmenu if rofi is not available or preferred
# chosen=$(echo -e "$options" | dmenu -i -p "Power Menu")

# Execute action based on chosen option
case "$chosen" in
    "$shutdown")
        if [ "$(echo -e "No\nYes" | rofi -dmenu -i -p "Are you sure you want to shutdown?")" == "Yes" ]; then
            systemctl poweroff
        fi
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$lock")
        # Replace 'i3lock' with your preferred screen locker command
        i3lock -i ~/Pictures/arch_wallpaper.png
        # i3lock # Simple i3lock
        ;;
    "$logout")
        # Replace 'i3-msg exit' with your desktop environment's logout command if not using i3
        i3-msg exit
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$hibernate")
        systemctl hibernate
        ;;
    *)
        # Do nothing if no option is chosen or escape is pressed
        ;;
esac