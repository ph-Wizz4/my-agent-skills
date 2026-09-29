#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"
README_FILE="$ROOT_DIR/README.md"

fail() {
  echo "ERROR: $1" >&2
  exit 1
}

[[ -d "$SKILLS_DIR" ]] || fail "Missing skills directory: $SKILLS_DIR"
[[ -f "$README_FILE" ]] || fail "Missing README.md"

for skill_path in "$SKILLS_DIR"/*; do
  [[ -d "$skill_path" ]] || continue
  skill="$(basename "$skill_path")"
  skill_file="$skill_path/SKILL.md"

  [[ -f "$skill_file" ]] || fail "Missing SKILL.md for skill: $skill"
  grep -q "^---" "$skill_file" || fail "Missing frontmatter start for $skill"
  grep -q "^name: $skill$" "$skill_file" || fail "Frontmatter name mismatch for $skill"
  grep -q "^description:" "$skill_file" || fail "Missing description frontmatter for $skill"
done

grep -q "## Available Skills" "$README_FILE" || fail "README missing Available Skills section"

echo "Validation passed."
