---
description: Pre-PR checklist for this deck
---

Review the current diff against the rules in `CLAUDE.md`.

Check, in this order:

1. Slide comments `<!-- N ——— title -->` are sequential with no gaps
2. No inline `style=""` was added to new elements
3. No new font size was invented — every size comes from the type scale
4. Every `mini-head` that introduces a list or table ends with a colon
5. Accent lists use `ul.star-list`, not the default bullet
6. Highlighted files in the file tree are `--claude-clay`, never green or blue

Report only what actually breaks a rule. Do not restate what is already correct.
