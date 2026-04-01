---
name: everything-claude-code-conventions
description: Development conventions and patterns for everything-claude-code. JavaScript project with conventional commits.
---

# Everything Claude Code Conventions

> Generated from [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code) on 2026-04-01

## Overview

This skill teaches Claude the development patterns and conventions used in everything-claude-code.

## Tech Stack

- **Primary Language**: JavaScript
- **Architecture**: hybrid module organization
- **Test Location**: separate

## When to Use This Skill

Activate this skill when:
- Making changes to this repository
- Adding new features following established patterns
- Writing tests that match project conventions
- Creating commits with proper message format

## Commit Conventions

Follow these commit message conventions based on 500 analyzed commits.

### Commit Style: Conventional Commits

### Prefixes Used

- `fix`
- `feat`
- `docs`
- `chore`

### Message Guidelines

- Average message length: ~56 characters
- Keep first line concise and descriptive
- Use imperative mood ("Add feature" not "Added feature")


*Commit message example*

```text
refactor: simplify redundant checks; normalize getInstalledPlugin inputs
```

*Commit message example*

```text
fix: preserve file permissions in writeJsonAtomic
```

*Commit message example*

```text
style: apply linter formatting to pluginRegistry.js
```

*Commit message example*

```text
chore: update yarn.lock
```

*Commit message example*

```text
feat(plugin): add marketplace add/install system
```

*Commit message example*

```text
fix: ship marketplaces.json as empty stub to prevent duplicate-add error
```

*Commit message example*

```text
fix: normalize lookups, atomic writes, reject empty marketplace specifier
```

*Commit message example*

```text
refactor: extract shared readJsonFile helper; fix single-dash flag parsing
```

## Architecture

### Project Structure: Single Package

This project uses **hybrid** module organization.

### Configuration Files

- `.github/workflows/ci.yml`
- `.github/workflows/maintenance.yml`
- `.github/workflows/monthly-metrics.yml`
- `.github/workflows/release.yml`
- `.github/workflows/reusable-release.yml`
- `.github/workflows/reusable-test.yml`
- `.github/workflows/reusable-validate.yml`
- `.opencode/package.json`
- `.opencode/tsconfig.json`
- `.prettierrc`
- `eslint.config.js`
- `package.json`

### Guidelines

- This project uses a hybrid organization
- Follow existing patterns when adding new code

## Code Style

### Language: JavaScript

### Naming Conventions

| Element | Convention |
|---------|------------|
| Files | camelCase |
| Functions | camelCase |
| Classes | PascalCase |
| Constants | SCREAMING_SNAKE_CASE |

### Import Style: Relative Imports

### Export Style: Mixed Style


*Preferred import style*

```typescript
// Use relative imports
import { Button } from '../components/Button'
import { useAuth } from './hooks/useAuth'
```

## Testing

### Test Framework

No specific test framework detected — use the repository's existing test patterns.

### File Pattern: `*.test.js`

### Test Types

- **Unit tests**: Test individual functions and components in isolation
- **Integration tests**: Test interactions between multiple components/services

### Coverage

This project has coverage reporting configured. Aim for 80%+ coverage.


## Error Handling

### Error Handling Style: Try-Catch Blocks


*Standard error handling pattern*

```typescript
try {
  const result = await riskyOperation()
  return result
} catch (error) {
  console.error('Operation failed:', error)
  throw new Error('User-friendly message')
}
```

## Common Workflows

These workflows were detected from analyzing commit patterns.

### Feature Development

Standard feature implementation workflow

**Frequency**: ~14 times per month

**Steps**:
1. Add feature implementation
2. Add tests for feature
3. Update documentation

**Files typically involved**:
- `.opencode/*`
- `.opencode/plugins/*`
- `.opencode/plugins/lib/*`
- `**/*.test.*`

**Example commit sequence**:
```
feat(team-builder): use `claude agents` command for agent discovery (#1021)
fix: extract inline SessionStart bootstrap to separate file (#1035)
feat: add hexagonal architecture SKILL. (#1034)
```

### Add New Command Or Agentic Workflow

Adds a new command or agentic workflow to the system, often including new .md command files, agent definitions, and skill orchestrators.

**Frequency**: ~3 times per month

**Steps**:
1. Create one or more new command markdown files in commands/ (e.g., gan-build.md, santa-loop.md, prp-*.md)
2. Add or update agent definitions in agents/ (e.g., gan-generator.md, opensource-forker.md)
3. Add or update skill orchestrator in skills/ (e.g., skills/gan-style-harness/SKILL.md, skills/opensource-pipeline/SKILL.md)
4. Optionally add shell orchestrators or scripts (e.g., scripts/gan-harness.sh)
5. Optionally add documentation or examples

**Files typically involved**:
- `commands/*.md`
- `agents/*.md`
- `skills/*/SKILL.md`
- `scripts/*.sh`
- `examples/*`

**Example commit sequence**:
```
Create one or more new command markdown files in commands/ (e.g., gan-build.md, santa-loop.md, prp-*.md)
Add or update agent definitions in agents/ (e.g., gan-generator.md, opensource-forker.md)
Add or update skill orchestrator in skills/ (e.g., skills/gan-style-harness/SKILL.md, skills/opensource-pipeline/SKILL.md)
Optionally add shell orchestrators or scripts (e.g., scripts/gan-harness.sh)
Optionally add documentation or examples
```

### Add Or Update Plugin Marketplace System

Implements or refines the plugin marketplace system, including registry helpers, CLI scripts, JSON stubs, and documentation.

**Frequency**: ~2 times per month

**Steps**:
1. Edit or create scripts/lib/pluginRegistry.js for registry helpers
2. Edit or create scripts/pluginMarketplace.js and/or scripts/pluginInstall.js for CLI commands
3. Edit .claude-plugin/marketplaces.json and/or .claude-plugin/installed-plugins.json as stubs or for schema changes
4. Update or add tests in tests/lib/pluginRegistry.test.js
5. Update or create documentation in commands/plugin-marketplace.md and/or commands/plugin-install.md
6. Optionally update root docs (README.md, AGENTS.md, etc.)

**Files typically involved**:
- `scripts/lib/pluginRegistry.js`
- `scripts/pluginMarketplace.js`
- `scripts/pluginInstall.js`
- `.claude-plugin/marketplaces.json`
- `.claude-plugin/installed-plugins.json`
- `tests/lib/pluginRegistry.test.js`
- `commands/plugin-marketplace.md`
- `commands/plugin-install.md`
- `README.md`
- `AGENTS.md`

**Example commit sequence**:
```
Edit or create scripts/lib/pluginRegistry.js for registry helpers
Edit or create scripts/pluginMarketplace.js and/or scripts/pluginInstall.js for CLI commands
Edit .claude-plugin/marketplaces.json and/or .claude-plugin/installed-plugins.json as stubs or for schema changes
Update or add tests in tests/lib/pluginRegistry.test.js
Update or create documentation in commands/plugin-marketplace.md and/or commands/plugin-install.md
Optionally update root docs (README.md, AGENTS.md, etc.)
```

### Add New Install Target Or Adaptation

Adds a new install target (e.g., Gemini, CodeBuddy) to the system, including scripts, schemas, and tests.

**Frequency**: ~2 times per month

**Steps**:
1. Add new install scripts and docs under a dedicated directory (e.g., .gemini/, .codebuddy/)
2. Update manifests/install-modules.json to register the new target
3. Update or add schema files (schemas/ecc-install-config.schema.json, schemas/install-modules.schema.json)
4. Edit or add scripts/lib/install-manifests.js and scripts/lib/install-targets/*.js for logic
5. Add or update tests in tests/lib/install-targets.test.js
6. Update documentation (README.md, .gemini/GEMINI.md, etc.)

**Files typically involved**:
- `.gemini/*`
- `.codebuddy/*`
- `manifests/install-modules.json`
- `schemas/ecc-install-config.schema.json`
- `schemas/install-modules.schema.json`
- `scripts/lib/install-manifests.js`
- `scripts/lib/install-targets/*.js`
- `tests/lib/install-targets.test.js`
- `README.md`

**Example commit sequence**:
```
Add new install scripts and docs under a dedicated directory (e.g., .gemini/, .codebuddy/)
Update manifests/install-modules.json to register the new target
Update or add schema files (schemas/ecc-install-config.schema.json, schemas/install-modules.schema.json)
Edit or add scripts/lib/install-manifests.js and scripts/lib/install-targets/*.js for logic
Add or update tests in tests/lib/install-targets.test.js
Update documentation (README.md, .gemini/GEMINI.md, etc.)
```

### Add Or Update Hook Or Session Management

Implements or refines hooks and session management logic, including accumulator patterns, session start/end, and related tests.

**Frequency**: ~2 times per month

**Steps**:
1. Edit or create scripts/hooks/*.js for hook logic (e.g., post-edit-accumulator.js, stop-format-typecheck.js, session-start.js)
2. Update hooks/hooks.json for hook configuration
3. Add or update tests in tests/hooks/*.test.js
4. Optionally update shell scripts (scripts/hooks/*.sh)
5. Optionally update adapters (.cursor/hooks/after-file-edit.js)

**Files typically involved**:
- `scripts/hooks/*.js`
- `hooks/hooks.json`
- `tests/hooks/*.test.js`
- `scripts/hooks/*.sh`
- `.cursor/hooks/after-file-edit.js`

**Example commit sequence**:
```
Edit or create scripts/hooks/*.js for hook logic (e.g., post-edit-accumulator.js, stop-format-typecheck.js, session-start.js)
Update hooks/hooks.json for hook configuration
Add or update tests in tests/hooks/*.test.js
Optionally update shell scripts (scripts/hooks/*.sh)
Optionally update adapters (.cursor/hooks/after-file-edit.js)
```

### Add Or Update Skill Or Agent

Adds or updates a skill or agent definition, often including a new SKILL.md and/or agent .md, sometimes with supporting config.

**Frequency**: ~2 times per month

**Steps**:
1. Create or edit skills/*/SKILL.md
2. Create or edit agents/*.md
3. Optionally update mcp-configs/mcp-servers.json or other config files
4. Optionally update AGENTS.md or related documentation

**Files typically involved**:
- `skills/*/SKILL.md`
- `agents/*.md`
- `mcp-configs/mcp-servers.json`
- `AGENTS.md`

**Example commit sequence**:
```
Create or edit skills/*/SKILL.md
Create or edit agents/*.md
Optionally update mcp-configs/mcp-servers.json or other config files
Optionally update AGENTS.md or related documentation
```

### Dependabot Or Automated Dependency Update

Automated workflow to update dependencies via Dependabot or similar, touching lockfiles and workflow YAMLs.

**Frequency**: ~4 times per month

**Steps**:
1. Update package.json and/or yarn.lock
2. Update .github/workflows/*.yml as needed for new dependency versions
3. Commit with a standardized message referencing the dependency and version

**Files typically involved**:
- `package.json`
- `yarn.lock`
- `.github/workflows/*.yml`

**Example commit sequence**:
```
Update package.json and/or yarn.lock
Update .github/workflows/*.yml as needed for new dependency versions
Commit with a standardized message referencing the dependency and version
```


## Best Practices

Based on analysis of the codebase, follow these practices:

### Do

- Use conventional commit format (feat:, fix:, etc.)
- Follow *.test.js naming pattern
- Use camelCase for file names
- Prefer mixed exports

### Don't

- Don't write vague commit messages
- Don't skip tests for new features
- Don't deviate from established patterns without discussion

---

*This skill was auto-generated by [ECC Tools](https://ecc.tools). Review and customize as needed for your team.*
