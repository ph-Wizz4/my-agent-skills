---
name: git-conventions
description: Enforce consistent git workflow - commits, branches, PRs following conventional commits
---

## When to use

Use this skill when working with version control tasks:
- Writing commit messages
- Creating or managing branches
- Preparing pull requests
- Merging or rebasing

## Branch Naming

Format: `<type>/<ticket-id>-<short-description>`

Types:
- `feat` - New features
- `fix` - Bug fixes
- `chore` - Maintenance, refactoring
- `docs` - Documentation
- `test` - Tests

Examples:
```
feat/123-add-user-auth
fix/456-login-redirect
docs/789-update-readme
```

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, no code change |
| `refactor` | Code change that neither fixes nor adds |
| `test` | Adding or updating tests |
| `chore` | Maintenance, deps, build changes |

### Rules

- Use imperative mood: "add" not "added" or "adds"
- Subject line: max 50 characters
- Body: wrap at 72 characters
- Footer: reference issues `Closes #123`

### Examples

```
feat(auth): add OAuth2 login support

Implements Google and GitHub OAuth2 flow.
Redirects to originally requested page after login.

Closes #45
```

```
fix(api): resolve null pointer in user endpoint

The user endpoint was throwing NPE when user_id was missing.
Added validation to return 400 Bad Request instead.

Fixes #123
```

```
chore: update dependencies
```

## Pull Request Guidelines

### Title

Use same format as commit messages:
```
feat(auth): add OAuth2 login support
```

### Description Template

```markdown
## Summary
Brief description of changes

## Changes
- Added OAuth2 service
- Updated login redirect logic

## Testing
- [ ] Unit tests added
- [ ] Manual testing completed

## Screenshots (if UI)
```

### Checklist

- [ ] Branch is up-to-date with target
- [ ] Commits follow conventional format
- [ ] PR description is complete
- [ ] Tests pass
- [ ] No merge conflicts

## Common Commands

```bash
# Create and switch to new branch
git checkout -b feat/123-add-feature

# Interactive rebase to clean up commits
git rebase -i main

# Squash last N commits
git rebase -i HEAD~N

# Amend last commit
git commit --amend

# Force push (use with caution)
git push --force-with-lease
```

## Edge Cases

1. **Squash vs rebase**: Prefer rebase for maintaining clean history on feature branches
2. **Merge commits**: Avoid unless required for merge conflicts
3. **Force push**: Never force push to shared branches
4. **Commit after push**: Use `--amend` only for unpushed commits
