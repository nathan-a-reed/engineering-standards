# Engineering standards

Shared engineering standards and repository templates for every `nathan-a-reed` repository. Each project repository carries a synced copy of the standards, so the rules are visible wherever the code is read.

## Repositories

| Repository | Purpose | Delivery |
|---|---|---|
| `aws-foundation` | AWS Organization baseline, deployment roles, DNS, budgets | GitHub Actions |
| `portfolio-site` (planned) | `nathanreed.dev`: background, experience, and projects | GitHub Actions |
| `outage-atlas` | AI agent application | To be decided |
| `nasa-rag` | Question answering over NASA documentation with Amazon Bedrock | AWS CodePipeline (CDK Pipelines) |

## Contents

| Path | Synced to | Covers |
|---|---|---|
| `CONTRIBUTING.md` | `CONTRIBUTING.md` | Tickets, branches, commits, pull requests, definition of done |
| `SECURITY.md` | `SECURITY.md` | Vulnerability reporting |
| `standards/agent-workflow.md` | `docs/standards/` | How coding agents work: order of work, when to stop, Jira and Confluence updates |
| `standards/engineering.md` | `docs/standards/` | Code quality, reuse, comments, dependencies, testing, ADRs |
| `standards/aws.md` | `docs/standards/` | Accounts, repository responsibilities, foundation contract, CDK, cost |
| `standards/security.md` | `docs/standards/` | Secrets, access, data protection, edge, AI features, supply chain |
| `standards/python.md` | `docs/standards/` | Lambda functions |
| `standards/frontend.md` | `docs/standards/` | Astro and React applications, design system |
| `templates/.github/workflows/pr-hygiene.yml` | `.github/workflows/` | Caller for the shared `PR hygiene` workflow, pinned to a commit SHA |
| `templates/` | Various | Starting files and setup checklist for new repositories |

## Changing a standard

Open a pull request here. After it merges, the standards sync opens a `docs: sync engineering standards` pull request in each project repository whose copies differ; see [ADR 0001](docs/adr/0001-automate-standards-sync.md). Synced copies are never edited in place. To run the sync again, start the `Standards sync` workflow manually.
