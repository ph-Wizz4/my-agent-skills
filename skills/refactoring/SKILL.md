---
name: refactoring
description: Safe refactoring patterns - code smells, techniques, tech debt management
---

## When to use

Use this skill when:
- Improving existing code without changing behavior
- Addressing technical debt
- Cleaning up code before adding features
- Responding to code review suggestions

## Code Smells

### Signs You Need Refactoring

| Smell | Description |
|-------|-------------|
| **Long function** | Function > 20 lines |
| **Duplicated code** | Same logic in multiple places |
| **Large class** | Class with too many responsibilities |
| **Magic numbers** | Unnamed constants |
| **Shotgun surgery** | One change requires many edits |
| **Feature envy** | Class overly interested in another class |
| **Primitive obsession** | Using primitives instead of objects |

### Detection

```bash
# Use linters and static analysis
eslint --quiet .
pylint .

# Count lines per function
wc -l src/*.js | sort -n

# Find duplicates
jscpd src/
```

## Refactoring Techniques

### 1. Extract Function

Before:
```javascript
function processOrder(order) {
  // validation logic (20 lines)
  // calculation logic (30 lines)
  // notification logic (15 lines)
}
```

After:
```javascript
function processOrder(order) {
  validate(order);
  calculate(order);
  notify(order);
}
```

### 2. Extract Variable

Before:
```javascript
return order.total + order.tax - order.discount + (order.shipping * 1.1);
```

After:
```javascript
const subtotal = order.total + order.tax - order.discount;
const shippingCost = order.shipping * 1.1;
return subtotal + shippingCost;
```

### 3. Rename

Before:
```javascript
function p(u) {
  return u.nm + ' ' + u.sn;
}
```

After:
```javascript
function getFullName(user) {
  return user.firstName + ' ' + user.lastName;
}
```

### 4. Introduce Parameter Object

Before:
```javascript
function createUser(name, email, phone, address, city, zip) { }
```

After:
```javascript
function createUser(userData) { }
```

### 5. Replace Conditional with Polymorphism

Before:
```javascript
function getPaymentAmount(order) {
  if (order.type === 'premium') return order.price * 0.9;
  if (order.type === 'standard') return order.price;
  if (order.type === 'basic') return order.price * 1.1;
}
```

After:
```javascript
class Order {
  getDiscount() { return 1; }
}
class PremiumOrder extends Order {
  getDiscount() { return 0.9; }
}
```

## Safe Refactoring Workflow

### 1. Ensure Tests Exist

```bash
# Run existing tests
npm test
# Ensure coverage
npm run test:coverage
```

### 2. Make Small Changes

One change at a time. Commit after each refactor.

### 3. Run Tests After Each Change

```bash
npm test
# Or watch mode
npm run test:watch
```

### 4. Use IDE Refactoring Tools

- VS Code: F2 to rename
- IntelliJ: Refactor menu
- Eclipse: Refactor menu

## Tech Debt Management

### Identifying Tech Debt

- Code that works but is hard to understand
- Missing tests
- Outdated dependencies
- Duplicated logic
- Hardcoded values

### Prioritizing

| Priority | Criteria |
|----------|----------|
| High | Causes bugs, blocks features, security risk |
| Medium | Slows development, causes friction |
| Low | Cosmetic, doesn't affect functionality |

### Tracking

```markdown
<!-- In code comments -->
// TODO(tech-debt): Refactor to use new API
// FIXME: Remove after Q2 migration
// NOTE: Legacy code, remove in v3.0
```

### Paying Down Tech Debt

1. Add to backlog with estimated effort
2. Allocate 10-20% of sprint capacity
3. Pair with feature work when possible
4. Document refactoring decisions

## Code Organization Patterns

### Module Structure

```
src/
├── features/
│   ├── feature-name/
│   │   ├── components/
│   │   ├── hooks/
│   │   ├── api/
│   │   └── index.js
├── shared/
│   ├── components/
│   ├── utils/
│   └── constants/
└── index.js
```

### Clean Functions

- Do one thing well
- Use clear names
- Minimize parameters (ideally < 3)
- Return early
- Handle errors gracefully

### Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Functions | verb + noun | `getUserById` |
| Booleans | is/has/can | `isActive`, `hasPermission` |
| Arrays | plural noun | `users`, `orderItems` |
| Constants | UPPER_SNAKE | `MAX_RETRY_COUNT` |
| Classes | PascalCase | `UserService` |

## When NOT to Refactor

1. **No tests** - Write tests first
2. **In the middle of a feature** - Finish first
3. **Deadline pressure** - Save for later
4. **Don't understand the code** - Investigate first
5. **Already works fine** - If it ain't broke

## Testing After Refactoring

```javascript
// Ensure behavior unchanged
describe('UserService', () => {
  it('should create user', () => {
    const user = UserService.create(validInput);
    expect(user).toBeDefined();
  });

  it('should throw on invalid input', () => {
    expect(() => UserService.create(invalidInput))
      .toThrow();
  });
});
```

### Test Coverage Checklist

- [ ] Happy path works
- [ ] Edge cases covered
- [ ] Error handling works
- [ ] No regression in existing features

## Common Refactorings by Language

### JavaScript

| From | To |
|------|-----|
| `var` | `const`/`let` |
| Callback | `async/await` |
| `for` loop | `forEach`/`map`/`filter` |
| Magic strings | Constants |

### Python

| From | To |
|------|-----|
| `list.append` in loop | List comprehension |
| Global state | Class/closure |
| Raw SQL | ORM |
| `except:` | Specific exceptions |

## Edge Cases

1. **Refactoring shared code** - Coordinate with team
2. **API changes** - Update all consumers
3. **Database schema** - Plan migration
4. **Performance** - Profile before/after
5. **Breaking changes** - Version appropriately
