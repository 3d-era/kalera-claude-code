---
name: add-or-update-plugin-marketplace-system
description: Workflow command scaffold for add-or-update-plugin-marketplace-system in everything-claude-code.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /add-or-update-plugin-marketplace-system

Use this workflow when working on **add-or-update-plugin-marketplace-system** in `everything-claude-code`.

## Goal

Implements or refines the plugin marketplace system, including registry helpers, CLI scripts, JSON stubs, and documentation.

## Common Files

- `scripts/lib/pluginRegistry.js`
- `scripts/pluginMarketplace.js`
- `scripts/pluginInstall.js`
- `.claude-plugin/marketplaces.json`
- `.claude-plugin/installed-plugins.json`
- `tests/lib/pluginRegistry.test.js`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Edit or create scripts/lib/pluginRegistry.js for registry helpers
- Edit or create scripts/pluginMarketplace.js and/or scripts/pluginInstall.js for CLI commands
- Edit .claude-plugin/marketplaces.json and/or .claude-plugin/installed-plugins.json as stubs or for schema changes
- Update or add tests in tests/lib/pluginRegistry.test.js
- Update or create documentation in commands/plugin-marketplace.md and/or commands/plugin-install.md

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.