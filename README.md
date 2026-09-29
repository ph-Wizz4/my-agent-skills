# my-agent-skills

A general user-level agent skills repository for Software Development, following the [OpenCode Agent Skills](https://opencode.ai/docs/skills/) specification.

## Structure

```
my-agent-skills/
├── setup.sh        # Setup script to link skills globally
├── README.md
├── LICENSE
├── skills/
│   ├── git-commit/     # Git workflow and commit conventions
│   ├── gh-pr/          # Pull request workflow using GitHub CLI
│   ├── code-review/    # Code review guidelines
│   ├── debugging/      # Delegates to project-specific debug skill
│   └── refactoring/    # Delegates to project-specific refactoring skill
```

## Setup

Run the setup script to link skills globally to OpenCode:

```bash
./setup.sh
```

This creates a symlink at `~/.config/opencode/skills/my-agent-skills` pointing to the `skills/` directory.

## Available Skills

| Skill | Description |
|-------|-------------|
| `git-commit` | Git commit workflow - branch management and commit conventions |
| `gh-pr` | GitHub Pull Request workflow - creating, reviewing, and managing PRs |
| `code-review` | Guidelines for conducting effective code reviews - checklists, feedback best practices |
| `debugging` | Debugging skill that checks for project-specific debugging configurations |
| `refactoring` | Refactoring skill that checks for project-specific refactoring conventions |

## Adding New Skills

Create a new directory under `skills/` with a `SKILL.md` file:

```bash
mkdir skills/my-new-skill
```

Add frontmatter to `SKILL.md`:

```yaml
---
name: my-new-skill
description: A brief description of what this skill does
---
```

Follow the [OpenCode skill format](https://opencode.ai/docs/skills/) for the rest of the file.

## License

Apache-2.0
