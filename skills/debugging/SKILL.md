---
name: debugging
description: Systematic debugging techniques - logging, error tracking, tools and methodologies
---

## When to use

Use this skill when:
- Investigating bugs or unexpected behavior
- Finding the root cause of errors
- Debugging in different environments (local, production, tests)

## Debugging Workflow

### 1. Reproduce the Bug

- Document exact steps to reproduce
- Note environment details (OS, versions, browser)
- Identify the smallest reproducible case

### 2. Gather Information

```bash
# Check logs
tail -f logs/app.log
grep "ERROR" logs/app.log

# Check system resources
top
htop
df -h

# Check network
netstat -tulpn
curl -v <endpoint>
```

### 3. Form Hypothesis

Based on evidence, form a testable hypothesis:
- "The bug occurs when X but not when Y"
- "The function returns unexpected value when input is Z"

### 4. Test Hypothesis

- Add targeted logging
- Use debugger to inspect state
- Modify code to test edge cases

### 5. Fix and Verify

- Apply fix
- Run tests
- Verify fix resolves the original issue

## Logging Best Practices

### Do

```javascript
// Good: Structured logging with context
logger.info('User login', {
  userId: user.id,
  provider: provider,
  ip: request.ip,
  timestamp: new Date().toISOString()
});
```

```python
# Good: Use appropriate log levels
logger.debug('Processing request', extra={'request_id': request_id})
logger.info('Request processed', extra={'duration_ms': elapsed})
logger.warning('Rate limit approaching', extra={'remaining': remaining})
logger.error('Payment failed', extra={'error': str(e), 'user_id': user_id})
```

### Don't

```javascript
// Bad: Unstructured, missing context
console.log('user logged in');
console.log('error: ' + error);
```

## Common Debugging Patterns

### Print Debugging

```javascript
// Add temporary debugging
console.log('DEBUG:', { variable, state });
// Or use debugger statement
debugger;
```

### Using Debugger

```javascript
// Node.js
node inspect app.js
// Then use c (continue), n (next), s (step), o (out)

# VS Code: Add breakpoint and debug
```

### Binary Search (Bisect)

```bash
# Find commit that introduced bug
git bisect start
git bisect bad HEAD
git bisect good <known-good-commit>
# Run tests, mark each commit
git bisect reset
```

### Rubber Duck Debugging

Explain the problem out loud (or to a rubber duck):
1. What should happen?
2. What actually happens?
3. What did you change recently?

Often reveals the issue during explanation.

## Environment-Specific Debugging

### Local Development

```bash
# Enable debug mode
DEBUG=* npm start

# Use nodemon with inspect
nodemon --inspect app.js
```

### Production

```bash
# Check error tracker (Sentry, etc.)
sentry-cli issues list --project my-app

# Check logs
grep "ERROR" /var/log/app.log | tail -50

# Check metrics
curl localhost:9090/metrics
```

### Browser DevTools

```javascript
// Console
console.table(arrayOfObjects)
console.trace()

// Network
// Check failed requests, response payloads

// Application tab
// Inspect localStorage, sessionStorage, cookies
```

## Common Error Patterns

### JavaScript/Node.js

| Error | Likely Cause |
|-------|-------------|
| `Cannot read property of undefined` | Accessing property before null check |
| `Promise never resolved` | Missing resolve/reject, or unhandled promise |
| `CORS error` | Missing headers, wrong origin |
| `Maximum call stack exceeded` | Infinite recursion |

### Python

| Error | Likely Cause |
|-------|-------------|
| `NameError` | Variable not defined, typo |
| `TypeError` | Wrong type operation |
| `KeyError` | Missing dict key |
| `IndentationError` | Inconsistent whitespace |

## Error Tracking Integration

```javascript
// Sentry example
const Sentry = require('@sentry/node');

Sentry.init({
  dsn: process.env.SENTRY_DSN,
  environment: process.env.NODE_ENV,
  release: 'my-app@1.0.0'
});

// Capture exceptions
try {
  riskyOperation();
} catch (e) {
  Sentry.captureException(e);
  throw e;
}

// Capture messages for debugging
Sentry.captureMessage('Debug: reached checkpoint', 'debug');
```

## Tools

| Tool | Use Case |
|------|----------|
| `console.log` | Quick debugging |
| `node --inspect` | Step-by-step debugging |
| `curl` | API debugging |
| `Postman` | HTTP request testing |
| `Sentry` | Production error tracking |
| `Chrome DevTools` | Frontend debugging |
| `PDB (Python)` | Python step debugging |

## Edge Cases

1. **Heisenbugs**: Non-reproducible bugs - check for race conditions, timing issues
2. **Environment differences**: Config issues between dev/staging/prod
3. **Data-dependent bugs**: Bug only occurs with specific data - check encoding, size, format
4. **Memory leaks**: Gradual degradation - use heap snapshots
5. **Time-based bugs**: Timezone, daylight saving, epoch vs string dates
