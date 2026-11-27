#!/usr/bin/env bash
# Copies the synced files from an engineering-standards checkout into a
# project repository checkout. Usage: sync-standards.sh <source> <target> <workflow-sha>
set -euo pipefail

if (( $# != 3 )); then
  echo "Usage: $0 <source-dir> <target-dir> <workflow-sha>" >&2
  exit 2
fi
source_dir=$1
target_dir=$2
workflow_sha=$3

if [[ ! $workflow_sha =~ ^[0-9a-f]{40}$ ]]; then
  echo "Workflow SHA must be a full 40-character commit SHA, got '$workflow_sha'." >&2
  exit 2
fi

cp "$source_dir/CONTRIBUTING.md" "$source_dir/SECURITY.md" "$target_dir/"

# docs/standards/ holds only synced copies, so standards removed at the source are removed here too.
mkdir -p "$target_dir/docs/standards"
find "$target_dir/docs/standards" -maxdepth 1 -name '*.md' -delete
cp "$source_dir"/standards/*.md "$target_dir/docs/standards/"

# Pull requests have no template, so remove copies added before the sync existed.
rm -f "$target_dir/.github/pull_request_template.md"

mkdir -p "$target_dir/.github/workflows"

caller="$target_dir/.github/workflows/pr-hygiene.yml"
pattern='^(    uses: [^@]+/\.github/workflows/pr-hygiene\.yml)@.*$'
sed -E "s|$pattern|\1@$workflow_sha|" "$source_dir/templates/.github/workflows/pr-hygiene.yml" > "$caller"
if ! grep -q "pr-hygiene.yml@$workflow_sha\$" "$caller"; then
  echo "Could not pin the PR hygiene workflow in $caller." >&2
  exit 1
fi
