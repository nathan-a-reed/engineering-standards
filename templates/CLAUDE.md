# CLAUDE.md: <Product name> / <repo-name>

> **Template:** copy to the repository root as `CLAUDE.md`. Replace every `<…>`, delete sections and imports that do not apply, and delete these notes. Keep it under about 150 lines. Shared rules come from the imported standards; add only repository specifics and explicit overrides.

## Project

<One or two sentences: what this repository is, and who uses it.>

| | |
|---|---|
| Jira project | `<KEY>`: <board URL> |
| Confluence space | `<KEY>`: <space URL> |
| Default branch | `main` |
| Related repos | `aws-foundation` (accounts, deployment roles, DNS) |

## Standards

@CONTRIBUTING.md
@docs/standards/agent-workflow.md
@docs/standards/engineering.md
@docs/standards/security.md
@docs/standards/aws.md
@docs/standards/python.md
@docs/standards/frontend.md

## Jira workflow

> Copy names exactly as they appear in this Jira project.

| Status | Transition to reach it |
|---|---|
| <To Do> | — |
| <In Progress> | <e.g. "Start progress"> |
| <In Review> | <e.g. "Ready for review"> |
| <Done> | <e.g. "Done"> |

Issue types: <e.g. Epic, Story, Task, Bug, Subtask>

## Tech stack

- Infrastructure: AWS CDK (TypeScript)
- <Runtime and framework, e.g. Python Lambda functions, Astro>
- Testing: <e.g. Vitest, pytest, CDK assertions>
- CI/CD: <GitHub Actions with OIDC, or CDK Pipelines>

## Commands

Run from the repository root. Format, lint, type check, and tests must pass before every commit.

| Task | Command |
|---|---|
| Install | `<…>` |
| Dev server | `<…>` |
| Format | `<…>` |
| Lint | `<…>` |
| Type check | `<…>` |
| Tests (all) | `<…>` |
| Tests (single) | `<…>` |
| Synth | `<…>` |

## Architecture

```
<directory map>
```

Rules:

- Shared AWS resources come from `aws-foundation` through the SSM contract in `docs/standards/aws.md`. Do not create or change them here.
- <e.g. Handlers never call AWS clients directly; services receive adapters.>

## Conventions

- Commit scopes: <e.g. `infra`, `web`, `api`, `functions`, `docs`>
- Follow these examples: <paths to exemplary files>
- Avoid: <patterns deprecated or banned in this repository>

## Testing

- Location and naming: <e.g. `test/**/*.test.ts`, `functions/tests/**/test_*.py`>
- Requirements: <e.g. unit tests for services; assertion tests for security-critical stack properties>
- External services: <how they are faked>
- Known flaky tests: None.

## Configuration and secrets

Variables are documented in `.env.example`. Never commit `.env`.

| Variable | Purpose | Required |
|---|---|---|
| `<NAME>` | <…> | <yes/no> |

## Pull requests

- Required CI checks: `PR hygiene`, <job names>
- Merge strategy: squash merge
- Extra checklist items: <e.g. screenshots for UI changes, notable `cdk diff` output>

## Confluence page map

| Change | Page |
|---|---|
| New or changed feature | <…> |
| Architecture | <…> |
| API | <…> |
| Setup or configuration | <…> |
| Deployment or operations | <…> |
| Release | <…> |

## Restrictions and known issues

- Do not edit by hand: <generated code, vendored directories>
- <Known issues>

## Overrides of standards

None.
