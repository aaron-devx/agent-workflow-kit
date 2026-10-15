# agent-workflow-kit

Portable **setup + workflow** for AI coding agents on **macOS and Linux**. Skills, templates, scripts, and docs — **not** your project handoff or secrets.

## 5-minute start

```bash
git clone https://github.com/Dukeabaddon/agent-workflow-kit.git ~/Projects/agent-workflow-kit
cd ~/Projects/agent-workflow-kit
chmod +x install.sh scripts/*.sh
./install.sh
~/.agent-kit/scripts/doctor.sh
```

Bootstrap a project:

```bash
cd /path/to/your-repo
~/.agent-kit/scripts/init-project-context.sh
# edit .context/brief.md (init also appends .context/ and brainstorms/ to .gitignore)
```

End a session / switch agent:

```bash
~/.agent-kit/scripts/handoff.sh -m "Next: implement foo in src/foo.ts"
```

New session:

```bash
~/.agent-kit/scripts/recover.sh
```

Token-efficient coding: read `workflows/token-efficient-context.md`.

## Layout

| Path | Purpose |
|------|---------|
| `skills/` | Agent skills (symlinked on install) |
| `templates/` | `AGENTS.md` + `.context/*` templates |
| `scripts/` | init, handoff, recover, doctor |
| `workflows/` | new project, switch agent, token stack |
| `docs/` | architecture, research tool map |
| `mcp/fragments/` | Example MCP JSON (no secrets) |

## Skill install paths

`install.sh` symlinks into existing directories only:

- `~/.cursor/skills/<skill>`
- `~/.claude/skills/<skill>`
- `~/.config/opencode/skills/<skill>` or `~/.agents/skills/<skill>`

Override install dir: `AGENT_KIT_HOME=~/.agent-kit`.

## Public vs private

- **This repo:** templates and workflows.
- **Your app repo:** `.context/` and `brainstorms/` (gitignored by default).

See `docs/architecture.md`.

## Git remote

If you cloned locally only:

```bash
cd ~/Projects/agent-workflow-kit
git remote add origin git@github.com:YOUR_ORG/agent-workflow-kit.git
git push -u origin main
```

(`gh` logged in as Dukeabaddon — use your org/repo name.)

## License

MIT — see `LICENSE`. `grill-me` skill credits in `skills/grill-me/ATTRIBUTION.md`.
