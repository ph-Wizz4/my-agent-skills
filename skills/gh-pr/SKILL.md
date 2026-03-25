---
name: gh-pr
description: GitHub Pull Request workflow - creating, reviewing, and managing PRs
---

## When to use

Use this skill when working with pull requests:
- Creating pull requests
- Reviewing pull requests
- Merging pull requests
- Checking PR status

## PR Title

PR title should be consistent with branch name format:

```
<project-prefix>-<ticket-id>-<type>-<short-description>
```

Examples:
```
ABC-123-feat-add-user-auth
ABC-456-fix-login-redirect
XYZ-789-refactor-remove-duplicate-code
```

## PR Description Template

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

## PR Checklist

- [ ] Branch is up-to-date with target
- [ ] Commits follow conventional format
- [ ] PR description is complete
- [ ] Tests pass
- [ ] No merge conflicts
- [ ] PR title matches branch name format

## Common Commands

```bash
# Create PR from current branch
gh pr create --title "ABC-123-feat-add-user-auth" --body "$(cat <<'EOF'
## Summary
Brief description

## Changes
- Change 1
- Change 2
EOF
)"

# List open PRs
gh pr list

# View PR status
gh pr status

# Check PR diff
gh pr diff <pr-number>

# View PR checks
gh pr checks <pr-number>

# Merge PR
gh pr merge <pr-number> --squash

# Checkout PR locally
gh pr checkout <pr-number>
```

## Edge Cases

1. **Merge conflicts**: Resolve conflicts locally, rebase onto target branch, force push to feature branch
2. **Outdated PR**: Rebase or merge target branch into feature branch
3. **Draft PR**: Use `--draft` flag for work-in-progress PRs
