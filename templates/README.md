# Repository setup

Checklist for creating a project repository.

## Files

| Template | Destination |
|---|---|
| `LICENSE` | Repository root |
| `CLAUDE.md` | Repository root; fill in the description and commands |
| `.claude/settings.json` | `.claude/settings.json` |
| `.github/CODEOWNERS`, `.github/dependabot.yml` | `.github/` |

`CONTRIBUTING.md`, `SECURITY.md`, `docs/standards/` (every standard; `CLAUDE.md` imports only those that apply), and the `PR hygiene` caller come from the standards sync instead: see [Standards sync](#standards-sync).

Also add `docs/adr/0001-record-architecture-decisions.md`, a `.gitignore` that includes `.env` and `.env.*` (except `.env.example`), and a README following `engineering.md`.

`portfolio-site` adds this to its README: code is MIT licensed; written content, images, and résumé are © Nathan Reed, all rights reserved.

## Jira

- Connect the repository through Atlassian's GitHub integration (GitHub for Jira) so branches, commits, and pull requests appear in each ticket's development panel.

## General settings

- Description, website, and topics filled in
- Squash merging only, with the default message "Pull request title and commit details"
- Always suggest updating pull request branches; allow auto-merge
- Disable Wiki and Projects; disable Issues while work is tracked in Jira
- Automatically delete head branches

## Ruleset for `main`

Import `rulesets/main.json` (Settings → Rules → Rulesets → New ruleset → Import a ruleset), then add the repository's CI jobs to the required status checks.

- Require a pull request, squash merge only, no required approvals while there is a single maintainer
- Require status checks from GitHub Actions, up to date with `main`: `PR hygiene / PR hygiene` plus the repository's CI jobs
- Require conversation resolution
- Require linear history
- Block force pushes and deletion
- No bypass list

## Standards sync

1. Add the repository to the GitHub App used by the standards sync (GitHub settings → Applications → the app → Configure → Repository access).
2. Add the repository to the `matrix.repository` list in `engineering-standards/.github/workflows/sync-standards.yml`.
3. After that change merges, the sync opens the first `docs: sync engineering standards` pull request. Start the `Standards sync` workflow manually to sync again without a standards change.

## Code security

- Dependabot alerts and security updates
- Secret scanning with push protection
- CodeQL default setup
- Private vulnerability reporting

## Actions

- Allow actions created by GitHub and by Marketplace verified creators, and require actions to be pinned to a full-length commit SHA
- Workflow permissions: keep GitHub's default for new repositories (read repository contents; Actions cannot create or approve pull requests). Workflows also declare their own permissions.
- Fork pull request workflows: keep GitHub's default (approval required for first-time contributors). Fork runs get a read-only token, no secrets, and no access to deployment environments.

## Environments

| Environment | Protection | Variables |
|---|---|---|
| `test` | Deploy from `main` only | `AWS_ACCOUNT_ID`, `AWS_DEPLOY_ROLE_ARN` |
| `prod` | Deploy from `main` only; required reviewer | `AWS_ACCOUNT_ID`, `AWS_DEPLOY_ROLE_ARN` |

Leave "Prevent self-review" off while there is a single maintainer, and do not allow administrators to bypass protection rules.
