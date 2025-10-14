#!/usr/bin/env bash
# Fix scaling for Electron/XWayland apps on 4K+ screens in Hyprland

export ELECTRON_ENABLE_WINDOWED_FULLSCREEN=1
export SCALE_FACTOR=2

# Discord
discord &

# Spotify
spotify &

# Brave
brave --force-device-scale-factor=2 &
