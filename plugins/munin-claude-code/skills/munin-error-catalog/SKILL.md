---
name: munin-error-catalog
description: Use when errors, bugs, exceptions, crashes, or failures appear. Also use when user mentions "bug", "lỗi", "crash", "doesn't work", "how to fix", or is troubleshooting. Store every bug fix in the error catalog.
---

# Munin Error Catalog Skill

## What I Do

I search for previously encountered errors and their resolutions before suggesting new fixes. Every bug fixed is a lesson learned — I make sure it's remembered.

## MCP Tools

| Tool | Purpose |
|------|---------|
| `munin_search_memories` | Search error catalog with error keywords |
| `munin_store_memory` | Store new error + resolution after fixing |
| `munin_retrieve_memory` | Get full details of a specific error fix |

## Error Catalog Protocol

### On Error Encounter
1. Call `munin_search_memories` with error keywords (error message, error code, module name)
2. If found in catalog → present the previous resolution FIRST, before trying new fixes
3. If NOT found → attempt to fix, then **store the new error + resolution**

### On Successful Fix
Always call `munin_store_memory` with:
```
munin_store_memory({
  title: "{Error Summary} — {date}",
  content: |
    Error: {exact error message or stack trace excerpt}
    Root Cause: {what caused it}
    Fix: {how it was resolved}
    File: {file path and line numbers}
  tags: ["error-catalog", "{subsystem}"]
})
```

### Example Error Memory
```
Title: "MongoDB E11000 duplicate key on memory insert — 2026-03-15"
Content: |
  Error: E11000 duplicate key error collection: memories index: key_1 dup key
  Root Cause: Two concurrent requests tried to store memory with same key
  Fix: Added retry logic with exponential backoff in munin_store_memory
  File: server/services/memoryService.ts:L89-102
Tags: ["error-catalog", "mongodb", "concurrency"]
```

## Error Severity Classification

| Severity | Tag | Example |
|----------|-----|---------|
| Critical | `error-catalog-critical` | Data loss, security breach |
| High | `error-catalog-high` | Feature broken, data corruption |
| Medium | `error-catalog` | Non-critical, workaround exists |
| Low | `error-catalog-low` | UI glitch, cosmetic issue |

## Cross-Project Error Intelligence

- Errors tagged with generic labels (e.g., `mongodb`, `redis`, `typescript`) are searchable across all projects
- When encountering a library error, search with just the library name + error code
- Pattern matching: if 3+ projects have the same error, it's surfaced as a "common issue"

## Pre-fix Checklist

Before attempting to fix a new error:
- [ ] Search error catalog (error message + subsystem)
- [ ] Check if similar error exists with different wording
- [ ] Verify current dependency versions
- [ ] Store the new error immediately after fixing (never skip!)
