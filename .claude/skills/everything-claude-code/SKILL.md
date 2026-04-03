```markdown
# everything-claude-code Development Patterns

> Auto-generated skill from repository analysis

## Overview
This skill teaches the core development patterns and conventions used in the `everything-claude-code` repository. The codebase is written in TypeScript and follows a consistent set of coding standards, including file naming, import/export styles, and commit message conventions. It also outlines the approach to testing and provides suggested commands for common workflows.

## Coding Conventions

### File Naming
- **Pattern:** PascalCase
- **Example:**  
  ```plaintext
  MyComponent.ts
  UserService.ts
  ```

### Import Style
- **Pattern:** Relative imports
- **Example:**
  ```typescript
  import { UserService } from './UserService';
  import { calculateSum } from '../utils/MathUtils';
  ```

### Export Style
- **Pattern:** Named exports
- **Example:**
  ```typescript
  // In UserService.ts
  export function getUser(id: string) { ... }
  export const USER_ROLE = 'admin';
  ```

### Commit Message Convention
- **Type:** Conventional commits
- **Prefixes:** `docs`
- **Example:**
  ```
  docs: update README with installation instructions
  ```

## Workflows

### Documentation Updates
**Trigger:** When updating or improving documentation files.
**Command:** `/update-docs`

1. Make changes to documentation files (e.g., README.md, SKILL.md).
2. Use a conventional commit message with the `docs` prefix.
   - Example: `docs: clarify usage instructions in README`
3. Push your changes to the repository.

## Testing Patterns

- **Framework:** Unknown (not detected)
- **File Pattern:** Test files follow the `*.test.*` naming convention.
- **Example:**
  ```plaintext
  UserService.test.ts
  MathUtils.test.ts
  ```
- **General Approach:** Place test files alongside or near the source files they test, using the `.test.` infix.

## Commands
| Command        | Purpose                                         |
|----------------|-------------------------------------------------|
| /update-docs   | Run the documentation update workflow           |
```
