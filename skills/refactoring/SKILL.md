---
name: refactoring
description: Refactoring skill that checks for project-specific refactoring conventions
---

## Project-Specific Refactoring Skill

This skill checks for project-specific refactoring conventions.

### Check Locations

1. `.opencode/skills/refactoring/` (OpenCode project-level)
2. `.claude/skills/refactoring/` (Claude project-level)

### If Found

Load and use the project-specific refactoring skill.

### If Not Found

⚠️ **No project-specific refactoring skill found.**

Create one at `.opencode/skills/refactoring/SKILL.md` with:
- Project-specific code organization patterns
- Naming conventions
- Tech debt priorities
- Code review standards for this project
