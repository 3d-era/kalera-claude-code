# Changelog

All notable changes to **Kalera Claude Code** are documented here.

## [2.0.0-kalera] — 2026-04-04

### Added
- **Munin Memory Plugin** embedded at `plugins/munin-claude-code/` (agents, skills, hooks, MCP config)
- **`install.sh`** — One-command installer with conflict detection + auto-fix
- **`README.vi.md`** — Vietnamese translation
- **`Dockerfile`** — Zero-to-install test container
- **Marketplace** `kalera-cc` with two plugins: `everything-claude-code` + `munin-claude-code`

### Removed (Conflicts resolved)
- **MCP**: `memory`, `omega-memory`, `context7`, `playwright` (duplicate — Pa has official versions)
- **Commands**: `tdd`, `plan`, `code-review`, `build-fix`, `e2e`, `skill-create`, `learn`, `sessions`, `save-session`, `resume-session`, and 14 more
- **Agents**: `planner`, `architect`, `chief-of-staff`, `tdd-guide`, `e2e-runner`, `harness-optimizer`, `loop-operator`
- **Skills**: `skill-create`, `eval-harness`, `verification-loop`
- **Hooks**: `session-start`, `pre-compact` (Munin handles these)

### Changed
- **Repo renamed**: `everything-claude-code` → `kalera-claude-code`
- **Upstream remote**: tracks `affaan-m/everything-claude-code` for future updates
- **README**: Rewritten with full credits, Quick Start in 3 steps (Munin account first)
- **CLAUDE.md**: Updated with unified architecture + credits
- **README.vi.md**: Vietnamese translation added

### Security
- Conflict detection: auto-fixes or warns about duplicate plugin/MCP installations
- E2EE memory: Munin supports end-to-end encrypted storage via Hash Key

---

<!-- upstream ECC changelog below -->

## [1.9.0] - 2026-03-20

### Highlights

- Selective install architecture with manifest-driven pipeline and SQLite state store.
- Language coverage expanded to 10+ ecosystems with 6 new agents and language-specific rules.
- Observer reliability hardened with memory throttling, sandbox fixes, and 5-layer loop guard.
- Self-improving skills foundation with skill evolution and session adapters.
