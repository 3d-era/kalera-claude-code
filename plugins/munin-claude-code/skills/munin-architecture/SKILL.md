---
name: munin-architecture
description: Use when discussing "architecture", "tech stack", "system design", "kiến trúc", "thiết kế", "cấu trúc project", or how components fit together. Also use when proposing or discussing technical changes.
---

# Munin Architecture Skill

## What I Do

I surface all architecture decisions, technical choices, and system design context from your project's memory. Before proposing any technical change, I check what's already been decided.

## MCP Tools

| Tool | Purpose |
|------|---------|
| `munin_search_memories` | Search architecture memories with natural language |
| `munin_retrieve_memory` | Get specific architecture decision by key |
| `munin_diff_memory` | Compare architecture versions during migrations |
| `munin_recent_memories` | Get recently updated memories for context |

## Usage Protocol

### Before Any Architecture Discussion
1. Call `munin_search_memories` with: relevant subsystem + "architecture decision"
2. Call `munin_retrieve_memory` for the canonical tech stack memory if found
3. Present existing architecture context before suggesting changes

### Before Proposing Architecture Changes
1. Search for the current implementation in memory
2. Document the **before** state (current architecture)
3. After the discussion, store the **after** state with tags `["architecture", "decision"]`

### Migration Tracking
When a migration happens:
- Store with title: `"Migrate from X to Y — {date}"`
- Tags: `["architecture", "migration", "X", "Y"]`
- Content: Include version/timeline anchors (e.g., "v1.2.3 → v2.0.0")

## Example Query Patterns

```
"api gateway architecture"
"MongoDB schema decisions"
"frontend state management architecture"
"auth system design"
"database connection pooling"
```

## GraphRAG Integration

Architecture memories feed into the entity graph:
- **Nodes**: Services (API, DB, Cache), Modules, Libraries
- **Edges**: "uses", "depends-on", "connects-to", "wraps"
- Search returns both raw memories AND extracted graph relationships

This enables questions like "which service handles authentication?" or "what does the payment service depend on?"
