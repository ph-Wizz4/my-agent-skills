---
name: debugging
description: Debugging skill that checks for project-specific debugging configurations
---

## Project-Specific Debug Skill

This skill checks for project-specific debugging configurations.

### Check Locations

1. `.opencode/skills/debugging/` (OpenCode project-level)
2. `.claude/skills/debugging/` (Claude project-level)

### If Found

Load and use the project-specific debugging skill.

### If Not Found

⚠️ **No project-specific debug skill found.**

Create one at `.opencode/skills/debugging/SKILL.md` with:
- Project-specific error patterns
- Custom logging conventions
- Error tracking configuration
- Debug tools specific to this project
