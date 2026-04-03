---
name: munin-memory
description: Use when user mentions "search memory", "remember", "what did we do before", "check memory", "lookup", "find in memory", "memory recall", "tìm memory", or needs to access long-term project memory. Also use when starting a new task and wanting relevant context.
---

# Munin Memory Skill

## What I Do

I give every Claude Code session access to your project's long-term memory. Memories include past tasks, decisions, bugs, architecture choices — everything your team has learned.

## MCP Tools

| Tool | Purpose |
|------|---------|
| `munin_search_memories` | Semantic search with natural language query |
| `munin_retrieve_memory` | Get full memory content by exact key |
| `munin_list_memories` | Paginated list of all memories |
| `munin_store_memory` | Save new memory with auto-tagging |
| `munin_diff_memory` | Compare two versions of a memory |
| `munin_recent_memories` | Fetch most recently updated memories |

## Memory Protocol

### At Task Start
1. Call `munin_search_memories` with keywords relevant to the current task
2. Call `munin_retrieve_memory` for detailed context on promising matches
3. Present findings — DO NOT guess, verify from memory first

### At Task End
Call `munin_store_memory` with:
- **title**: Concise summary of what was done (max 80 chars)
- **content**: Detailed description including file paths, line numbers, decisions made
- **tags**: Relevant tags (e.g., `task`, `architecture`, `bug-fix`, `setup`, `decision`)

### During Bug Fixing
- Call `munin_search_memories` with error keywords first
- If found in error catalog, show the previous fix BEFORE attempting new solutions
- After fixing, update the error catalog with the new resolution

## Auto-tagging Conventions

| Tag | When to Use |
|-----|------------|
| `task` | General task-related memories |
| `architecture` | Technical architecture, system design decisions |
| `bug-fix` | Resolved bugs with root cause |
| `setup` | Configuration, environment setup |
| `decision` | Important decisions with rationale |
| `dependencies` | Library versions, package changes |
| `error-catalog` | Error patterns and their resolutions |
| `api` | API endpoints, request/response formats |

## Example Usage

### Search before starting
```
Query: "SePay integration error handling"
```
→ Finds all memories about SePay errors, fixes, and API patterns

### Store after completing task
```
munin_store_memory({
  title: "Migrate SePay webhook to async queue",
  content: "Moved SePay webhook handler from synchronous to BullMQ queue.\nFile: server/services/sepayWebhook.ts\nQueue: sepay-webhooks\nKey change: Now enqueues job, worker processes async",
  tags: ["task", "sepay", "architecture"]
})
```

## Integration with GraphRAG

Memories are automatically indexed into the knowledge graph:
- **Entities** — services, libraries, models extracted automatically
- **Relationships** — connections between components computed on store
- Search returns both raw memory content AND graph relationships
