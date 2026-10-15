---
name: context-mode-efficient
description: Keep bulk data out of chat — ctx_index once, ctx_search to locate, ctx_execute to derive. Pairs with graphify-first and Gate compress.
---

# Context-mode efficient

## Three layers (do not mix jobs)

| Layer | Tool | Job |
|-------|------|-----|
| Map | Graphify | Where lives / callers / paths |
| Compress | Gate-MCP | Shrink one chosen file |
| Sandbox | context-mode | Search index + run filters on big trees/logs |

## Per project (once)

1. `ctx_doctor` if tools fail.
2. `ctx_index` on repo root (reasonable `maxFiles` / `maxDepth`).
3. Reuse index — do not re-index every session.

## Patterns

- Find mention: `ctx_search` with specific terms.
- Big JSON/log: `ctx_execute_file` with intent, print matches only.
- Wrong: dump 2MB file into chat.

## MCP

Configure context-mode in your agent host; kit provides workflow docs only.
