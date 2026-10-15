---
name: handoff
description: End an agent session cleanly — update .context/state.md and append a handoff snapshot via handoff.sh. Use before switching agents or closing a long task.
---

# Handoff skill

## When

User stops mid-project, switches Cursor ↔ Claude ↔ OpenCode, or starts a fresh chat.

## Steps

1. Read `.context/brief.md` and `.context/state.md`.
2. Update **state**: what finished, blockers, exact next step (file paths).
3. Run from project root:

```bash
~/.agent-kit/scripts/handoff.sh -m "Concrete next action + key paths"
```

4. If a decision was made, append one line to `.context/decisions.md`.

## Agent instructions

- Handoff message must be **actionable** (verb + path), not vague status.
- Link PRs/issues by URL when public-safe.
- Never paste API keys or client PII.
