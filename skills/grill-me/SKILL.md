---
name: grill-me
description: Interview the user relentlessly about a plan, design, or topic, checkpointing every answer to a brainstorm file. Use for discovery, stress-testing a design, or extracting durable context before implementation. User invokes explicitly ("grill me").
---

# Grill Me

Relentlessly interview the user until shared understanding. Walk the decision tree; resolve dependencies one branch at a time. **Checkpoint every answer to disk** so context loss does not erase the session.

Based on [Matt Pocock's grill-me](https://github.com/mattpocock/skills) (stateless interview) and [Nate Herk's AIS-OS](https://github.com/nateherkai/AIS-OS) checkpoint pattern. See `ATTRIBUTION.md`.

## Capture file (kit default)

1. Create `brainstorms/YYYY-MM-DD-{topic-slug}.md` at **project root** (or path in `AGENTS.md`).
2. Header: title, date, goal, empty Open flags.
3. Tell the user the path in one line. Then ask Q1.

After **every** answer: append Q&A to the file, update summary if needed, then ask next question. One question at a time.

If the question is answerable from the repo, explore first.

## Capture structure

- Summary / key decisions (running)
- Q&A log (Qn — topic, asked, captured, flags)
- Open flags (owner)

## Boundaries

- No secrets in captures; redact tokens.
- Brainstorm files are **private** — keep out of public kit repos; gitignore `brainstorms/` by default.
- Do not auto-edit canonical `.context/` unless the user asks to promote confirmed facts.

## End / pause

Short recap: capture path, open flags, suggested next step (`handoff.sh`, `decide` skill, or implementation).
