#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMANDS_DIR="$SCRIPT_DIR/.claude/commands"
TARGET_DIR="$HOME/.claude/commands"

echo "Installing Claude Code commands..."
mkdir -p "$TARGET_DIR"

cp -rsf "$COMMANDS_DIR"/* "$TARGET_DIR"/

echo "✓ Installation complete! Commands are now available globally in Claude Code"
