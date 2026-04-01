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

- Average message length: ~57 characters
- Keep first line concise and descriptive
- Use imperative mood ("Add feature" not "Added feature")


*Commit message example*

```text
feat: add everything-claude-code ECC bundle (.claude/commands/add-new-skill.md)
```

*Commit message example*

```text
refactor: collapse legacy command bodies into skills
```

*Commit message example*

```text
fix: dedupe managed hooks by semantic identity
```

*Commit message example*

```text
docs: close bundle drift and sync plugin guidance
```

*Commit message example*

```text
chore: ignore local orchestration artifacts
```

*Commit message example*

```text
feat: add everything-claude-code ECC bundle (.claude/commands/refactoring.md)
```

*Commit message example*

```text
feat: add everything-claude-code ECC bundle (.claude/commands/feature-development.md)
```

*Commit message example*

```text
feat: add everything-claude-code ECC bundle (.claude/enterprise/controls.md)
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

**Frequency**: ~19 times per month

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
feat: install claude-hud plugin (jarrodwatts/claude-hud) (#1041)
feat: add GAN-style generator-evaluator harness (#1029)
feat(agents,skills): add opensource-pipeline — 3-agent workflow for safe public releases (#1036)
```

### Refactoring

Code refactoring and cleanup workflow

**Frequency**: ~2 times per month

**Steps**:
1. Ensure tests pass before refactor
2. Refactor code structure
3. Verify tests still pass

**Files typically involved**:
- `src/**/*`

**Example commit sequence**:
```
refactor: collapse legacy command bodies into skills
feat: add connected operator workflow skills
feat: expand lead intelligence outreach channels
```

### Add New Skill

Adds a new skill to the repository, enabling new agent capabilities or workflows.

**Frequency**: ~4 times per month

**Steps**:
1. Create a new SKILL.md file under skills/ or .agents/skills/ or .claude/skills/
2. Optionally update documentation (AGENTS.md, README.md, WORKING-CONTEXT.md)
3. Optionally add supporting files (e.g., manifests/install-modules.json)

**Files typically involved**:
- `skills/*/SKILL.md`
- `.agents/skills/*/SKILL.md`
- `.claude/skills/*/SKILL.md`

**Example commit sequence**:
```
Create a new SKILL.md file under skills/ or .agents/skills/ or .claude/skills/
Optionally update documentation (AGENTS.md, README.md, WORKING-CONTEXT.md)
Optionally add supporting files (e.g., manifests/install-modules.json)
```

### Add Or Update Agent

Adds or updates agent definitions and registers them in configuration files.

**Frequency**: ~2 times per month

**Steps**:
1. Add or update agent definition file (e.g., agents/*.md or .opencode/prompts/agents/*.txt)
2. Update agent registry/configuration (e.g., .opencode/opencode.json, AGENTS.md)

**Files typically involved**:
- `agents/*.md`
- `.opencode/prompts/agents/*.txt`
- `.opencode/opencode.json`
- `AGENTS.md`

**Example commit sequence**:
```
Add or update agent definition file (e.g., agents/*.md or .opencode/prompts/agents/*.txt)
Update agent registry/configuration (e.g., .opencode/opencode.json, AGENTS.md)
```

### Add Or Update Command

Adds or updates command workflow files for agentic operations.

**Frequency**: ~2 times per month

**Steps**:
1. Create or update command markdown file under commands/
2. Optionally update documentation or index files

**Files typically involved**:
- `commands/*.md`

**Example commit sequence**:
```
Create or update command markdown file under commands/
Optionally update documentation or index files
```

### Feature Or Skill Bundle

Adds a bundle of related features, skills, and documentation for a new workflow or capability.

**Frequency**: ~2 times per month

**Steps**:
1. Add multiple agent and/or skill files
2. Add supporting commands and scripts
3. Add or update documentation and examples

**Files typically involved**:
- `agents/*.md`
- `skills/*/SKILL.md`
- `commands/*.md`
- `scripts/*.sh`
- `examples/*`

**Example commit sequence**:
```
Add multiple agent and/or skill files
Add supporting commands and scripts
Add or update documentation and examples
```

### Documentation Update

Updates documentation to reflect new features, workflows, or guidance.

**Frequency**: ~3 times per month

**Steps**:
1. Edit documentation files (README.md, AGENTS.md, WORKING-CONTEXT.md, docs/...)
2. Optionally update or add new guidance files

**Files typically involved**:
- `README.md`
- `AGENTS.md`
- `WORKING-CONTEXT.md`
- `docs/**/*.md`

**Example commit sequence**:
```
Edit documentation files (README.md, AGENTS.md, WORKING-CONTEXT.md, docs/...)
Optionally update or add new guidance files
```

### Dependency Or Schema Update

Updates dependencies or schema files, often in response to new features or external updates.

**Frequency**: ~2 times per month

**Steps**:
1. Edit package.json, yarn.lock, or other lockfiles
2. Edit schema files under schemas/
3. Optionally update related scripts or manifests

**Files typically involved**:
- `package.json`
- `yarn.lock`
- `schemas/*.json`

**Example commit sequence**:
```
Edit package.json, yarn.lock, or other lockfiles
Edit schema files under schemas/
Optionally update related scripts or manifests
```

### Ci Cd Workflow Update

Updates CI/CD workflow files, usually for dependency bumps or workflow improvements.

**Frequency**: ~2 times per month

**Steps**:
1. Edit workflow files under .github/workflows/

**Files typically involved**:
- `.github/workflows/*.yml`

**Example commit sequence**:
```
Edit workflow files under .github/workflows/
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
