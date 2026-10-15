# Handoff

Use this file for **session-to-session** agent switches. Append snapshots; do not delete history without reason.

## How to use

```bash
# from project root
~/.agent-kit/scripts/handoff.sh -m "Stopped after X; next is Y"
```

New agent reads `.context/handoff.md` (tail) or runs `recover.sh`.

---

## Template (delete this section after first real handoff)

_Replace with snapshots from `handoff.sh`._
