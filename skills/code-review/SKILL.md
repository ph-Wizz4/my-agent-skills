---
name: code-review
description: Guidelines for conducting effective code reviews - checklists, feedback best practices
---

## When to use

Use this skill when:
- Reviewing pull requests
- Responding to code review feedback
- Writing PR descriptions

## Review Checklist

### Code Quality
- [ ] Code follows project style conventions
- [ ] Logic is correct and handles edge cases
- [ ] No memory leaks or resource leaks
- [ ] Error handling is appropriate
- [ ] No hardcoded secrets or credentials

### Security
- [ ] Input validation is present
- [ ] Authentication/authorization checks exist
- [ ] Sensitive data is not logged
- [ ] Dependencies are secure (no known CVEs)
- [ ] SQL queries use parameterized statements

### Performance
- [ ] No unnecessary database queries (N+1)
- [ ] Proper indexing for database queries
- [ ] Large data sets are paginated
- [ ] Expensive operations are cached when appropriate

### Testing
- [ ] Unit tests cover new functionality
- [ ] Edge cases are tested
- [ ] Tests are maintainable
- [ ] Test names are descriptive

### Documentation
- [ ] Public APIs are documented
- [ ] Complex logic has comments
- [ ] README updated if needed

## Giving Feedback

### Do

1. **Be specific**: "Consider using `Array.prototype.map` here" is better than "this could be better"
2. **Explain why**: "Using map avoids mutation and is more functional" helps learning
3. **Suggest solutions**: Offer code examples when possible
4. **Praise good code**: Acknowledge well-written code
5. **Focus on the code**: Critique the code, not the person
6. **Warning Performance**: Alert protential performance issue, suggest fixing options in the future

### Don't

1. **Don't be vague**: "This doesn't look right" - say why
2. **Don't use judgmental language**: Avoid "you should have"
3. **Don't nitpick**: Focus on issues that matter
4. **Don't rewrite without asking**: Suggest, don't replace

### Example Feedback

```
Good suggestion:

> Consider extracting this validation into a separate function. 
> It would improve readability and make it easier to test edge cases.

function validateEmail(email) {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regex.test(email);
}
```

```
Avoid:

> Your validation is wrong. Use a different approach.
```

## Responding to Review

1. **Address all comments**: Either fix or explain
2. **Use "Done" markers**: Indicate resolved comments
3. **Ask for clarification**: If feedback is unclear
4. **Don't take it personally**: Feedback is about code
5. **Request re-review**: After addressing feedback

## PR Description Template

```markdown
## Summary
What does this PR do?

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Refactor

## Changes
<!-- Detailed list of changes -->

## Testing
<!-- How was this tested? -->

## Screenshots (if UI)
```

## Special Cases

### Large PRs
- Request review in parts
- Break into smaller PRs if possible
- Summarize key changes in comments

### Breaking Changes
- Clearly mark as breaking
- Document migration path
- Update changelog

### Complex Changes
- Add diagrams or examples
- Provide context in description
- Link to related issues/specs
