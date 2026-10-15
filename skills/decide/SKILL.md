---
name: decide
description: Record a decision in .context/decisions.md and optional rejected.md entry. Use when user commits to an approach.
---

# Decide skill

## When

User says "we're going with X" or closes an architecture fork.

## Steps

1. Confirm decision in one sentence (mentor: name one risk).
2. Append to `.context/decisions.md`:

```markdown
## YYYY-MM-DD — Short title
- **Context:** ...
- **Decision:** ...
- **Consequences:** ...
```

3. If alternatives die, one line each in `.context/rejected.md`.

## Do not

- Store secrets or client names in public repos.
- Duplicate long brainstorms — link `brainstorms/...` instead.
