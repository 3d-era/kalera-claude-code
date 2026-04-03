# CLAUDE.md — Kalera Claude Code

> **Kalera Claude Code** is a fork of [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code) (50K+ stars, Anthropic hackathon winner), with conflicts removed and Munin long-term memory integrated.

## Project Overview

This is a **Claude Code plugin** — install via the marketplace or use components directly.

- **Base**: Everything Claude Code v1.9.0 (by Affaan Mustafa)
- **Addon**: Munin Memory System v1.1.1 (by Kalera / 3D-Era)
- **Version**: 2.0.0

## Running Tests

```bash
node tests/run-all.js
node tests/lib/utils.test.js
node tests/lib/package-manager.test.js
node tests/hooks/hooks.test.js
```

## Architecture

```
kalera-claude-code/
|-- plugins/
|   |-- munin-claude-code/   # Munin memory plugin (embedded)
|
|-- agents/              # 31 specialized agents
|-- skills/             # 142 workflow skills
|-- commands/           # 50 slash commands
|-- hooks/              # Production-ready hooks
|-- rules/              # Common + 10 language ecosystems
|-- mcp-configs/        # MCP server configurations
|-- scripts/            # Node.js utilities
```

## Key Commands

- `/multi-plan`, `/multi-execute`, `/multi-workflow` — Multi-agent orchestration
- `/prp-*` — PR workflow (plan, implement, commit, PR, PRD)
- `/loop-start`, `/loop-status`, `/santa-loop` — Autonomous loop execution
- `/security-scan` — Run AgentShield security auditor
- `/prompt-optimize` — Token optimization
- `/cpp-review`, `/go-review`, `/python-review`, etc. — Language-specific review

## Skills

Skills are the primary workflow surface. Use them when working on related files.

| Category | Skills |
|----------|--------|
| **Testing** | `tdd-workflow`, `e2e-testing`, `python-testing`, `golang-testing`, `kotlin-testing` |
| **Security** | `security-review`, `security-scan`, `django-security`, `laravel-security`, `springboot-security` |
| **Patterns** | `api-design`, `coding-standards`, `docker-patterns`, `deployment-patterns` |
| **Languages** | `python-patterns`, `golang-patterns`, `java-coding-standards`, `kotlin-patterns`, `rust-patterns`, `cpp-coding-standards`, `dart-flutter-patterns`, `swiftui-patterns` |
| **Frameworks** | `frontend-patterns`, `backend-patterns`, `django-patterns`, `laravel-patterns`, `springboot-patterns`, `nestjs-patterns`, `nextjs-turbopack` |
| **Agentic** | `agentic-engineering`, `autonomous-loops`, `ai-first-engineering`, `nanoclaw-repl`, `prompt-optimizer` |
| **Research** | `deep-research`, `exa-search`, `documentation-lookup` |
| **Content** | `article-writing`, `content-engine`, `market-research`, `investor-materials` |
| **Database** | `postgres-patterns`, `clickhouse-io`, `jpa-patterns`, `database-migrations` |
| **DevOps** | `docker-patterns`, `deployment-patterns` |
| **Munin** | `munin-memory`, `munin-architecture`, `munin-error-catalog` (see plugins/munin-claude-code/skills/) |

## Rules

Always-follow guidelines for code quality. Install to `~/.claude/rules/`:

- `rules/common/` — Language-agnostic principles
- `rules/typescript/`, `rules/python/`, `rules/golang/`, `rules/java/`, `rules/kotlin/`, `rules/cpp/`, `rules/rust/`, `rules/swift/`, `rules/php/`, `rules/dart/`

## Credits

### Everything Claude Code
By [Affaan Mustafa](https://github.com/affaan-m) — MIT License
github.com/affaan-m/everything-claude-code

### Munin Memory System
By [Kalera / 3D-Era](https://kalera.app) — MIT License
github.com/3d-era/munin-for-agents | munin.kalera.app

## Contributing

PRs welcome. This repo tracks upstream `affaan-m/everything-claude-code` via `git remote upstream`.

- **Upstream ECC improvements**: contribute directly to the [original repo](https://github.com/affaan-m/everything-claude-code)
- **Kalera layer** (Munin integration, install story): PRs to this repo
