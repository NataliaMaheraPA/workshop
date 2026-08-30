# CLAUDE.md

Notes for Claude Code in this repo. Every line must change behaviour.

The deck itself — slides and speaker notes in `index.html` — is written in
Ukrainian and stays that way. Everything else (config, commands, rules,
descriptions) is English.

## The main rule

All styling lives in classes inside the `<style>` block of `index.html`.
Do not add inline `style=""` to new elements and do not invent new font sizes —
take a class from the table below. If the class you need does not exist, add it
next to its relatives first, then use it.

## Text hierarchy on a slide

Top to bottom, and which class does what:

| What | Class | Size and colour |
|---|---|---|
| Part crumb | `p.part-crumb` | 0.75rem, uppercase, `частина I` and dash — `--claude-clay` |
| Slide heading | `h2` after the crumb | `clamp(1.5rem, 3.4vw, 2.25rem)`, `rgba(255,255,255,0.82)` |
| Subheading | `p.lede.subhead` | 24px, weight 400, `--muted` |
| Block mini-heading | `p.mini-head` | `clamp(1.0625rem, 1.9vw, 1.25rem)`, weight 700, white |
| Large note | `p.note.note--lg` | 19px, `--muted`, `code` inside is the same size |
| Regular note | `p.note` | 0.9375rem, `--subtle` |

**A mini-heading that introduces a list or a table ends with a colon.**

The full part heading (`.part-heading` with a large `h2`) appears **only on the
first slide of a block**. Every other slide in the part carries a muted crumb:

```html
<p class="part-crumb"><span class="part-label">частина <span class="roman">I</span></span> <span class="part-dash">—</span> Нюанси сетапу проєкту</p>
```

## Lists

- Accent list (not the default bullet square) → class `ul.star-list`.
  The marker is the clay Claude asterisk already used on the certification
  slide (`.slide--cert ul li::before`): three crossing strokes, colour
  `--claude-clay`. Not a unicode star, not a dot — use that exact SVG so every
  accent list in the deck looks the same.
- A single statement line before a table is **not** a list item — use `p.mini-head`.

## Tables and code

- `table.matrix` stretches to 54rem. When the content is short the grey rules
  hang in empty space — shorten it: `matrix--narrow` (36rem) for short labels,
  `matrix--mid` (46rem) where the second column wraps to two lines.
- `pre` also stretches to the full column by default. For trees and short
  listings use `pre--fit` (shrinks to content) or `pre--xs` (smaller font + fit).
- Two listings side by side (team / personal) → `div.code-pair` with a
  `p.code-label` above each. The personal label takes `code-label--local`
  (clay). An inline aside (e.g. `.gitignore`) → `span.code-label-note`.

## Diagrams

`div.diagram` with inline SVG, `viewBox="0 0 680 N"`. On slides that show the
file tree the width is capped at 50rem automatically — do not remove that rule
or the SVG will slide under the tree.

## Reveal mechanics

Two different mechanisms, do not mix them up:

| Goal | Class | Behaviour |
|---|---|---|
| Appears **right** after the heading, no click | `div.auto-cascade` | children reveal themselves: 0.35s → 0.75s → 1.1s |
| One click, content inside staggers | `div.frag-cascade` + `data-fragment` | first child immediately, then 0.3s → 0.5s |
| One click — one element | `data-fragment` | plain fragment |

**Do not put `data-fragment` on every list item** when the whole block should
come out together — wrap the block in `frag-cascade` instead.

**A mini-heading and its list are one block.** Put `p.mini-head` as the first
child inside `frag-cascade` (or `auto-cascade`), not as a separate
`data-fragment` before it. The heading then lands first and the content follows
smoothly. A separate click for the heading is not our pattern.

Cascade delays are defined up to the 4th child. More elements — add
`nth-child(N)` in the CSS, otherwise the extras reveal with no delay, ahead of
their siblings.

## Project tree on the right

Driven by attributes on `<section class="slide">`:

- `data-tree="a|b"` — files that **appear** on this slide
- `data-tree-late="a"` — the file appears not immediately but together with the
  slide's **first fragment**: when the block about it comes on screen
- `data-tree-drop="a"` — remove a path from the tree (the file was renamed)
- `data-tree-fold="a"` — collapse a folder: it stays, its contents hide.
  Accumulates — folded once, folded on every later slide
- `data-tree-mint="a|b"` — highlight what the slide is talking about right now
- `data-tree-hl="a|b"` — highlight an already present file in cream
- a path ending in `/` (`.claude/rules/`) — an empty folder
- class `slide--notree` on the section — no tree at all, even though it has
  already accumulated. Part II uses this throughout

Colour rules:

- highlighted files (`is-new`, `is-mint`) are **clay** `--claude-clay`,
  never green and never blue
- `.gitignore` is always dimmed, whatever its state

## Commits

No `Co-Authored-By` trailer. No "generated with" line. The commit message is
the message and nothing else.

Subject line in English, imperative, describing what changed for the audience
of the deck rather than which lines moved. A body only when the change needs
a why.

Never commit `.claude/settings.local.json` or `CLAUDE.local.md`.

## Slide numbering

Comments `<!-- N ——— title -->` are sequential with no gaps. After inserting or
deleting a slide, **renumber all of them** from the start. The `PostToolUse`
hook checks this and fails the edit if it drifts.

## Tone

Headings are direct and practical, like the rest of the deck: «Що не має там
лежати», «Куди мій агент іде по документацію». **No pathos, no aphorisms**
(«Документацію не переказують. На неї посилаються.» is exactly what not to do).
