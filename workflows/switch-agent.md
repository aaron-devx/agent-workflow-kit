# Workflow: switch agent

Use when moving Cursor → Claude Code → OpenCode (or new chat).

## Leaving session

1. Update `.context/state.md` (Now / Blockers / Next).
2. `~/.agent-kit/scripts/handoff.sh -m "Next: <verb> <path>"`
3. Commit code; **do not** commit `.context/` unless team policy says so.

## Entering session

1. `cd` project root.
2. `~/.agent-kit/scripts/recover.sh` **or** read `.context/handoff.md` tail.
3. Invoke **recover** skill if host supports skills.
4. Broad task pending → **graphify-first** before reads.

## Symlinks

Skills should already link from `install.sh`. Run `doctor.sh` if a host does not see skills.
