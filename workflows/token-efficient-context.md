# Workflow: token-efficient context

**This is the savings workflow.** Map → compress → read slice; sandbox for bulk.

## Stack order (session)

1. **Recover** — `recover` skill or `recover.sh` (loads `AGENTS.md` + `.context/` before coding).
2. **Map (graphify / dekko)** — “Dekko” = quick repo orientation: `graphify query`, `graphify-out/wiki/index.md`, or `graphify path` / `explain` before wide Read/Grep. Graphify is CLI; not MCP.
3. **[Gate-MCP](https://github.com/Dukeabaddon/Gate-MCP)** — `gate_init` once per repo session; `gate_compress_file` on chosen large files; `gate_graph_query` for symbols. Compresses what you already decided to open.
4. **Context Mode** — when needed: `ctx_index` / `ctx_search` for unknown keyword location; `ctx_execute*` for bulk logs/JSON (derive in sandbox; print only matches).

Do not swap layers (see table below).

## Classify every task

| Class | First move |
|-------|------------|
| Broad | Graphify query / wiki |
| Structural | graphify path / explain |
| Narrow | Gate signature on one file |
| Bulk log/JSON | ctx_execute* |

## Session order (after recover)

```
0. recover — AGENTS.md + .context bundle
1. graphify / dekko — map before orientation reads
2. gate_init (once per repo session) — if Gate-MCP enabled
3. ctx_search — unknown keyword location (context-mode)
4. gate_compress_file — file >400 lines or JSON >800 lines
5. Read — only lines you will edit
6. After structural edits → graphify update .
```

## Layer jobs (do not swap)

- **Graphify** — architecture, symbols, communities (not one-file shrink).
- **Gate-MCP** — AST signatures, structure summaries (not "find all callers").
- **context-mode** — indexed search + sandbox scripts (not symbol graph).

## Anti-patterns

- Read 5+ files to "get oriented"
- Paste multi-MB tool output into chat
- Re-index every session
- Invent token savings — use measured Gate stats when available

## Kit scope

Public kit documents this flow. MCP binaries and API keys stay in **private** host config.
