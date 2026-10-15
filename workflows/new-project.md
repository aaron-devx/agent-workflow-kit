# Workflow: new project

## 1. Install kit (once per machine)

```bash
git clone https://github.com/YOUR_ORG/agent-workflow-kit.git
cd agent-workflow-kit && ./install.sh
```

## 2. Bootstrap repo context

```bash
cd /path/to/your-app
~/.agent-kit/scripts/init-project-context.sh
```

Add to `.gitignore`:

```
.context/
brainstorms/
```

## 3. Fill brief

Edit `.context/brief.md` — goal, constraints, stack.

## 4. Optional discovery

Run `/grill-me` (skill) for a dated capture in `brainstorms/`.

## 5. Agent rules

Copy or merge `templates/AGENTS.md` → `AGENTS.md`.

## 6. Token stack (recommended)

See `workflows/token-efficient-context.md` — build `graphify-out/`, index with context-mode, enable Gate-MCP in host.
