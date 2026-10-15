# AGENTS.md (project)

Agents: read this file first, then `.context/brief.md` and `.context/state.md`.

## Private context (never commit secrets)

| File | Purpose |
|------|---------|
| `.context/brief.md` | Stable goals, constraints, stack |
| `.context/state.md` | Current task, blockers, links |
| `.context/handoff.md` | Last session snapshot for switch |
| `.context/decisions.md` | Accepted decisions (ADR-lite) |
| `.context/rejected.md` | Ideas explicitly rejected |

Add `.context/` to `.gitignore` unless your team chooses otherwise.

## Token-efficient exploration

1. **Broad question** → repo map (`graphify query`) or indexed search (`ctx_search`).
2. **Chosen file** → compress signatures before full read (Gate-MCP).
3. **Bulk output** → sandbox execute; print only matches.

See `~/.agent-kit/workflows/token-efficient-context.md`.

## Handoff

Before ending a session: update `.context/state.md`, run `handoff.sh -m "..."`.

New session: `recover.sh` or read `.context/handoff.md`.

## Skills (global install)

Installed via [agent-workflow-kit](https://github.com/Dukeabaddon/agent-workflow-kit): `grill-me`, `handoff`, `recover`, `graphify-first`, `context-mode-efficient`, `decide`.
