# Workflow: switch agent

Use when moving Cursor → Claude Code → OpenCode (or new chat).

## Leaving session

1. Update `.context/state.md` (Now / Blockers / Next).
2. `~/.agent-kit/scripts/handoff.sh -m "Next: <verb> <path>"`
3. Commit code; **do not** commit `.context/` unless team policy says so.

## Entering session

1. `cd` project root.
2. **Prefer** the **recover** skill (`/recover`) so the agent reads `AGENTS.md` and runs the bundle.
3. **Script fallback:** `~/.agent-kit/scripts/recover.sh` (prints `AGENTS.md` header + `.context/`).
4. Or read `.context/handoff.md` tail manually if scripts unavailable.
5. Broad task pending → **graphify-first** before reads.

## Cursor → Antigravity

Same project folder. No re-init.

| Step | Action |
|------|--------|
| Leave Cursor | **handoff** skill or `handoff.sh -m "Next: …"`; update `.context/state.md` |
| Open Antigravity | Same directory; **new** chat |
| Resume | **recover** / `/recover` first (includes `AGENTS.md`); then continue from latest handoff |

If Antigravity has no skill host: paste recover.sh output or ask the agent to read `AGENTS.md` and `.context/brief.md` + `.context/state.md`.

## Symlinks

Skills should already link from `install.sh`. Run `doctor.sh` if a host does not see skills.
