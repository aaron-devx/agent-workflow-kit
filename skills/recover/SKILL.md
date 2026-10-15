---
name: recover
description: Start a new agent session from .context/ — run recover.sh or read handoff tail. Use after switch-agent or context reset.
---

# Recover skill

## When

New chat, new agent product, or user says "continue where we left off."

## Steps

1. Read `AGENTS.md` if present.
2. Run:

```bash
~/.agent-kit/scripts/recover.sh
```

3. Read full `.context/brief.md` if recover output truncated.
4. Confirm **one** next action with user only if handoff is ambiguous.

## Order

brief → state → handoff (tail) → decisions → repo map if broad question pending.

Do not re-ask decisions listed in `decisions.md` unless user requests revisit.
