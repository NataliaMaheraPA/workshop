#!/usr/bin/env bash
# PreToolUse guard: refuse to read secrets even if a permission rule slips.
# Exit 2 blocks the tool call.
set -euo pipefail

payload="$(cat)"
path="$(printf '%s' "$payload" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("tool_input",{}).get("file_path",""))' 2>/dev/null || true)"

case "$path" in
	*/.env|*/.env.*|*.pem|*.key|*/secrets/*)
		echo "blocked by hook: $path is a secret" >&2
		exit 2
		;;
esac
exit 0
