# agent-workflow-kit

Portable **setup + workflow** for AI coding agents on **macOS and Linux**: skills, templates, scripts, and docs. **Not** your project handoff, secrets, or app code.

## One kit per machine, context per project

| | Kit (once) | Project (each repo) |
|---|------------|---------------------|
| **What** | Skills, scripts, templates | `AGENTS.md` + `.context/` |
| **Where** | Clone anywhere → `~/.agent-kit` via `install.sh` | Your app / idea repo root |
| **Agents** | Symlinks into Cursor, Claude Code, OpenCode, … | Same folder works in **Cursor**, **Antigravity**, Claude Code, etc. |

**Do not** clone this repo inside every app project. One install on the machine; only run `init-project-context.sh` in each repo.

Details: [docs/one-kit-many-projects.md](docs/one-kit-many-projects.md).

## Quick start

### 1. Install once (this machine)

```bash
git clone https://github.com/Dukeabaddon/agent-workflow-kit.git ~/Projects/agent-workflow-kit
cd ~/Projects/agent-workflow-kit
chmod +x install.sh scripts/*.sh
./install.sh
~/.agent-kit/scripts/doctor.sh
```

Override install path: `AGENT_KIT_HOME=~/.agent-kit` (default).

### 2. Bootstrap each app repo

```bash
cd /path/to/your-repo
~/.agent-kit/scripts/init-project-context.sh
```

Creates `AGENTS.md` and `.context/*` from templates. Adds `.context/` and `brainstorms/` to `.gitignore` when missing. Edit `.context/brief.md` with goals and constraints.

### 3. Daily work — prefer skills

| Goal | Preferred | Fallback script |
|------|-----------|-----------------|
| End session / switch agent | **handoff** skill | `~/.agent-kit/scripts/handoff.sh -m "Next: …"` |
| New chat / continue work | **recover** skill (`/recover`) | `~/.agent-kit/scripts/recover.sh` |
| Sanity check install | — | `~/.agent-kit/scripts/doctor.sh` |

Skills live under `skills/` and are symlinked on install when host skill dirs exist (`~/.cursor/skills`, `~/.claude/skills`, …).

## Cursor → Antigravity (or any host switch)

Same project directory. No re-init.

1. **Before leaving Cursor:** run **handoff** (or `handoff.sh`) from the project root; update `.context/state.md` if needed.
2. **In Antigravity:** open the **same** folder; start a **new** chat.
3. **Resume:** invoke **recover** / `/recover`, or paste: *Read `AGENTS.md` and `.context/`, then continue from the latest handoff.*

See [workflows/switch-agent.md](workflows/switch-agent.md).

## When to run what

| Step | Frequency | Action |
|------|-----------|--------|
| `install.sh` | **Once per machine** (re-run after `git pull` on the kit) | Copy to `~/.agent-kit`, link skills |
| `init-project-context.sh` | **Once per repo** (or new idea folder) | `AGENTS.md` + `.context/` |
| **handoff** / **recover** | **Each session** when switching chats or agents | Snapshot + reload context |

## Token-efficient coding

Recommended order: **recover → map (graphify / dekko) → [Gate-MCP](https://github.com/Dukeabaddon/Gate-MCP) → Context Mode when needed** → read slices. Full playbook:

**[workflows/token-efficient-context.md](workflows/token-efficient-context.md)**

**Dekko** (informal) = first-pass repo orientation via Graphify — wiki, `graphify query`, or path/explain — before multi-file Read/Grep.

Optional stack is documented there and in [docs/research-tool-map.md](docs/research-tool-map.md). MCP example fragments under `mcp/fragments/` (`gate-mcp.json.example`, `context-mode.example.json`, `graphify-gate.example.json`) — no secrets in this repo.

## Optional: Caveman mode

**Caveman** is optional — see **[workflows/optional-caveman.md](workflows/optional-caveman.md)**. Not vendored in this kit.

## Repo layout

| Path | Purpose |
|------|---------|
| `skills/` | handoff, recover, graphify-first, grill-me, … |
| `templates/` | `AGENTS.md` + `.context/*` |
| `scripts/` | init, handoff, recover, doctor |
| `workflows/` | new project, switch agent, token stack |
| `docs/` | architecture, one-kit-many-projects |
| `mcp/fragments/` | Example MCP JSON (no secrets) |

## Public vs private

- **This repo / `~/.agent-kit`:** templates and workflows — safe to share.
- **Your app repo:** `.context/` and `brainstorms/` — private by default (gitignored).

See [docs/architecture.md](docs/architecture.md).

## License

MIT — see [LICENSE](LICENSE). `grill-me` credits in [skills/grill-me/ATTRIBUTION.md](skills/grill-me/ATTRIBUTION.md).
