# Contributing

Thanks for contributing to `my-agent-skills`.

## Workflow

1. Create a feature branch using this format:
   - `<project-prefix>-<ticket-id>-<type>-<short-description>`
2. Make focused changes.
3. Run `./validate-skills.sh`.
4. Open a pull request with a complete description and testing notes.

## Skill Format Requirements

Each skill must live in `skills/<skill-name>/SKILL.md` and include frontmatter:

```yaml
---
name: <skill-name>
description: <short description>
---
```

Requirements:
- `name` must match the directory name under `skills/`
- `description` should be concise and actionable
- Content should be specific, safe, and avoid ambiguous instructions

## Authoring Guidelines

- Prefer concrete commands and checklists over broad advice.
- Call out high-risk operations (force-push, rewrite history, destructive commands).
- Include edge cases when behavior depends on branch policy or repository protections.
- Keep wording direct and consistent across skills.

## Pull Request Expectations

- Title format: `<project-prefix>-<ticket-id>-<type>-<short-description>`
- Keep scope small and reviewable.
- Explain why the change is needed.
- Note manual verification steps.

## Validation

Run:

```bash
./validate-skills.sh
```

The validator checks:
- Required skill directories referenced by README
- `SKILL.md` presence for each skill directory
- Required frontmatter keys in each skill file
