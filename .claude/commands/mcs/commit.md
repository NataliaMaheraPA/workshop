---
description: Verified commit with a meaningful message
---

Before committing:

1. Run `bash .claude/scripts/check-slides.sh` and stop if it fails
2. Read the diff — do not commit blind
3. Open `index.html` in the browser and confirm the changed slides render

Then write the message. Describe what changed for the audience of the deck,
not which lines moved. One subject line, no body unless the change needs a why.

No `Co-Authored-By` trailer and no "generated with" line — the message is the
message and nothing else.

Never commit `.claude/settings.local.json` or `CLAUDE.local.md`.
