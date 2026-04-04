# Changelog

All notable changes to **Kalera Claude Code** are documented here.

## [2.0.0-kalera] — 2026-04-04

### Added
- **Munin Memory Plugin** embedded at `plugins/munin-claude-code/` (agents, skills, hooks, MCP config)
- **`install.sh`** — One-command installer with conflict detection + auto-fix, SHA256 integrity verification
- **`README.vi.md`** — Vietnamese translation
- **`Dockerfile`** — Zero-to-install test container
- **Marketplace** `3d-era/kalera-claude-code` with two plugins: `kalera-claude-code` + `munin-claude-code`
- **`--yes` / `--dry-run` / `--verbose` / `--no-verify`** CLI flags for install.sh
- **`trap` cleanup** on EXIT/INT/TERM — prevents orphan temp directories on interrupt
- **Rules backup** — existing `~/.claude/rules/` files backed up as `.kalera.bak` before overwrite

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
- **Plugin name in marketplace.json**: `everything-claude-code` → `kalera-claude-code`
- **`marketplace` name**: `kalera-cc` → `3d-era/kalera-claude-code` (GitHub repo path)

### Security
- SHA256 pinned integrity check for `curl | bash` install pattern — MITM mitigation
- `trap cleanup EXIT/INT/TERM` — prevents temp directory leaks on Ctrl+C or crash
- `chmod 700` on `mktemp -d` temp directories — explicit permission hardening
- Conflict detection: auto-fixes or warns about duplicate plugin/MCP installations
- E2EE memory: Munin supports end-to-end encrypted storage via Hash Key
- Plugin uninstall errors now captured and displayed (no silent `|| true` swallowing)
- `select` loop guard (max 10 attempts) — prevents infinite loops on invalid input

### Fixed (install.sh)
- Plugin marketplace name: `kalera-cc` → `3d-era/kalera-claude-code`
- Plugin install name: `everything-claude-code` → `kalera-claude-code` (matches marketplace.json)
- Distinct error messages: rc=2 (not found) / rc=3 (already installed) / other (real failure)
- `git clone` and `mktemp -d` exit codes now validated with explicit error messages
- Munin install: fallback to `munin-claude-code@munin-ecosystem` marketplace if primary fails

---

<!-- upstream ECC changelog below -->

## [1.9.0] - 2026-03-20

### Highlights

- Selective install architecture with manifest-driven pipeline and SQLite state store.
- Language coverage expanded to 10+ ecosystems with 6 new agents and language-specific rules.
- Observer reliability hardened with memory throttling, sandbox fixes, and 5-layer loop guard.
- Self-improving skills foundation with skill evolution and session adapters.
