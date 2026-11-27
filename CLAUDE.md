# CLAUDE.md: Engineering standards / engineering-standards

## Project

Shared engineering standards, community health files, and repository templates for every `nathan-a-reed` repository. Also the starting point for planning, Jira, and Confluence sessions that are not tied to a single project repository.

| | |
|---|---|
| Jira project | `FND`: https://nathan-a-reed.atlassian.net/browse/FND (shared with `aws-foundation`) |
| Confluence space | `ENG` (Engineering): https://nathan-a-reed.atlassian.net/wiki/spaces/ENG. The standards themselves live in this repository. |
| Default branch | `main` |
| Related repos | `aws-foundation`, `portfolio-site` (planned), `outage-atlas`, `nasa-rag` |

## Standards

@CONTRIBUTING.md
@standards/agent-workflow.md
@standards/engineering.md
@standards/security.md
@standards/aws.md
@standards/python.md
@standards/frontend.md

## Jira workflow

| Status | Transition to reach it |
|---|---|
| To Do | To Do |
| In Progress | In Progress |
| In Review | In Review |
| Done | Done |

Issue types: Epic, Story, Task, Bug, Feature, Subtask

## Conventions

- Commit scopes: `standards`, `templates`, `ci`, `docs`
- After a merge to `main`, the standards sync (`.github/workflows/sync-standards.yml`) opens a `docs: sync engineering standards` pull request in each project repository whose copies differ. New project repositories are added to its matrix and to the sync app's installation.
- Files in `templates/` stay generic: placeholders use the `<…>` form.
- Root-level `.github/` and `.claude/` files mirror `templates/`. Update both together. The exception is `.github/workflows/pr-hygiene.yml`: the root file is the shared workflow, and the template is the caller that project repositories use.

## Pull requests

- Required CI checks: `PR hygiene`
- Merge strategy: squash merge

## Overrides of standards

None.
