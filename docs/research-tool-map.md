# Research tool map

**Source:** *Agentic Coding Best Practices* research PDF (user upload, 2026) — **100+ tools** cataloged across orchestration, memory, MCP, IDE agents, testing, and observability. This doc does not duplicate the full catalog; it maps **what the kit ships** vs **what you wire privately**.

## Core stack (~8) — Phase 1 leverage

| Tool | Layer | Mechanism in kit | In repo? |
|------|-------|------------------|----------|
| **Graphify** (`graphifyy`) | 1 Map | `graphify-first` skill, workflow | Doc + skill; CLI user-installed |
| **Gate-MCP** | 2 Compress | workflow, `mcp/fragments/graphify-gate.example.json` | Fragment only |
| **context-mode** | 3 Sandbox | `context-mode-efficient` skill, MCP fragment | Fragment only |
| **Shell scripts** | Ops | `scripts/*.sh` | Yes |
| **Skills** | Behavior | `skills/*/SKILL.md` + symlinks | Yes |
| **Templates** | Private state | `templates/context/*` → `.context/` | Yes |
| **Cursor / Claude rules** | Host policy | `rules/` pointers, user copies to `~/.cursor/rules` | Optional snippets |
| **ripgrep / git** | Baseline | doctor checks `rg` | System |

## Layer ↔ mechanism matrix (core)

| Layer | Skills | Hooks | Scripts | MCP | Templates |
|-------|--------|-------|---------|-----|-----------|
| 1 Map | graphify-first | (user) pre-read guard | — | Gate graph query | — |
| 2 Compress | — | compress-before-read | — | gatemcp | — |
| 3 Sandbox | context-mode-efficient | — | recover (bundle) | context-mode | — |
| Handoff | handoff, recover | — | handoff.sh, recover.sh | — | handoff.md |
| Discovery | grill-me, decide | — | init-project-context.sh | — | brief, decisions |

## Why the kit stays small

- **No schema bloat** — flat markdown + bash; avoids 100-tool YAML registry.
- **Phase 1** — highest ROI: map + compress + index + handoff loop.
- **Host-specific** — MCP paths and API keys belong in private `mcp.json`, not public git.
- **Optional tools** — documented below; add when a project needs them.

## Optional tools (from research PDF — not bundled)

Representative entries from the 100+ catalog. **Not** all installed by `install.sh`.

| Tool | Layer | Typical mechanism | Why optional |
|------|-------|-------------------|--------------|
| Context7 | 1/2 | MCP docs lookup | Needs API key |
| Sequential Thinking | Meta | MCP | Reasoning only |
| Playwright / Browser MCP | Verify | MCP | Heavy, task-specific |
| Notion / Linear MCP | PM | MCP | Org credentials |
| Obsidian REST | Memory | MCP | Private vault |
| Mem0 / Zep | Memory | SaaS | Data residency |
| Aider / OpenHands | Agent | CLI | Different product surface |
| Devin / Augment | Agent | SaaS | Not portable scripts |
| LangGraph / CrewAI | Orchestration | Code | Framework lock-in |
| LlamaIndex / GraphRAG | Map | Code | Overlap with Graphify |
| Tree-sitter only | Map | Library | Graphify includes AST |
| TOON / json compress | 2 | Gate | Inside Gate-MCP |
| Docker MCP | Sandbox | MCP | Infra-heavy |
| Sentry / Datadog MCP | Ops | MCP | Org accounts |
| GitHub MCP | Ops | MCP | Token scope |
| Figma MCP | Design | MCP | Role-specific |
| grep / ast-grep | Baseline | CLI | Always local |
| Hooks (Cursor) | Policy | `hooks.json` | Host-specific |
| Subagents / Task | Orchestration | Host | Cursor-native |
| … | … | … | See full PDF tables |

## Read order (token savings)

Documented in `workflows/token-efficient-context.md`:

1. Classify Broad / Narrow / Structural  
2. Layer 1 query or `ctx_search`  
3. Layer 2 compress chosen file  
4. Read minimal slice  
5. Layer 3 for logs and multi-file derivations  

## Citations

- Research PDF: *Agentic Coding Best Practices* (2026, user-provided).
- Graphify: https://github.com/safishamsi/graphify
- Gate-MCP: https://github.com/Dukeabaddon/Gate-MCP
- grill-me lineage: mattpocock/skills, nateherkai/AIS-OS (see `skills/grill-me/ATTRIBUTION.md`)
