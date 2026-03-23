# my-agent-skills

A general user-level agent skills repository for Software Development, following the [OpenCode Agent Skills](https://opencode.ai/docs/skills/) specification.

## Structure

```
my-agent-skills/
├── setup-symlink.sh       # Setup script to link skills globally
├── README.md
├── skills/
│   ├── git-conventions/   # Git workflow & commit conventions
│   └── code-review/       # Code review guidelines
│   └── ...
└── docs/                  # Supporting documentation
```

## Setup

Run the setup script to link skills globally to OpenCode:

```bash
./setup-symlink.sh
```

This creates a symlink at `~/.config/opencode/skills/my-agent-skills` pointing to the `skills/` directory.

## Available Skills

| Skill | Description |
|-------|-------------|
| `git-conventions` | Enforce consistent git workflow - commits, branches, PRs following conventional commits |
| `code-review` | Guidelines for conducting effective code reviews - checklists, feedback best practices |

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

MIT
