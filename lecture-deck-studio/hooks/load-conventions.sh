#!/usr/bin/env bash
# Loads the current deck conventions into the session as additionalContext,
# so every deck-building session starts already knowing your house style.
set -euo pipefail

CONV="${CLAUDE_PLUGIN_ROOT}/skills/deck-design/deck-conventions.md"

if [[ -f "$CONV" ]]; then
  BODY="$(cat "$CONV")"
else
  BODY="No deck conventions recorded yet. They will accumulate as you correct deck work."
fi

# Emit JSON with additionalContext. jq keeps the body safely escaped.
if command -v jq >/dev/null 2>&1; then
  jq -n --arg ctx "DECK CONVENTIONS (house style for lecture decks):

$BODY" \
    '{additionalContext: $ctx}'
else
  # Minimal fallback if jq is unavailable.
  printf '{"additionalContext": "DECK CONVENTIONS loaded from deck-conventions.md"}\n'
fi
