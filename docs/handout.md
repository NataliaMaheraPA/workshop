# Claude Code: від інтуїції до системи

Посилання й команди з воркшопу.

## Посилання

| Посилання | Що це |
|---|---|
| [claude.com/plugins/claude-code-setup](https://claude.com/plugins/claude-code-setup) | офіційний плагін Anthropic: аудит вашого сетапу |
| [skills.sh/vercel-labs/skills/find-skills](https://www.skills.sh/vercel-labs/skills/find-skills) | скіл `find-skills`: агент сам знаходить і ставить потрібне |
| [skills.sh/mattpocock/skills/grill-me](https://www.skills.sh/mattpocock/skills/grill-me) | скіл `/grill-me`: допит по плану, раундами |
| [github.com/figma/mcp-server-guide](https://github.com/figma/mcp-server-guide) | гайд Figma: правила MCP для Cursor і Claude |
| [github.com/upstash/context7](https://github.com/upstash/context7) | MCP: актуальні доки бібліотек у сесію |
| [mcp.mdn.mozilla.net](https://mcp.mdn.mozilla.net/) | MCP: веб-платформа — DOM, CSS, сумісність браузерів |
| [skills.sh](https://www.skills.sh/) | каталог відкритих скілів з рейтингом |

## Вбудовані команди Claude Code

| Команда | Що робить |
|---|---|
| `/skills` | усі доступні скіли: звідки кожен і скільки контексту їсть |
| `/doctor` | чим ви не користуєтесь і скільки це коштує |
| `/fewer-permission-prompts` | зібрати allow із ваших транскриптів |
| `/clear` | почати з чистого контексту |
| `/fork` | копія розмови в окремій сесії |
| `/btw` | питання «на полях», поки агент працює |

## Файли сетапу

| Файл | Роль |
|---|---|
| `CLAUDE.md` | у кожен запит; кожен рядок має змінювати поведінку |
| `CLAUDE.local.md` | особисте, у `.gitignore` |
| `.claude/settings.json` | командні дозволи: allow / ask / deny |
| `.claude/settings.local.json` | ваші MCP-дозволи й середовище |
| `.claude/commands/` | свої команди; підтека дає префікс |
| `.claude/skills/` | проєктні скіли; user-рівень перекриває їх |
| `.claude/rules/` | правила, на які посилається CLAUDE.md |
| `.mcp.json` | MCP-сервери проєкту |
| `~/.claude/skills/` | глобальний шар, який ви приносите з собою |

## Figma MCP

| Крок | Деталь |
|---|---|
| `Figma Desktop` | MCP-сервер живе в програмі, не в браузері |
| `Dev Mode` / `Full seat` | далі в панелі `Inspect` увімкнути MCP |
| `Copy frame link` → `Paste to agent` | посилання на конкретний фрейм із `node-id` |
| `figma-to-code.md` | свої правила: `.cursor/rules` або `.claude/skills` |

---

PettersonApps · матеріали воркшопу
