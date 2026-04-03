# Kalera Claude Code

> **The complete Claude Code toolkit — everything-claude-code foundation + Munin long-term memory system.**

[![Stars](https://img.shields.io/github/stars/3d-era/kalera-claude-code?style=flat)](https://github.com/3d-era/kalera-claude-code/stargazers)
[![MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

## What Is This?

**Kalera Claude Code** is a production-ready Claude Code plugin that combines:

- ✅ **Everything Claude Code** — [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code) (50K+ stars, Anthropic hackathon winner). Battle-tested agents, skills, hooks, rules, and commands across 10+ languages.
- ✅ **Munin Memory System** — Long-term memory with GraphRAG, automatic session context loading, error catalog, and per-project memory.

One installer. Everything you need.

---

## Features

### From Everything Claude Code (by [Affaan Mustafa](https://x.com/affaanmustafa))

| Category | Count | Examples |
|----------|-------|---------|
| **Agents** | 31 | `code-reviewer`, `security-reviewer`, `build-error-resolver`, language-specific reviewers |
| **Skills** | 142 | `tdd-workflow`, `security-review`, `api-design`, `docker-patterns`, `python-patterns`, etc. |
| **Commands** | 50 | `/multi-plan`, `/multi-execute`, `/prp-*` workflow, `/loop-*`, `/prompt-optimize` |
| **Rules** | 75+ | Common rules + TypeScript, Python, Go, Java, Kotlin, C++, Rust, Swift, PHP |
| **Hooks** | 20+ | PreToolUse, PostToolUse, Stop, SessionEnd |

### From Munin Memory System

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
3. Add to your project `.env`:

```bash
echo "MUNIN_PROJECT=proj_your_id" >> .env
```

Without this, Munin features won't work (everything else still works).

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

### Step 3 — Verify

```bash
# Munin auto-loads context on every session
# Try: @munin what were we working on last time?
```

---

## Credits

### Everything Claude Code
> By [Affaan Mustafa](https://github.com/affaan-m) — [github.com/affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)

50K+ stars, Anthropic x Forum Ventures hackathon winner (Sep 2025). This repo is a **direct fork** — all agents, skills, commands, hooks, and rules are derived from the original. Kalera Claude Code removes conflicts, adds Munin memory, and maintains a `upstream` remote to track updates.

### Munin Memory System
> By [Kalera / 3D-Era](https://kalera.app) — [munin.kalera.app](https://munin.kalera.app)

Long-term memory system with GraphRAG. Built as a plugin at [3d-era/munin-for-agents](https://github.com/3d-era/munin-for-agents).

---

## What's Inside

```
kalera-claude-code/
|-- .claude-plugin/          # Plugin manifest + marketplace
|   |-- plugin.json              # Main plugin (ECC-based, v2.0.0)
|   |-- marketplace.json         # Two plugins: ECC + Munin
|
|-- plugins/
|   |-- munin-claude-code/   # Munin memory plugin (embedded)
|       |-- agents/               # @munin agent
|       |-- skills/               # munin-memory, munin-architecture, munin-error-catalog
|       |-- hooks/                # session-start, post-compact, stop, error-catalog
|       |-- .mcp.json             # Munin MCP server config
|
|-- agents/               # 31 specialized agents
|-- skills/              # 142 workflow skills
|-- commands/            # 50 slash commands
|-- rules/               # Common + 10 language ecosystems
|-- hooks/               # Production-ready hooks (session, quality, security)
|-- mcp-configs/         # MCP servers (GitHub, Supabase, Vercel, Railway, etc.)
|-- scripts/             # Node.js utilities
|-- install.sh           # One-command installer
```

---

## Agents (31)

Language reviewers: `typescript-reviewer`, `python-reviewer`, `go-reviewer`, `java-reviewer`, `kotlin-reviewer`, `rust-reviewer`, `cpp-reviewer`, `csharp-reviewer`, `flutter-reviewer`, `dart-reviewer`

Build resolvers: `go-build-resolver`, `java-build-resolver`, `kotlin-build-resolver`, `rust-build-resolver`, `cpp-build-resolver`, `dart-build-resolver`, `pytorch-build-resolver`

Specialized: `code-reviewer`, `security-reviewer`, `database-reviewer`, `build-error-resolver`, `refactor-cleaner`, `doc-updater`, `docs-lookup`, `gan-planner`, `gan-generator`, `gan-evaluator`, `opensource-forker`, `opensource-packager`, `opensource-sanitizer`, `performance-optimizer`, `healthcare-reviewer`

---

## MCP Servers Available

GitHub · Supabase · Vercel · Railway · Firecrawl · Exa Search · Sequential Thinking · Cloudflare (Workers, Observability) · ClickHouse · Confluence · Fal.ai · Browserbase · Devfleet · Magic UI

---

## Contributing

This repo maintains a `upstream` remote to [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code). PRs that improve the Kalera layer (Munin integration, install story) are welcome. For upstream ECC improvements, please contribute directly to the original repo.

---

## License

MIT — Same as everything-claude-code. Munin is also MIT.
