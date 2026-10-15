# Workflow: token-efficient context

**This is the savings workflow.** Map → compress → read slice; sandbox for bulk.

## Classify every task

| Class | First move |
|-------|------------|
| Broad | Graphify query / wiki |
| Structural | graphify path / explain |
| Narrow | Gate signature on one file |
| Bulk log/JSON | ctx_execute* |

## Session order

```
1. gate_init (once per repo session) — if Gate-MCP enabled
2. graphify-out exists? → query before repo-wide Grep
3. ctx_search — unknown keyword location
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
