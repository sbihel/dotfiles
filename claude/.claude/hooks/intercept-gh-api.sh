#!/usr/bin/env bash
set -euo pipefail

# Intercept `gh api` calls that have direct `gh` subcommand equivalents.
# These subcommands are already in the allowlist and don't need Bash permission.

CMD=$(jq -r '.tool_input.command // empty' 2>/dev/null) || exit 0
[[ -z "$CMD" ]] && exit 0

# Only check commands starting with gh api
[[ ! "$CMD" =~ gh[[:space:]]+api ]] && exit 0

# Extract the API endpoint (first non-flag arg after "api")
endpoint=""
for arg in $CMD; do
  [[ "$arg" == "gh" || "$arg" == "api" ]] && continue
  [[ "$arg" == -* ]] && continue
  endpoint="$arg"
  break
done
[[ -z "$endpoint" ]] && exit 0

# Strip leading slash and quotes
endpoint="${endpoint#/}"
endpoint="${endpoint#\"}"
endpoint="${endpoint#\'}"

suggestion=""

# repos/{owner}/{repo}/issues/{number}/comments
if [[ $endpoint =~ ^repos/([^/]+)/([^/]+)/issues/([0-9]+)/comments ]]; then
  suggestion="Use \`gh issue view ${BASH_REMATCH[3]} --repo ${BASH_REMATCH[1]}/${BASH_REMATCH[2]} --comments\` instead"

# repos/{owner}/{repo}/issues/{number}
elif [[ $endpoint =~ ^repos/([^/]+)/([^/]+)/issues/([0-9]+)$ ]]; then
  suggestion="Use \`gh issue view ${BASH_REMATCH[3]} --repo ${BASH_REMATCH[1]}/${BASH_REMATCH[2]}\` instead"

# repos/{owner}/{repo}/issues (list)
elif [[ $endpoint =~ ^repos/([^/]+)/([^/]+)/issues$ ]]; then
  suggestion="Use \`gh issue list --repo ${BASH_REMATCH[1]}/${BASH_REMATCH[2]}\` instead"

# repos/{owner}/{repo}/releases/latest
elif [[ $endpoint =~ ^repos/([^/]+)/([^/]+)/releases/latest ]]; then
  suggestion="Use \`gh release view --repo ${BASH_REMATCH[1]}/${BASH_REMATCH[2]}\` instead"

# repos/{owner}/{repo}/releases (list)
elif [[ $endpoint =~ ^repos/([^/]+)/([^/]+)/releases$ ]]; then
  suggestion="Use \`gh release list --repo ${BASH_REMATCH[1]}/${BASH_REMATCH[2]}\` instead"

# repos/{owner}/{repo}/pulls/{number}
elif [[ $endpoint =~ ^repos/([^/]+)/([^/]+)/pulls/([0-9]+)$ ]]; then
  suggestion="Use \`gh pr view ${BASH_REMATCH[3]} --repo ${BASH_REMATCH[1]}/${BASH_REMATCH[2]}\` instead"

# repos/{owner}/{repo}/pulls (list)
elif [[ $endpoint =~ ^repos/([^/]+)/([^/]+)/pulls$ ]]; then
  suggestion="Use \`gh pr list --repo ${BASH_REMATCH[1]}/${BASH_REMATCH[2]}\` instead"

# repos/{owner}/{repo}/readme
elif [[ $endpoint =~ ^repos/([^/]+)/([^/]+)/readme$ ]]; then
  suggestion="Use \`gh repo view ${BASH_REMATCH[1]}/${BASH_REMATCH[2]}\` (shows README by default) or clone the repo instead"

# repos/{owner}/{repo} (bare — repo metadata)
elif [[ $endpoint =~ ^repos/([^/]+)/([^/]+)$ ]]; then
  suggestion="Use \`gh repo view ${BASH_REMATCH[1]}/${BASH_REMATCH[2]} --json <fields>\` instead"

# search/repositories
elif [[ $endpoint =~ ^search/repositories ]]; then
  suggestion="Use \`gh search repos <query>\` instead"
fi

[[ -z "$suggestion" ]] && exit 0

jq -n --arg reason "${suggestion}. The gh subcommand is already in the allowlist and provides structured output." \
  '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":$reason}}'
