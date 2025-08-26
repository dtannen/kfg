#!/bin/bash

# kfg installer script

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="kfg"

echo "Installing kfg utility..."

# Check if install directory exists
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Error: $INSTALL_DIR does not exist"
    echo "Please create it or install manually"
    exit 1
fi

# Check if we have write permission
if [ ! -w "$INSTALL_DIR" ]; then
    echo "Installing to $INSTALL_DIR (requires sudo)"
    sudo cp "$SCRIPT_DIR/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
    sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
else
    echo "Installing to $INSTALL_DIR"
    cp "$SCRIPT_DIR/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
    chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
fi

echo "✓ kfg installed successfully to $INSTALL_DIR/$SCRIPT_NAME"
echo ""
echo "Usage:"
echo "  kfg           - Start daemon with terminal selection"
echo "  kfg trigger   - Send trigger to running daemon"
echo "  kfg last-line - Get last line from selected terminal"
echo "  kfg add       - Add kfg hook to Claude settings"
echo "  kfg stop      - Stop running daemon"
echo "  kfg status    - Show daemon status"
echo "  kfg help      - Show help"
echo ""
echo "You can now run 'kfg' from anywhere!"