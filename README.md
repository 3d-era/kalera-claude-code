# Kalera Claude Code

> **How Kalera uses Claude Code.** Ingredients from everything-claude-code (50K+ stars) + our secret sauce: Munin memory, sensible defaults, and a workflow that actually ships.

[![Stars](https://img.shields.io/github/stars/3d-era/kalera-claude-code?style=flat)](https://github.com/3d-era/kalera-claude-code/stargazers)
[![MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

## What Is This?

This is the **exact Claude Code setup Kalera uses every day.** It's built on [everything-claude-code](https://github.com/affaan-m/everything-claude-code) — the 50K+ star Anthropic hackathon winner — then tuned with:

- 🧠 **Munin** — Long-term memory. Claude remembers your project, your bugs, your decisions. No repeating yourself.
- ⚙️ **Pre-configured plugins** — Security audit, AI/ML, frontend, parallel research, HuggingFace, and more.
- 🚀 **One-command install** — Works on a fresh machine in under 2 minutes.

If everything-claude-code is the **ingredients**, this is the **recipe.**

---

## What's Inside

### Plugins (26 total)

Installed and tested together. No compatibility guessing.

**From Claude Plugins Official:**
`frontend-design` · `context7` · `code-review` · `feature-dev` · `playwright` · `claude-md-management` · `claude-code-setup` · `huggingface-skills` · `skill-creator`

**From Community Marketplaces:**
`audit` · `explore` · `frontend-developer` · `lyra` · `optimize` · `ui-designer` · `ultrathink` · `ai-engineer` · `api-integration-specialist` · `bug-detective` · `problem-solver-specialist` · `parallel` · `claude-hud`

**From Kalera:**
`munin-claude-code` — Long-term memory (see below)

### From Everything Claude Code (base layer)

| Category | Count | Examples |
|----------|-------|---------|
| **Agents** | 31 | `code-reviewer`, `security-reviewer`, `build-error-resolver`, language-specific reviewers |
| **Skills** | 142 | `tdd-workflow`, `security-review`, `api-design`, `docker-patterns`, `python-patterns`, etc. |
| **Commands** | 50 | `/multi-plan`, `/multi-execute`, `/prp-*` workflow, `/loop-*`, `/prompt-optimize` |
| **Rules** | 75+ | Common rules + TypeScript, Python, Go, Java, Kotlin, C++, Rust, Swift, PHP |
| **Hooks** | 20+ | PreToolUse, PostToolUse, Stop, SessionEnd |

### From Munin Memory System (Kalera's secret sauce)

| Feature | What It Does |
|---------|-------------|
| **Session Start** | Auto-loads relevant project memories at every session |
| **GraphRAG Memory** | Semantic search + knowledge graph extraction |
| **Error Catalog** | Search → fix → store loop for bugs |
| **Per-Project Memory** | Each project gets its own memory context |
| **E2EE Encryption** | End-to-end encrypted memory storage |
| **Cross-Project Sharing** | Share memories between projects via Hash Key |

---

## Quick Start

### Step 1 — Munin Account (Free, Required for Memory)

> Munin needs an account to store memories. **It's free.** Sign up takes 30 seconds.

1. Go to [munin.kalera.app](https://munin.kalera.app) → **Sign Up** (free)
2. Create a project → copy your **Project ID** (`proj_xxxxxxxxxxxx`)

### Step 2 — Install

```bash
# The one-liner installer
bash -c "$(curl -fsSL https://raw.githubusercontent.com/3d-era/kalera-claude-code/main/install.sh)"
```

Or step by step:

```bash
# 1. Add the Kalera marketplace
/plugin marketplace add kalera-cc

# 2. Install the main plugin (everything-claude-code)
/plugin install everything-claude-code@kalera-cc

# 3. Install Munin memory
/plugin install munin-claude-code@kalera-cc

# 4. Restart Claude Code
```

### Step 3 — Set Your Munin Project ID

```bash
# Run this command in Claude Code:
/munin-projectid

# It will show your current ID or prompt you to set it.
# Paste your Project ID when asked.
```

---

## Munin Commands

```bash
@munion what were we working on last time?
@munion find errors about the payment API
@munion show architecture decisions

/munin-projectid   # Check or set your project ID
/munin-memory     # Search project memories
/munin-architecture # View tech stack context
/munin-error-catalog # Search + fix known bugs
```

---

## How Kalera Works — Orchestration Patterns

These are the **turf secrets** that make Claude Code actually ship instead of just chat:

> **Every sub-agent MUST call Munin at start and store findings at end.** See Memory Protocol above.

### Parallel Agents — Never Sequential If You Can Help It

```
For multi-step tasks: spawn ALL independent agents at once in a SINGLE response.

Agent A → Read / Understand codebase
Agent B → Research / Look up docs
Agent C → Plan implementation
      ↓
You synthesize all results together
```

### Model Selection

| Model | When to use |
|-------|-------------|
| **Haiku** | Fast lookups, linting, unit tests |
| **Sonnet** | Standard features, refactoring |
| **Opus** | Complex architecture, deep debugging, security |

### Fork vs Fresh

| | Use when |
|--|----------|
| **Fork** (no `subagent_type`) | Agent needs your full context |
| **Fresh** (`subagent_type` set) | Independent task — save tokens |

### Research First — Then Build

```
Complex task?
  → Spawn Explore agent FIRST to understand codebase
  → Wait for findings
  → Then spawn Coder agent with the context
  → Then spawn Reviewer agent to verify
```

### Workflow: Error Fix

```
1. @munin search the error catalog
2. If found → present existing fix immediately
3. If not → fix + store the resolution
```

---

## Architecture

```
kalera-claude-code/
|-- .claude-plugin/          # Plugin manifest + marketplace
|   |-- plugin.json              # Main plugin (ECC-based, v2.0.0)
|   |-- marketplace.json         # Two plugins: ECC + Munin
|
|-- plugins/
|   |-- munin-claude-code/   # Munin memory plugin (Kalera's secret sauce)
|       |-- agents/               # @munin agent
|       |-- skills/               # munin-memory, munin-architecture, munin-error-catalog
|       |-- hooks/                # session-start, post-compact, stop, error-catalog
|       |-- .mcp.json             # Munin MCP server config
|
|-- agents/               # 31 specialized agents
|-- skills/             # 142 workflow skills
|-- commands/           # 50 slash commands
|-- rules/             # Common + 10 language ecosystems
|-- hooks/             # Production-ready hooks
|-- mcp-configs/       # MCP servers (GitHub, Supabase, Vercel, Railway, etc.)
|-- scripts/           # Node.js utilities
|-- install.sh        # One-command installer
```

---

## Credits

### Everything Claude Code
> By [Affaan Mustafa](https://github.com/affaan-m) — [github.com/affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)

50K+ stars, Anthropic x Forum Ventures hackathon winner (Sep 2025). **Kalera Claude Code is a direct fork** — all agents, skills, commands, hooks, and rules are derived from the original. We maintain an `upstream` remote to track updates.

### Munin Memory System
> By [Kalera](https://kalera.app) — [munin.kalera.app](https://munin.kalera.app)

Long-term memory system with GraphRAG. Built at [3d-era/munin-for-agents](https://github.com/3d-era/munin-for-agents).

### Claude Code Plugins Official
> [claude.ai/plugins](https://claude.ai/plugins) — frontend-design, context7, code-review, feature-dev, playwright, huggingface-skills, skill-creator, and more.

### Community Marketplaces
> `cc-marketplace` (ananddtyagi/cc-marketplace) · `parallel-agent-skills` (parallel-web/parallel-agent-skills) · `claude-hud` (jarrodwatts/claude-hud)

---

## Contributing

PRs welcome. This repo tracks upstream `affaan-m/everything-claude-code` via `git remote upstream`.

- **Upstream ECC improvements**: contribute directly to the [original repo](https://github.com/affaan-m/everything-claude-code)
- **Kalera layer** (Munin integration, install story, Kalera plugins): PRs to this repo

---

## License

MIT — Same as everything-claude-code. Munin is also MIT.
