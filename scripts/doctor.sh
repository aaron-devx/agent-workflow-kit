#!/usr/bin/env bash
# doctor.sh — sanity-check kit install and optional CLI tools.
set -euo pipefail

KIT_HOME="${AGENT_KIT_HOME:-$HOME/.agent-kit}"
FAIL=0

ok() { echo "OK  $*"; }
warn() { echo "WARN $*"; }
bad() { echo "FAIL $*"; FAIL=1; }

echo "agent-workflow-kit doctor"
echo "KIT_HOME=$KIT_HOME"
echo ""

if [[ -d "$KIT_HOME" ]]; then ok "kit directory"; else bad "kit missing — run install.sh"; fi
for s in init-project-context.sh handoff.sh recover.sh doctor.sh; do
  if [[ -x "$KIT_HOME/scripts/$s" ]]; then ok "script $s"; else bad "missing or not executable: scripts/$s"; fi
done

for skill in grill-me handoff recover graphify-first context-mode-efficient decide; do
  if [[ -f "$KIT_HOME/skills/$skill/SKILL.md" ]]; then ok "skill $skill"; else bad "skill $skill"; fi
done

check_link() {
  local path="$1"
  if [[ -L "$path" ]]; then
    local t
    t=$(readlink "$path" 2>/dev/null || true)
    ok "symlink $path -> $t"
  elif [[ -d "$path" ]]; then
    warn "skill dir exists (not symlink): $path"
  fi
}

for root in "$HOME/.cursor/skills" "$HOME/.claude/skills"; do
  [[ -d "$root" ]] || continue
  for skill in grill-me handoff recover graphify-first context-mode-efficient decide; do
    check_link "$root/$skill"
  done
done

echo ""
echo "Optional stack (token-efficient workflow):"
if command -v graphify >/dev/null 2>&1; then ok "graphify CLI"; else warn "graphify not in PATH (uv tool install graphifyy)"; fi
if command -v rg >/dev/null 2>&1; then ok "ripgrep"; else warn "ripgrep not found"; fi

echo ""
if [[ "$FAIL" -eq 0 ]]; then
  echo "Result: healthy"
  exit 0
else
  echo "Result: fix failures above"
  exit 1
fi
