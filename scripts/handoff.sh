#!/usr/bin/env bash
# handoff.sh — refresh handoff block for the next agent session.
set -euo pipefail

PROJECT_ROOT="."
MESSAGE=""
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    -m|--message) MESSAGE="${2:-}"; shift 2 ;;
    -h|--help)
      echo "Usage: handoff.sh [--dry-run] [-m message] [PROJECT_ROOT]"
      exit 0
      ;;
    -*) echo "Unknown option: $1" >&2; exit 1 ;;
    *) PROJECT_ROOT="$1"; shift ;;
  esac
done

PROJECT_ROOT="$(cd "$PROJECT_ROOT" && pwd)"
HANDOFF="$PROJECT_ROOT/.context/handoff.md"
STATE="$PROJECT_ROOT/.context/state.md"

if [[ ! -f "$HANDOFF" ]]; then
  echo "Missing $HANDOFF — run init-project-context.sh first." >&2
  exit 1
fi

TS="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
BLOCK=$(cat <<EOF

## Handoff snapshot ($TS)

**Status:** ready for next agent

**Message:** ${MESSAGE:-No message — pass -m \"next step\"}

**Pointers:**
- Brief: \`.context/brief.md\`
- State: \`.context/state.md\`
- Decisions: \`.context/decisions.md\`

**Recover:** \`~/.agent-kit/scripts/recover.sh\` in project root

EOF
)

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "[dry-run] would append to $HANDOFF:"
  echo "$BLOCK"
  exit 0
fi

{
  echo "$BLOCK"
} >> "$HANDOFF"

echo "Appended handoff snapshot to $HANDOFF"

if [[ -f "$STATE" ]]; then
  if ! grep -q "Last handoff:" "$STATE" 2>/dev/null; then
    echo "" >> "$STATE"
  fi
  echo "Last handoff: $TS" >> "$STATE"
fi
