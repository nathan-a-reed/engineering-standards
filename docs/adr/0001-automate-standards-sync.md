# 0001: Automate standards sync

## Status

Accepted

## Context

Each project repository carries copies of `CONTRIBUTING.md`, `SECURITY.md`, `standards/`, the pull request template, and the `PR hygiene` workflow. Syncing them meant a hand-made pull request in every repository after each standards change, and copies drifted between syncs. Coding agents no longer open pull requests, so the owner would have to open every sync pull request by hand.

## Decision

- A `Standards sync` workflow runs on every merge to `main` that changes a synced file, and on demand. For each project repository it copies the files with `scripts/sync-standards.sh` and, when anything differs, force-pushes `docs/sync-engineering-standards` and opens or updates one pull request.
- It authenticates as a GitHub App installed only on the project repositories, with contents, pull requests, and workflows write access. The token is created per job and scoped to one repository.
- `PR hygiene` becomes a shared workflow. Project repositories call it from a short caller pinned to the commit that last changed it, so the check logic has one source.

## Alternatives

- **Manual sync pull requests:** no setup, but every change costs four pull requests and copies drift.
- **Fine-grained personal access token:** simpler to create, but it expires within a year, and pull requests would appear as the owner's own.
- **`GITHUB_TOKEN`:** cannot reach other repositories, and pull requests it opens do not trigger workflows, so `PR hygiene` would not run.
- **Copying `pr-hygiene.yml` instead of calling it:** works with the existing check name, but keeps four copies of the check logic.

## Consequences

- The app's private key is a long-lived secret in this repository. Rotate it from the app settings if it is exposed.
- The required check in project repositories is `PR hygiene / PR hygiene`, which is how GitHub names a job in a called workflow.
- Sync pull requests still need the owner's review and merge.
- New project repositories are added to the workflow matrix and the app installation.
