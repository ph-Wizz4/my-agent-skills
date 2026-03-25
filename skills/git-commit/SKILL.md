---
name: git-commit
description: Git commit workflow - branch management and commit conventions
---

## When to use

Use this skill when working with:
- Creating or managing branches
- Writing commit messages
- Committing changes
- Rebasing or amending commits

## Branch Management

### Always Work on Feature Branch

1. `main` and `staging` are always considered non-feature branches
2. If you are NOT on a feature branch (i.e., on main/staging), ask the user:
   - **"Which branch are you merging from and to?"**
3. After confirming merge direction, create a new feature branch off the target branch

### Branch Naming

Format: `<project-prefix>-<ticket-id>-<type>-<short-description>`

Types:
- `feat` - New features
- `refactor` - Refactor code, but no feature changes
- `fix` - Bug fixes
- `chore` - Maintenance, remove redundancy
- `docs` - Documentation
- `test` - Tests

Examples:
```
ABC-123-feat-add-user-auth
ABC-456-fix-login-redirect
ABC-789-docs-update-readme
ABC-101-refactor-remove-duplicate-code
ABC-202-chore-update-dependencies
ABC-303-test-add-unit-tests
XYZ-001-feat-implement-search
XYZ-002-fix-resolve-memory-leak
```

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

Make small logical commits

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

## Common Commands

```bash
# Create and switch to new branch
git checkout -b ABC-123-feat-add-feature

# Check current branch
git branch --show-current

# Stage changes
git add <file>
git add .

# Commit with message
git commit -m "feat(auth): add OAuth2 login"

# Amend last commit (only if not pushed)
git commit --amend

# Interactive rebase to clean up commits
git rebase -i main

# Squash last N commits
git rebase -i HEAD~N

# Force push (use with caution)
git push --force-with-lease

# Fetch and rebase onto latest
git fetch origin
git rebase origin/main
```

## Edge Cases

1. **Squash vs rebase**: Prefer rebase for maintaining clean history on feature branches
2. **Merge commits**: Avoid unless required for merge conflicts
3. **Force push**: Never force push to shared branches
4. **Commit after push**: Use `--amend` only for unpushed commits
5. **Detached HEAD**: Always checkout a branch before committing
