#!/usr/bin/env bash
# Pruebas del guardarraíl. Los términos se arman por partes para no escribirlos literales.
# Uso (desde cualquier carpeta del repo): bash scripts/test-forbidden-terms.sh
set -u
here="$(cd "$(dirname "$0")" && pwd)"
chk="$here/check-forbidden-terms.sh"
ok=0
bad=0

expect() { # expect <código-esperado> <descripción> <comando...>
  local want=$1 desc=$2 got
  shift 2
  "$@" >/dev/null 2>&1
  got=$?
  if [ "$got" -eq "$want" ]; then ok=$((ok + 1)); else bad=$((bad + 1)); echo "FALLA: $desc (esperado $want, salió $got)"; fi
}

msg() { # msg <texto>
  local f r
  f=$(mktemp)
  printf '%s\n' "$1" >"$f"
  "$chk" msg "$f"
  r=$?
  rm -f "$f"
  return $r
}

push_range() { # push_range <local-sha> <remote-sha>
  printf 'refs/heads/main %s refs/heads/main %s\n' "$1" "$2" | "$chk" push
}

zero=0000000000000000000000000000000000000000

# Variantes que deben rechazarse.
for t in "w""iimi" "W""IIMI" "w""iedii" "git-w""orkflow" "git_w""orkflow" "git w""orkflow" \
  "gitw""orkflow" "Git-W""orkflow" "vp-gitignore-b""uilder" "vp gitignore b""uilder" \
  "vp_gitignore_b""uilder" "vpgitignoreb""uilder"; do
  expect 1 "rechaza: $t" msg "feat: usa $t aquí"
done

# Texto limpio que debe aceptarse.
for t in "feat: add readme" "docs: git history and workflow notes" "chore: gitignore for node"; do
  expect 0 "acepta: $t" msg "$t"
done

# Falla cerrado cuando no se puede leer.
expect 1 "mensaje inexistente" "$chk" msg /ruta/que/no/existe
expect 1 "rango ilegible en push" push_range ffffffffffffffffffffffffffffffffffffffff "$zero"

# Push de un rango limpio (el HEAD actual).
head_sha=$(git rev-parse HEAD 2>/dev/null || echo "$zero")
expect 0 "push del HEAD actual limpio" push_range "$head_sha" "$zero"

echo "pruebas ok: $ok, fallidas: $bad"
[ "$bad" -eq 0 ]
