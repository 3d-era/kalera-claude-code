# Munin Plugin — Deployment Guide

## Distribution Options

| Method | Audience | Effort | Status |
|--------|----------|--------|--------|
| Official Claude Code Marketplace | All users | Medium (needs review) | Planned |
| GitHub Marketplace | GitHub users | Low | Ready |
| npm Package | Developers | Low | Ready |
| Local / Self-hosted | Single user | Zero | ✅ Ready |
| Git subdirectory (monorepo) | Team members | Zero | ✅ Ready |

---

## Option 1: Official Claude Code Marketplace ⭐ (Recommended)

### Prerequisites
- Public GitHub repository (`github.com/3d-era/munin`)
- Semver git tag for versioning
- Complete `plugin.json` with all required fields ✅

### Steps

**1. Tag a release:**
```bash
cd /Volumes/SysExt/Dev/Munin
git tag v1.0.0 -m "Munin Claude Code Plugin v1.0.0"
git push origin v1.0.0
```

**2. Validate the plugin:**
```bash
claude plugin validate ./munin-ecosystem/plugins/munin-claude-code
```

**3. Submit to marketplace:**
- Go to [claude.ai/settings/plugins/submit](https://claude.ai/settings/plugins/submit)
- Or [platform.claude.com/plugins/submit](https://platform.claude.com/plugins/submit)
- Fill in the form:
  - Repository: `https://github.com/3d-era/munin-for-agents`
  - Plugin path: `plugins/munin-claude-code`
  - Category: Developer Tools
  - Description: *"Long-term Memory integration for Claude Code. Qui 🐢 — your memory turtle companion."*

**4. Wait for review** (typically 1-3 business days)

### Plugin JSON Requirements (✅ Already Met)
```json
{
  "name": "munin-claude-code",
  "version": "1.0.0",
  "description": "...",
  "author": { "name": "...", "email": "..." },
  "repository": "https://github.com/3d-era/munin-for-agents",
  "license": "MIT",
  "keywords": ["memory", "graphrag", "rag", "context"]
}
```

---

## Option 2: GitHub Marketplace

If GitHub adds Claude Code plugin support in the future, the same repository structure applies.

### Requirements
- Public repo with releases
- `plugin.json` at plugin root
- Clear documentation

---

## Option 3: npm Package (Recommended for npm users)

### Why a separate npm package?
The plugin lives in a monorepo, but users who install via npm expect a standalone package.

### Steps

**1. Create a new package at `adapters/claude-code-plugin`:**

```bash
mkdir -p adapters/munin-claude-code-plugin
cd adapters/munin-claude-code-plugin
```

**2. `package.json`:**
```json
{
  "name": "@kalera/munin-claude-code-plugin",
  "version": "1.0.0",
  "description": "Munin Claude Code Plugin — Long-term Memory integration",
  "main": "plugin.json",
  "files": ["plugin.json", "hooks", "skills", "agents", "README.md"],
  "keywords": ["claude-code", "memory", "graphrag"],
  "repository": "https://github.com/3d-era/munin",
  "author": "Kalera <hoang.kal@gmail.com>",
  "license": "MIT"
}
```

**3. Publish:**
```bash
npm login
npm publish --access public
```

**4. Users install via:**
```bash
claude plugin install @kalera/munin-claude-code-plugin
# or via plugin.json source:
# "source": { "source": "npm", "package": "@kalera/munin-claude-code-plugin" }
```

---

## Option 4: Local / Self-hosted (Already ✅)

No changes needed. Users symlink or copy the plugin directory.

```bash
mkdir -p ~/.claude/plugins/marketplaces/munin-local/plugins
ln -sf /path/to/munin-ecosystem/plugins/munin-claude-code \
  ~/.claude/plugins/marketplaces/munin-local/plugins/munin-claude-code
```

---

## Option 5: Team Monorepo (Already ✅)

For teams already using the Munin monorepo — plugin is at:
```
munin-ecosystem/plugins/munin-claude-code/
```

Team members symlink:
```bash
ln -sf /path/to/munin/plugins/munin-claude-code \
  ~/.claude/plugins/marketplaces/munin/plugins/munin-claude-code
```

---

## Recommended Deployment Path

```
Current State
    │
    ▼
Step 1: Tag v1.0.0 + push to GitHub  ← Do this first
    │
    ▼
Step 2: Test local + fix any issues
    │
    ▼
Step 3: Submit to Official Marketplace
         (claude.ai/settings/plugins/submit)
    │
    ▼
Step 4 (Optional): npm package if demand exists
```

---

## Pre-flight Checklist

Before publishing, verify:

- [x] `plugin.json` has all required fields (name, version, description, author, repository, license)
- [x] `hooks.json` uses new schema format (not Format B/deprecated)
- [x] `README.md` is production-focused (not dev-focused)
- [x] Default `baseUrl` is `https://munin.kalera.dev` (production)
- [x] Hook scripts are executable and syntax-correct
- [x] `MUNIN_BASE_URL` env var is supported for self-hosted
- [x] Build passes (`npm run build` → 0 errors)
- [x] Git tag exists: `git tag v1.0.0 && git push origin v1.0.0`
- [x] GitHub repo is public

---

## Versioning Strategy

Use semver for git tags:

| Tag | Meaning |
|-----|---------|
| `v1.0.0` | Initial production release |
| `v1.1.0` | New feature (e.g., new hook, new skill) |
| `v1.0.1` | Bug fix |
| `v2.0.0` | Breaking change |

Marketplace will resolve `latest` tag automatically from git tags.

---

## Links

| Action | URL |
|--------|-----|
| Submit to Official Marketplace | [claude.ai/settings/plugins/submit](https://claude.ai/settings/plugins/submit) |
| Submit to Console | [platform.claude.com/plugins/submit](https://platform.claude.com/plugins/submit) |
| Plugin Docs | [docs.anthropic.com/en/docs/claude-code/plugins](https://docs.anthropic.com/en/docs/claude-code/plugins) |
| Plugin Reference | [docs.anthropic.com/en/docs/claude-code/plugins-reference](https://docs.anthropic.com/en/docs/claude-code/plugins-reference) |
| Munin Website | [munin.kalera.app](https://munin.kalera.app) |
| GitHub Repo | [github.com/3d-era/munin](https://github.com/3d-era/munin) |
