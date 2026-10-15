#!/usr/bin/env bash
# recover.sh — print recovery bundle for a new agent (stdout only).
set -euo pipefail

PROJECT_ROOT="."
DRY_RUN=0
MAX_LINES=120

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help)
      echo "Usage: recover.sh [--dry-run] [PROJECT_ROOT]"
      exit 0
      ;;
    -*) echo "Unknown option: $1" >&2; exit 1 ;;
    *) PROJECT_ROOT="$1"; shift ;;
  esac
done

PROJECT_ROOT="$(cd "$PROJECT_ROOT" && pwd)"
CTX="$PROJECT_ROOT/.context"

if [[ ! -d "$CTX" ]]; then
  echo "No .context at $CTX — run init-project-context.sh" >&2
  exit 1
fi

emit_file() {
  local path="$1" label="$2"
  if [[ ! -f "$path" ]]; then
    echo "--- $label: (missing) ---"
    return 0
  fi
  echo "=== $label ($path) ==="
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] would print up to $MAX_LINES lines"
    wc -l < "$path" | xargs echo "lines:"
  else
    head -n "$MAX_LINES" "$path"
    local n
    n=$(wc -l < "$path" | tr -d ' ')
    if [[ "$n" -gt "$MAX_LINES" ]]; then
      echo "... (truncated at $MAX_LINES of $n lines — read file in editor)"
    fi
  fi
  echo ""
}

echo "# Agent recovery bundle"
echo "Project: $PROJECT_ROOT"
echo "Generated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo ""

emit_file "$CTX/brief.md" "Brief"
emit_file "$CTX/state.md" "State"
if [[ -f "$CTX/handoff.md" ]]; then
  echo "=== Handoff (tail) ($CTX/handoff.md) ==="
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] would print last 40 lines"
  else
    tail -n 40 "$CTX/handoff.md"
  fi
  echo ""
fi
emit_file "$CTX/decisions.md" "Decisions"

echo "Workflow: see ~/.agent-kit/workflows/switch-agent.md"
