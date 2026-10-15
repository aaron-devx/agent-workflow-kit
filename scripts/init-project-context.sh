#!/usr/bin/env bash
# init-project-context.sh — bootstrap private .context/ from kit templates.
set -euo pipefail

KIT_HOME="${AGENT_KIT_HOME:-$HOME/.agent-kit}"
PROJECT_ROOT="."
CONTEXT_DIR=""
TEMPLATES="$KIT_HOME/templates"
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help)
      echo "Usage: init-project-context.sh [--dry-run] [PROJECT_ROOT]"
      exit 0
      ;;
    -*) echo "Unknown option: $1" >&2; exit 1 ;;
    *) PROJECT_ROOT="$1"; shift ;;
  esac
done

PROJECT_ROOT="$(cd "$PROJECT_ROOT" && pwd)"
CONTEXT_DIR="$PROJECT_ROOT/.context"

if [[ ! -d "$TEMPLATES/context" ]]; then
  echo "Kit not found at $KIT_HOME — run install.sh first." >&2
  exit 1
fi

copy_if_missing() {
  local src="$1" dest="$2"
  if [[ -e "$dest" ]]; then
    echo "exists: $dest"
    return 0
  fi
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] would copy $src -> $dest"
  else
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "created: $dest"
  fi
}

ensure_gitignore_line() {
  local line="$1"
  local gi="$PROJECT_ROOT/.gitignore"
  if [[ -f "$gi" ]] && grep -qxF "$line" "$gi" 2>/dev/null; then
    echo "gitignore ok: $line"
    return 0
  fi
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] would append to .gitignore: $line"
    return 0
  fi
  echo "$line" >> "$gi"
  echo "gitignore +: $line"
}

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "[dry-run] init in $PROJECT_ROOT"
else
  mkdir -p "$CONTEXT_DIR"
fi

for f in brief.md state.md handoff.md decisions.md rejected.md; do
  copy_if_missing "$TEMPLATES/context/$f" "$CONTEXT_DIR/$f"
done

copy_if_missing "$TEMPLATES/AGENTS.md" "$PROJECT_ROOT/AGENTS.md"

ensure_gitignore_line ".context/"
ensure_gitignore_line "brainstorms/"

echo "Private context: $CONTEXT_DIR"
echo "Next: edit .context/brief.md then scripts/handoff.sh before agent switch."
