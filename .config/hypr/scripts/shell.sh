#!/bin/sh

SHELL_CONFIG="$HOME/.config/hypr/shell"

case "$1" in
    menu)
        case "$SHELL_CONFIG" in
            noctalia)
                noctalia msg panel-toggle launcher
                ;;
            caelestia)
                caelestia shell drawers toggle launcher
                ;;
            none)
                "$HOME/.config/rofi/launcher/launcher.sh"
                ;;
        esac
        ;;

    power)
        case "$SHELL_CONFIG" in
            noctalia)
                noctalia msg panel-toggle session
                ;;
            caelestia)
                caelestia shell drawers toggle session
                ;;
            none)
                "$HOME/.config/rofi/powermenu/powermenu.sh"
                ;;
        esac
        ;;

    clipboard)
        case "$SHELL_CONFIG" in
            noctalia)
                noctalia msg panel-toggle clipboard
                ;;
            caelestia)
                # Add Caelestia clipboard command here when needed
                "$HOME/dotfiles/.config/hypr/scripts/clipboard.sh"
                ;;
            none)
                "$HOME/dotfiles/.config/hypr/scripts/clipboard.sh"
                ;;
        esac
        ;;

    wallpaper)
        case "$SHELL_CONFIG" in
            noctalia)
                noctalia msg panel-toggle wallpaper
                ;;
            caelestia)
                # Add Caelestia wallpaper command here when needed
                ;;
            none)
                # Add your normal wallpaper launcher here
                ;;
        esac
        ;;

    *)
        echo "Usage: $0 {menu|power|clipboard|wallpaper}"
        exit 1
        ;;
esac