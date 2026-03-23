#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$HOME/.config/opencode/skills"

mkdir -p "$SKILLS_DIR"
ln -sfn "$SCRIPT_DIR/skills" "$SKILLS_DIR/my-agent-skills"

echo "Linked: $SKILLS_DIR/my-agent-skills → $SCRIPT_DIR/skills"
