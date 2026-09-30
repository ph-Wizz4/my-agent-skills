---
name: plan-test
description: Plan feature tests by confirming happy-case or edge-case coverage, unit versus API E2E testing, and test data preparation. Use when the user requests a test plan or needs to agree on a testing approach before implementation.
---

# Plan Test

Produce a project-grounded test plan that `create-test` can implement. Keep the detail proportional to the feature. This skill does not write or run tests.

## 1. Understand the Feature and Project

1. Read relevant project instructions, feature requirements, and implementation before asking questions the project can answer.
2. Inspect existing tests, runner configuration, scripts, fixtures, factories, seed utilities, and mocking conventions. Follow applicable project-specific testing guidance.
3. Identify the feature boundaries, observable behavior, existing coverage, and any acceptance criteria. Distinguish intended behavior from behavior merely observed in the implementation.
4. Record project-supported test locations, commands, and environment prerequisites. Mark unknowns instead of inventing paths, commands, or expected results.

## 2. Confirm Coverage and Test Levels

Use the question tool when available. Reuse explicit decisions from the user or an existing agreed plan; do not ask the user to confirm the same choice again.

Before treating the plan as ready, establish:

- **Feature scope:** Which behavior, endpoints, or feature changes are included?
- **Case scope:** Happy cases only, or happy cases plus relevant edge and failure cases? If edge cases are included, name the applicable boundaries, invalid inputs, authorization failures, missing records, or dependency failures rather than promising every possible case.
- **Test levels:** Are unit tests required, are API-based end-to-end tests sufficient, or are both needed? Recommend an approach based on project requirements and the feature, explain the coverage gaps, and confirm the choice when it has not already been specified.

### Choosing Test Levels

- Unit tests can isolate branching business rules, calculations, and failure paths that are difficult to exercise through the API.
- API-based E2E tests can verify externally observable behavior across the running application's components. State the entry point and which application, database, and external dependency boundaries are real or mocked.
- An API test with mocked application internals does not establish full end-to-end coverage. Describe its actual scope using the project's terminology and explain the limits.
- API-only coverage can be sufficient when it exercises the agreed behavior and meets project requirements. Do not add unit tests automatically or duplicate the same assertions across layers without a reason.
- If a requested scope conflicts with applicable project testing requirements, explain the conflict and resolve it before marking the plan ready. Do not silently broaden coverage or waive requirements.

Continue independent discovery while decisions are open. Mark affected scenarios provisional and ask focused questions for missing decisions that materially affect scope or expected behavior.

## 3. Define Test Data and Mock Preparation

For each scenario, identify required input data, persisted records, authentication context, and dependency responses. Distinguish test data from mocked behavior.

1. Reuse suitable project fixtures, factories, seed scripts, and mock utilities before proposing new ones.
2. Specify what must be prepared, the intended utility or location, required relationships, and whether setup happens per test or per suite.
3. Keep data reproducible: use deterministic values or seeded generators, control time when relevant, and isolate identifiers or records for parallel execution.
4. Define each mocked dependency's boundary, responses or errors, and reset behavior. Preserve the real components needed to substantiate the claimed test level.
5. Specify setup and teardown, transaction rollback, or cleanup as appropriate. Avoid dependence on test order or mutable shared state.
6. Identify required local services, test databases, and configuration. Use synthetic data and the project's test environment conventions.

If no special data or mocks are needed, state that explicitly. Ask about unresolved data sources or mock boundaries only when they materially change the plan; use known project conventions for routine choices.

## 4. Deliver the Plan

- Assign stable scenario identifiers (`S-1`, `S-2`, and so on) and reference existing acceptance criteria when available.
- Describe inputs, actions, and observable expected results. Use Given/When/Then where it clarifies the scenario.
- Map scenarios to test levels, proposed files, and data requirements. Identify existing tests that already cover a scenario and whether they need extension.
- Include the intended verification commands and their prerequisites without executing them. Preserve user-provided commands exactly.
- Separate confirmed decisions, proposed assumptions, and unresolved questions. Mark the plan ready only when consequential decisions are resolved.
- Return the plan in the conversation unless the user requests a file or project conventions require one. Do not create test or fixture files, run tests, or automatically invoke `create-test`.

## Output Template

Omit empty optional sections. Use this structure as the handoff to `create-test`:

```markdown
## Feature and Project Context
<Feature, intended behavior, relevant implementation and existing coverage.>

## Confirmed Test Scope
- Case coverage: <Happy cases only / happy plus named edge and failure cases.>
- Test levels: <Unit / API E2E / both, with rationale.>
- API boundaries: <Real and mocked components, if applicable.>
- Coverage gaps or exclusions: <Known limits and applicable project requirements.>

## Scenarios
| ID | Behavior / criterion | Setup and action | Expected result | Test level | Existing or proposed test location |
|----|----------------------|------------------|-----------------|------------|------------------------------------|
| S-1 | <Behavior; AC reference if available> | <Inputs and action> | <Observable result> | <Level> | <Location; reuse, extend, or create> |

## Data and Mocks
| Scenarios | Data or dependency | Preparation and location | Mock behavior / real boundary | Isolation and cleanup |
|-----------|--------------------|--------------------------|-------------------------------|-----------------------|
| S-1 | <Required records or dependency> | <Fixture, factory, seed, or inline data> | <Responses or real components> | <Setup scope and reset> |

## Verification
- Prerequisites: <Services, configuration, and setup.>
- Commands: <Exact supported commands and what they verify; flag unknowns.>

## Assumptions and Open Questions
- <Unresolved choice and affected scenario IDs, if any.>

## Handoff
- Status: <Ready for implementation / provisional, with blockers.>
- Implementation order: <Data preparation, scenarios, then verification; note dependencies.>
```
