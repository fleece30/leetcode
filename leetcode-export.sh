#!/usr/bin/env bash
# Export solved LeetCode python solutions (from leetcode.nvim) to markdown notes.
# Uses the logged-in `claude` CLI (Claude subscription) for inference; no API key needed.
# Usage: ./leetcode-export.sh [-f]   (-f = overwrite existing notes)
set -euo pipefail

SRC="${LEETCODE_SRC:-$HOME/.local/share/nvim/leetcode}"
OUT="${LEETCODE_OUT:-$HOME/leetcode}"
MODEL="${CLAUDE_MODEL:-sonnet}"
CATEGORIES="Arrays & Hashing, Two Pointers, Sliding Window, Stack, Binary Search, Linked List, Trees, Heap / Priority Queue, Backtracking, Tries, Graphs, Advanced Graphs, 1-D Dynamic Programming, 2-D Dynamic Programming, Greedy, Intervals, Math & Geometry, Bit Manipulation"
FORCE=0
[[ "${1:-}" == "-f" ]] && FORCE=1

for c in curl jq python3 claude; do command -v "$c" >/dev/null || { echo "missing: $c" >&2; exit 1; }; done
mkdir -p "$OUT"

# HTML (LeetCode problem content) -> markdown-ish text
html2md() {
python3 -c '
import sys, html, re
from html.parser import HTMLParser
class P(HTMLParser):
    def __init__(s): super().__init__(); s.o=[]; s.pre=False
    def handle_starttag(s,t,a):
        if t=="pre": s.pre=True; s.o.append("\n```\n")
        elif t=="code" and not s.pre: s.o.append("`")
        elif t=="li": s.o.append("\n- ")
        elif t in("p","ul","ol","div"): s.o.append("\n")
        elif t=="br": s.o.append("\n")
        elif t=="sup": s.o.append("^")
        elif t in("strong","b"): s.o.append("**")
    def handle_endtag(s,t):
        if t=="pre": s.pre=False; s.o.append("\n```\n")
        elif t=="code" and not s.pre: s.o.append("`")
        elif t in("p","ul","ol"): s.o.append("\n")
        elif t in("strong","b"): s.o.append("**")
    def handle_data(s,d): s.o.append(d)
p=P(); p.feed(sys.stdin.read())
t="".join(p.o).replace("\xa0"," ")
print(re.sub(r"\n{3,}","\n\n",t).strip())
'
}

fetch_problem() {  # $1 = slug
  jq -n --arg slug "$1" '{
    query: "query q($titleSlug:String!){question(titleSlug:$titleSlug){title difficulty content topicTags{name}}}",
    variables: {titleSlug: $slug}}' |
  curl -fsS https://leetcode.com/graphql \
    -H 'Content-Type: application/json' -H 'Referer: https://leetcode.com' \
    -H 'User-Agent: Mozilla/5.0' --data @-
}

ask_claude() {  # $1 = title, $2 = code ; prints JSON {strat,time,space}
  local prompt
  prompt="LeetCode problem: $1

Solution (Python):
$2

Reply with ONLY a JSON object (no code fences) with keys:
\"category\": the single best fit from exactly this list: $CATEGORIES,
\"strat\": 1-3 sentence plain-English explanation of the approach used by THIS code,
\"time\": big-O time complexity of this code, e.g. \"O(n)\",
\"space\": big-O space complexity of this code, e.g. \"O(1)\"."
  claude -p --model "$MODEL" "$prompt" </dev/null |
  sed -e '/^```/d'
}

shopt -s nullglob
files=("$SRC"/*.py)
((${#files[@]})) || { echo "No .py files in $SRC"; exit 0; }

for f in "${files[@]}"; do
  base=$(basename "$f")
  # <id>.<slug>.<lang>.py ; only python variants
  [[ "$base" =~ ^([0-9]+)\.(.+)\.(python3?|python)[0-9]*\.py$ ]] || { echo "skip (not python): $base"; continue; }
  id="${BASH_REMATCH[1]}"; slug="${BASH_REMATCH[2]}"
  out="$OUT/$(printf '%04d' "$id")-$slug.md"

  if [[ -f "$out" && $FORCE -eq 0 ]]; then echo "exists: $out"; continue; fi

  # code between the @leet markers
  code=$(sed -n '/^# @leet start/,/^# @leet end/p' "$f" | sed '1d;$d')
  if [[ -z "${code//[[:space:]]/}" ]]; then echo "skip (empty): $base"; continue; fi

  echo "processing: $id $slug"
  if ! q=$(fetch_problem "$slug") || [[ "$(jq -r '.data.question' <<<"$q")" == "null" ]]; then
    echo "  LeetCode fetch failed for $slug" >&2; continue
  fi
  title=$(jq -r '.data.question.title' <<<"$q")
  difficulty=$(jq -r '.data.question.difficulty' <<<"$q")
  tags=$(jq -r '.data.question.topicTags[].name | "- " + .' <<<"$q")
  statement=$(jq -r '.data.question.content' <<<"$q" | html2md)

  if ! ans=$(ask_claude "$title" "$code") || ! jq -e . >/dev/null 2>&1 <<<"$ans"; then
    echo "  Claude call failed for $slug" >&2; continue
  fi
  strat=$(jq -r '.strat' <<<"$ans")
  tc=$(jq -r '.time' <<<"$ans")
  sc=$(jq -r '.space' <<<"$ans")
  cat_=$(jq -r '.category' <<<"$ans")

  cat >"$out" <<EOF
---
id: $id
title: $(jq -n --arg v "$title" '$v')
difficulty: "$difficulty"
category: $(jq -n --arg v "$cat_" '$v')
---

# $id. $title

**Difficulty:** $difficulty

$statement

## Tags

$tags

## Strat

$strat

## Complexity

- Time: $tc
- Space: $sc

## Code

\`\`\`python
$code
\`\`\`
EOF
  echo "  wrote $out"
done

# ---- README.md: solved-problem index grouped by category ----
python3 - "$OUT" <<'PY'
import sys, os, re, json
out = sys.argv[1]
order = ["Arrays & Hashing","Two Pointers","Sliding Window","Stack","Binary Search","Linked List","Trees",
         "Heap / Priority Queue","Backtracking","Tries","Graphs","Advanced Graphs","1-D Dynamic Programming",
         "2-D Dynamic Programming","Greedy","Intervals","Math & Geometry","Bit Manipulation"]
icon = {"Easy":"🟢","Medium":"🟠","Hard":"🔴"}
rank = {"Easy":0,"Medium":1,"Hard":2}
items = []
for f in sorted(os.listdir(out)):
    if not f.endswith(".md") or f == "README.md": continue
    txt = open(os.path.join(out, f)).read()
    m = re.match(r"---\n(.*?)\n---\n", txt, re.S)
    if not m: continue
    meta = {}
    for line in m.group(1).splitlines():
        k, _, v = line.partition(": ")
        try: meta[k] = json.loads(v)
        except Exception: meta[k] = v
    meta["file"] = f
    items.append(meta)

count = {d: sum(1 for i in items if i.get("difficulty") == d) for d in icon}
L = ["# Leetcode prep!", "", "Collection of leetcode problems solved for interview prep!", "",
     "Problems solved:", ""]
L += [f"- {icon[d]} {d}: {count[d]}" for d in icon]
cats = [c for c in order if any(i.get("category") == c for i in items)]
cats += sorted({i.get("category") for i in items} - set(order) - {None})
for c in cats:
    rows = sorted((i for i in items if i.get("category") == c),
                  key=lambda i: (rank.get(i.get("difficulty"), 9), int(i.get("id", 0))))
    L += ["", f"## {c}", "", "| Done | Problem | Difficulty | Solution Link |", "|:-:|---|:-:|---|"]
    for i in rows:
        L.append(f"| ✅ | {i['title']} | {icon.get(i.get('difficulty'), '')} | [Solution]({i['file'].replace(' ', '%20')}) |")
open(os.path.join(out, "README.md"), "w").write("\n".join(L) + "\n")
print(f"wrote {out}/README.md ({len(items)} problems)")
PY
