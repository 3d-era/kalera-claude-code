---
name: add-new-skill-or-agent
description: Workflow command scaffold for add-new-skill-or-agent in everything-claude-code.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /add-new-skill-or-agent

Use this workflow when working on **add-new-skill-or-agent** in `everything-claude-code`.

## Goal

Adds a new skill or agent to the ECC system, including documentation and registration.

## Common Files

- `skills/{skill-name}/SKILL.md`
- `.agents/skills/{skill-name}/SKILL.md`
- `agents/{agent-name}.md`
- `.codex/agents/{agent-name}.toml`
- `manifests/install-modules.json`
- `AGENTS.md`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Create a new SKILL.md in skills/{skill-name}/ or .agents/skills/{skill-name}/
- If agent-based, add agent definition(s) in agents/{agent-name}.md or .codex/agents/{agent-name}.toml
- Update manifests/install-modules.json if the skill is installable
- Update AGENTS.md and/or README.md to reflect the new skill/agent
- If applicable, add supporting files (e.g., rules/, prompts/, or orchestration scripts)

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.