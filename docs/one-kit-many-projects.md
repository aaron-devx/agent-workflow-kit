# One kit, many projects

Install **agent-workflow-kit once per machine**. Every app repo only gets **project context** — not another copy of the kit.

## Mental model

```
Machine (once)                    Each app repo (repeat)
─────────────────                 ───────────────────────
clone kit → ./install.sh          cd your-app
       ↓                          init-project-context.sh
~/.agent-kit                      AGENTS.md + .context/
skills symlinked                  same folder, any agent host
```

## Do

| Action | Where | Command / artifact |
|--------|--------|-------------------|
| Clone the kit | `~/Projects/agent-workflow-kit` (or any path) | `git clone … && ./install.sh` |
| Bootstrap a project | Your app repo root | `~/.agent-kit/scripts/init-project-context.sh` |
| End session | App repo root | **handoff** skill or `handoff.sh` |
| New chat / new host | Same app repo | **recover** skill or `recover.sh` |

## Do not

- **Do not** add `agent-workflow-kit` as a git submodule inside every app.
- **Do not** copy `skills/` or `scripts/` into each project — use `~/.agent-kit`.
- **Do not** commit `.context/` unless your team explicitly wants shared handoff (default: gitignored).

## Same directory, different agents

Cursor, Antigravity, Claude Code, OpenCode, etc. all read the **same** project folder:

- `AGENTS.md` — how agents should behave in this repo
- `.context/brief.md` — goals and constraints
- `.context/state.md` — current task
- `.context/handoff.md` — session snapshots

Switching hosts does not require re-init. Run **handoff** before you leave; run **recover** (or `/recover`) in the new chat.

## Updating the kit

```bash
cd ~/Projects/agent-workflow-kit
git pull
./install.sh
```

`install.sh` refreshes `~/.agent-kit` and re-links skills. Re-run `doctor.sh` after upgrades.

## Public vs private

| Location | Contents |
|----------|----------|
| This repo / `~/.agent-kit` | Skills, scripts, templates — safe to publish |
| Your app `.context/` | Handoff, decisions, brainstorms — keep private |

See [architecture.md](architecture.md).
