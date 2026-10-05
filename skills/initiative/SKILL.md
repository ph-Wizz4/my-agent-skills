---
name: initiative
description: Refine project initiatives into clear intent, verifiable acceptance criteria, and a tracked todo list. Use when scoping a feature or project, clarifying requirements, or turning a user goal into actionable tasks.
---

# Initiative

Turn the user's intention into a project-grounded outcome, acceptance criteria, and an actionable todo list. Keep the detail proportional to the work.

## 1. Understand the Intention

1. Read relevant project instructions, documentation, and existing implementation before asking questions that the project can answer.
2. Identify:
   - The problem to solve and who benefits.
   - The intended outcome and why it matters.
   - The relevant project behavior, components, or conventions.
   - The requested scope and constraints.
3. Separate confirmed requirements, proposed assumptions, and open questions. Do not present inferred preferences as user requirements.
4. Ask focused questions only when the answer materially changes scope, behavior, or verification. Use the question tool when available.
5. Continue independent work while awaiting answers. For low-impact ambiguity, state a reasonable assumption and proceed; leave consequential unresolved decisions open.
6. Summarize the refined goal in a few sentences using the user's terminology. Avoid adding unrelated improvements or requiring routine approval before continuing an already-requested implementation.

## 2. Define Acceptance Criteria

- Assign stable identifiers: `AC-1`, `AC-2`, and so on.
- Describe observable outcomes rather than implementation activities. "The user can reset a forgotten password" is an outcome; "add a reset handler" is a task.
- Make each criterion specific enough to verify. Use Given/When/Then when it clarifies behavior.
- Cover the main behavior and relevant failure or boundary cases. Include compatibility, performance, or accessibility requirements when supported by the request or project context.
- Give each criterion a verification method, such as an existing test, a focused new test, a manual scenario, or a document review. Do not invent numerical targets or require new tests for every change.
- Flag criteria that depend on unanswered questions as provisional.
- Ensure every criterion supports the stated goal and every confirmed requirement is covered.

## 3. Create the Todo List

Always produce a task list for the initiative, even when it is short.

1. Break the work into concrete, independently trackable steps, ordered by dependencies.
2. Give tasks stable identifiers such as `T-1`. Reference the acceptance criteria they satisfy or verify; identify discovery tasks explicitly when criteria are still provisional.
3. Include appropriate verification work and required documentation updates. Preserve user-provided commands exactly.
4. Use the agent's todo tool when available, including task identifiers and criterion references in task descriptions. Update the existing initiative list rather than creating a competing tracker.
5. If no todo tool is available, maintain a Markdown status table in the conversation. Create a persistent tracking file only when requested or required by project conventions.

### Status Rules

- `pending`: Work has not started.
- `in_progress`: Work is underway. Keep exactly one task in this state while actively working; planning-only tasks intended for later execution may all remain pending.
- `completed`: The task is finished and its required verification has succeeded.
- `cancelled`: The task is no longer required; record why.

Update statuses as work progresses, not only at the end. Record blockers and the action needed to resolve them in the task description or notes; do not mark blocked or partially finished work complete. If another task can proceed, leave the blocked task pending with its blocker recorded and mark the actionable task in progress.

## 4. Keep the Initiative Current

- When the user refines the goal, update scope, acceptance criteria, and affected tasks together. Preserve identifiers for unchanged items.
- Add newly discovered necessary work and explain meaningful changes. Keep optional improvements separate from the requested scope.
- If the user requested planning only, deliver the refined initiative and pending task list. If implementation was requested, continue into execution once the requirements are sufficiently clear.
- Before reporting completion, check each acceptance criterion against actual evidence. Report unmet criteria, unresolved questions, or verification that could not be performed explicitly.

## Output Template

Use this structure, omitting empty sections. Keep the todo tool as the live tracker when available; the table below is the fallback.

```markdown
## Goal and Project Context
<Who needs what outcome, why, and how it fits the existing project.>

## Scope and Constraints
- <Requested behavior, affected areas, and relevant constraints.>

## Assumptions and Open Questions
- Assumption: <Proposed default and its basis.>
- Question: <Unresolved decision and the work it affects.>

## Acceptance Criteria
| ID | Observable outcome | Verification |
|----|--------------------|--------------|
| AC-1 | <Specific behavior or result> | <Test, scenario, or review> |

## Tasks
| ID | Task | Criteria | Status | Dependencies / Blockers |
|----|------|----------|--------|-------------------------|
| T-1 | <Concrete implementation step> | AC-1 | pending | None |
| T-2 | <Verify the expected outcome> | AC-1 | pending | T-1 |
```
During  implementation, avoid using comments .
