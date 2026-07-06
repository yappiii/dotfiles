# :rice: dotfiles

```bash
$ brew install chezmoi

$ chezmoi init git@github.com:yappiii/dotfiles.git
```

## Shared Skills

This repository now keeps reusable AI skills in a single shared source and distributes them to both Codex and Claude through `chezmoi`.

- Shared source: `src/.chezmoitemplates/skills/common/<skill-name>/`
- Codex target: `src/dot_agents/skills/<skill-name>/`
- Claude target: `src/dot_claude/skills/<skill-name>/`

The target-side files are thin `.tmpl` wrappers that `include` the shared source, so the skill body is edited in one place only.

### Current common skills

- `japanese-technical-writing`

### Notes

- General-purpose skills belong in the shared source and can be shipped to both agents.
- Project-specific skills should stay in the target repository that needs them.
- Imported ideas should be rewritten into original wording and structure unless the upstream license clearly permits verbatim reuse.
