---
name: graphify-first
description: For broad or structural codebase questions, query graphify (repo map) before multi-file Read/Grep. Use when graphify-out exists or after graphify build.
---

# Graphify-first

## Classify

| Type | Action |
|------|--------|
| Broad | `graphify query "..."` or read `graphify-out/wiki/index.md` |
| Structural | `graphify path "A" "B"` or `graphify explain "X"` |
| Narrow | Skip map; optional gate compress on one file |

## Init (once per repo)

If `graphify-out/graph.json` missing:

```bash
uv tool install graphifyy   # or pip install graphifyy
graphify . --no-viz
```

After large structural edits: `graphify update .`

## Hard rule

No 5+ full file reads for orientation when a graph exists.

## Not for

Single-line edits, known file path, shrinking one log (use context-mode or gate compress).
