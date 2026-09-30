---
name: create-test
description: Create and run tests from an agreed test plan using project testing and fixture conventions. Use when the user requests test implementation, including unit tests or API-based E2E tests; resolve missing scope decisions with plan-test first.
---

# Create Test

Implement the agreed test scenarios and verify them with the project's tooling. Use `plan-test` to resolve missing planning decisions, then continue the requested implementation.

## 1. Establish the Agreed Plan

1. Read the test plan from the conversation or the document provided by the user. A sufficiently explicit user request can supply the plan; do not require a separate file or a particular template.
2. Read relevant project instructions, current feature behavior, existing tests, runner configuration, and data preparation utilities. Check that the plan still matches the project.
3. Confirm that the plan identifies:
   - Feature scope and observable expected results.
   - Happy-case-only coverage or the agreed edge and failure cases.
   - Whether unit tests, API-based E2E tests, or both are required, including real and mocked boundaries.
   - Required test data and mocks, their preparation, isolation, and cleanup, or an explicit statement that none are needed.
   - Test locations, verification commands, and prerequisites, where discoverable.
4. Reuse decisions already provided. For a complete plan, proceed without routine reapproval. For a partial or missing plan, load `plan-test` and use its workflow to resolve the missing decisions. If it cannot be loaded, follow the checklist above and ask focused questions with the question tool when available.
5. Planning remains read-only while using `plan-test`. Once consequential decisions are resolved, return to this workflow and continue the already-requested implementation. If decisions remain open, record blockers and continue only independent, agreed work.
6. If the plan conflicts with project requirements, intended behavior is unclear, or implementation requires a materially different approach, resolve that issue before changing the affected tests. Do not silently expand scope.

## 2. Track Implementation

- Preserve scenario identifiers from the plan; assign `S-1`, `S-2`, and so on if none exist.
- Use the todo tool when available for non-trivial work. Update an existing initiative tracker rather than creating a competing list.
- Order work by dependencies: data and mocks, test scenarios, then verification. Reference scenario IDs in tasks.
- Keep blocked or partially verified work incomplete and record the blocker and next action.

## 3. Implement Tests and Test Data

1. Reuse or extend suitable existing tests and helpers. Follow the project's frameworks, naming, directory layout, and setup/teardown conventions.
2. Implement only the agreed case scope and test levels. For API-only coverage, retain the real boundaries promised by the plan; do not substitute mocked internals and still claim equivalent E2E coverage.
3. Prepare data using the agreed fixtures, factories, seeds, or inline values. Keep results reproducible, isolate mutable records for parallel runs, and reset mocks and controlled clocks. Provide cleanup appropriate to the test environment, including on failure.
4. Mock only the agreed dependency boundaries and match their actual contracts. Avoid mocking the behavior the scenario is intended to verify.
5. Assert observable outcomes: returned values, API status and response content, relevant persisted state, or required side effects. Avoid tests that merely repeat implementation details or pass without exercising the scenario.
6. Cover the agreed edge and failure cases explicitly. Do not add them automatically to a happy-case-only plan; surface newly discovered necessary coverage for a scope decision.
7. Keep changes focused on tests and necessary test-support files. If a production defect or testability change is required, report it and obtain scope clarification unless production changes are already authorized. Do not weaken assertions to match an apparent defect.
8. Update test setup documentation when new prerequisites or utilities require it. Preserve unrelated user changes.

## 4. Verify the Implementation

1. Run the relevant project-supported tests and required checks. Preserve user-provided commands exactly. If a command cannot run in the current environment, explain the prerequisite or mismatch rather than silently substituting another command.
2. Start with the affected tests, then run broader checks when required by the project or justified by shared test-support changes. Avoid repeated runs without a reason.
3. Inspect failures. Fix test or fixture defects within scope and rerun affected checks. Distinguish these from production defects, pre-existing failures, and missing environment prerequisites.
4. Check that every agreed scenario maps to an implemented or reused test with meaningful assertions and a recorded verification result.
5. Do not claim tests passed unless execution confirms it. If a service, dependency, or configuration is unavailable, state which commands and scenarios remain unverified and what is needed to verify them.

## 5. Report Results

Keep the summary proportional to the work. Include:

- Test and test-support files created or updated.
- Scenario IDs mapped to tests, with implemented, reused, blocked, or unimplemented status as appropriate.
- Actual verification commands and results: passed, failed, or not run, with reasons.
- Remaining scope gaps, blockers, and production defects requiring follow-up.

Implementation and verification are separate: a written test that has not run is implemented but unverified. Report completion only when the agreed scenarios and required verification are complete; otherwise describe the remaining work explicitly.
