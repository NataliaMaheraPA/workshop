---
description: Check whether CLAUDE.md still matches the deck
---

Compare `CLAUDE.md` against what `index.html` actually does.

Look for:

- Type scale values in `CLAUDE.md` that no longer match the CSS
- Classes documented but no longer used anywhere
- Classes used in the markup but missing from the docs
- Tree attributes (`data-tree*`) that exist in the JS but are undocumented

Report drift only. Do not fix anything without asking.
