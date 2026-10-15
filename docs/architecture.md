# Architecture — three layers + public vs private

## Three context layers

| Layer | Name | Mechanism | Question it answers |
|-------|------|-----------|---------------------|
| **1** | Map | Graphify (`graphify-out/`), optional wiki | Where does X live? What calls Y? Path A→B? |
| **2** | Compress | Gate-MCP (`gate_compress_file`, graph query) | What is in this file without reading 2k lines? |
| **3** | Sandbox / index | context-mode (`ctx_index`, `ctx_search`, `ctx_execute`) | Where is keyword K? Filter this huge log in sandbox |

Layers are **different jobs**. Using all three for the same step wastes tokens.

## What lives in the public kit (`agent-workflow-kit`)

- Skills (`skills/*/SKILL.md`)
- Shell scripts (`scripts/`)
- Templates (`templates/`) — **copies** into projects
- Workflows (`workflows/`)
- MCP **fragments** (`mcp/fragments/`) — example JSON only
- Docs (`docs/`)

No project handoff, no API keys, no client data.

## What stays private (per repo `.context/`)

| File | Content |
|------|---------|
| `brief.md` | Goals, constraints |
| `state.md` | Current task |
| `handoff.md` | Session snapshots |
| `decisions.md` | ADR-lite |
| `rejected.md` | Dead ends |

Optional: `brainstorms/` from grill-me (gitignored by default).

## Install layout

```
~/.agent-kit/          # copied from clone
~/.cursor/skills/*     # symlinks when dir exists
~/.claude/skills/*     # symlinks when dir exists
```

Project repo:

```
AGENTS.md              # from template
.context/              # private, local
graphify-out/          # generated map (often gitignored)
```

## Phase 1 philosophy

Flat markdown + shell. No schema DSL. No giant YAML. Add tools via docs and optional MCP — not mandatory config in every repo.
