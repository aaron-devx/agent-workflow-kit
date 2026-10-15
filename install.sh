#!/usr/bin/env bash
# install.sh — copy kit to ~/.agent-kit and symlink skills where safe.
set -euo pipefail

KIT_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_HOME="${AGENT_KIT_HOME:-$HOME/.agent-kit}"
DRY_RUN=0

usage() {
  cat <<'EOF'
Usage: ./install.sh [--dry-run]

Installs agent-workflow-kit to ~/.agent-kit (override with AGENT_KIT_HOME).
Symlinks skills into agent skill directories when those dirs already exist.

Skill link targets (created only if parent dir exists):
  macOS / Linux — Cursor:     ~/.cursor/skills/<name>
  macOS / Linux — Claude Code: ~/.claude/skills/<name>
  macOS / Linux — OpenCode:    ~/.config/opencode/skills/<name>
                               or ~/.agents/skills/<name> (legacy)

Does not overwrite an existing non-symlink skill directory.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

run() {
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] $*"
  else
    eval "$@"
  fi
}

echo "Source: $KIT_SRC"
echo "Install: $KIT_HOME"

run "mkdir -p '$KIT_HOME'"
if command -v rsync >/dev/null 2>&1; then
  run "rsync -a --delete --exclude '.git' '$KIT_SRC/' '$KIT_HOME/'"
else
  run "cp -R '$KIT_SRC/.' '$KIT_HOME/'"
fi

link_skill() {
  local name="$1" target_root="$2"
  local src="$KIT_HOME/skills/$name"
  local dest="$target_root/$name"
  [[ -d "$src" ]] || return 0
  [[ -d "$target_root" ]] || return 0
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "skip (exists, not symlink): $dest"
    return 0
  fi
  run "ln -sfn '$src' '$dest'"
  echo "linked: $dest -> $src"
}

SKILL_DIRS=(
  "$HOME/.cursor/skills"
  "$HOME/.claude/skills"
  "$HOME/.config/opencode/skills"
  "$HOME/.agents/skills"
)

for skill_path in "$KIT_HOME/skills"/*/; do
  name="$(basename "$skill_path")"
  for root in "${SKILL_DIRS[@]}"; do
    link_skill "$name" "$root"
  done
done

run "chmod +x '$KIT_HOME/install.sh' '$KIT_HOME/scripts/'*.sh 2>/dev/null || true"

echo "Done. Add to PATH (optional): export PATH=\"\$HOME/.agent-kit/scripts:\$PATH\""
echo "Run: $KIT_HOME/scripts/doctor.sh"
