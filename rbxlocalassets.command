#!/bin/bash
set -e
clear
ROBLOX_CONTENT="/Applications/RobloxStudio.app/Contents/Resources/content"
LOCAL_ASSETS_LINK="$ROBLOX_CONTENT/LocalAssets"
USER_ASSETS_DIR="$HOME/rbxlocalassets"
echo "Roblox Studio Local Assets Linker for macOS."
echo "Made by Riddance Club."
echo
if [[ ! -d "$ROBLOX_CONTENT" ]]; then
    echo "Roblox Studio content directory not found."
    exit 1
fi
mkdir -p "$USER_ASSETS_DIR"
if [[ -e "$LOCAL_ASSETS_LINK" ]]; then
    rm -rf "$LOCAL_ASSETS_LINK"
fi
ln -s "$USER_ASSETS_DIR" "$LOCAL_ASSETS_LINK"
echo "Done! You may need to rerun this script after Roblox Studio updates."
echo "Usage:"
echo "  Put all your local assets in: $USER_ASSETS_DIR"
echo "  Access them in Studio using:"
echo "  rbxassetid://LocalAssets/your_asset_here.png"
