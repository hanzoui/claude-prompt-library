#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMANDS_DIR="$SCRIPT_DIR/.claude/commands"
TARGET_DIR="$HOME/.claude/commands"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Installing Claude Code commands...${NC}"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Check if commands directory exists in repo
if [[ ! -d "$COMMANDS_DIR" ]]; then
    echo -e "${RED}Error: Commands directory not found at $COMMANDS_DIR${NC}"
    exit 1
fi

# Function to create symlinks
create_symlinks() {
    local source_dir="$1"
    local target_dir="$2"
    local relative_path="${3:-}"

    for item in "$source_dir"/*; do
        if [[ ! -e "$item" ]]; then
            continue
        fi

        local basename="$(basename "$item")"
        local target_path="$target_dir/$basename"
        local source_path="$item"

        if [[ -d "$item" ]]; then
            # Create directory if it doesn't exist
            mkdir -p "$target_path"
            # Recursively create symlinks for directory contents
            create_symlinks "$source_path" "$target_path" "$relative_path/$basename"
        elif [[ -f "$item" ]]; then
            # Create symlink for file
            if [[ -L "$target_path" ]]; then
                # Remove existing symlink
                rm "$target_path"
                echo -e "${YELLOW}Updating: $relative_path/$basename${NC}"
            elif [[ -e "$target_path" ]]; then
                # Backup existing file if not a symlink
                mv "$target_path" "$target_path.backup"
                echo -e "${YELLOW}Backed up existing file: $relative_path/$basename -> $relative_path/$basename.backup${NC}"
            else
                echo -e "${GREEN}Installing: $relative_path/$basename${NC}"
            fi
            ln -s "$source_path" "$target_path"
        fi
    done
}

# Start installation
echo -e "${GREEN}Creating symlinks from $COMMANDS_DIR to $TARGET_DIR${NC}"
create_symlinks "$COMMANDS_DIR" "$TARGET_DIR" ""

echo -e "\n${GREEN}✓ Installation complete!${NC}"
echo -e "${GREEN}Commands are now available globally in Claude Code${NC}"
echo -e "${YELLOW}Note: Changes to commands in this repository will be reflected immediately${NC}"
