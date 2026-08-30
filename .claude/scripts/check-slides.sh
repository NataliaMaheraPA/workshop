#!/usr/bin/env bash
# Перевіряє коментарі-заголовки слайдів у index.html.
#
# Дві зони, у кожної своя схема:
#   потокові слайди  -> <!-- N ——— назва -->   наскрізно 1..N, без пропусків
#   резервні         -> <!-- РN ——— назва -->  за data-backup="РN"
#
# Виходить з кодом 2 і пише в stderr, щоб агент побачив проблему й виправив.

cd "$(dirname "$0")/../.." || exit 0
[ -f index.html ] || exit 0

err=""

# --- потокові: кількість секцій без data-backup vs кількість числових коментарів
flow_sections=$(grep -cE '<section class="slide[^"]*"(?![^>]*data-backup)' index.html 2>/dev/null \
  || grep -E '<section class="slide' index.html | grep -vc 'data-backup')
flow_comments=$(grep -cE '<!-- [0-9]+ —' index.html)

if [ "$flow_sections" != "$flow_comments" ]; then
  err+="нумерація: потокових слайдів $flow_sections, коментарів <!-- N --> $flow_comments"$'\n'
fi

# --- потокові: наскрізність
gaps=$(grep -oE '<!-- [0-9]+ —' index.html | grep -oE '[0-9]+' \
  | awk 'BEGIN{p=0} {if($1!=p+1) printf "  розрив: після %d одразу %d\n", p, $1; p=$1}')
[ -n "$gaps" ] && err+="нумерація не наскрізна:"$'\n'"$gaps"$'\n'

# --- резервні: кожному data-backup="РN" потрібен свій коментар
while read -r label; do
  grep -qE "<!-- $label —" index.html || err+="резервний $label без коментаря-заголовка"$'\n'
done < <(grep -oE 'data-backup="[^"]+"' index.html | sed 's/data-backup="//;s/"//')

if [ -n "$err" ]; then
  printf '%s' "$err" >&2
  echo "правило: CLAUDE.md → «Нумерація слайдів». Після вставки/видалення перенумеруй усі коментарі з початку." >&2
  exit 2
fi
exit 0
