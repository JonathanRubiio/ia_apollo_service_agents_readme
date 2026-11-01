#!/usr/bin/env bash
# Guardarraíl: rechaza términos prohibidos en mensajes de commit, contenido staged,
# identidad de autor y rango a empujar. Los patrones se construyen por partes para que
# este archivo no los contenga literalmente.
#
# Falla cerrado: si no se puede leer lo que hay que revisar, rechaza en vez de dejar pasar.
# Sin pipefail a propósito: grep -q corta el pipe y pipefail ocultaría la coincidencia, así
# que la salida de git se captura primero y se revisa con here-strings.
#
# Uso:
#   check-forbidden-terms.sh msg <archivo-de-mensaje>
#   check-forbidden-terms.sh staged
#   check-forbidden-terms.sh push        # lee stdin en formato de pre-push
# Pruebas: scripts/test-forbidden-terms.sh
set -eu

# Separadores opcionales (guion, guion bajo, punto o espacio) para cubrir variantes.
PATTERN="w[i][i]mi|w[i]edii|git[-_. ]?w[o]rkflow|vp[-_. ]?gitignore[-_. ]?b[u]ilder"

fail() {
  echo "check-forbidden-terms: $1" >&2
  exit 1
}

# Coincidencia del patrón sobre un texto.
hit() {
  grep -Eiq "$PATTERN" <<<"$1"
}

check_msg() {
  [ -r "$1" ] || fail "no se pudo leer el mensaje de commit (rechazado por seguridad)"
  if grep -Eiq "$PATTERN" "$1"; then
    fail "término prohibido en el mensaje de commit"
  fi
}

check_staged() {
  local names diff added email
  names=$(git diff --cached --name-only) || fail "no se pudieron leer los archivos staged (rechazado por seguridad)"
  if hit "$names"; then fail "término prohibido en nombres de archivo staged"; fi
  diff=$(git diff --cached -U0 --no-color) || fail "no se pudo leer el contenido staged (rechazado por seguridad)"
  added=$(grep -E '^\+' <<<"$diff" | grep -Ev '^\+\+\+' || true)
  if hit "$added"; then fail "término prohibido en el contenido staged"; fi
  email=$(git config user.email || true)
  if hit "$email"; then fail "término prohibido en user.email del repo"; fi
}

check_push() {
  local zero='0000000000000000000000000000000000000000' _lref lsha _rref rsha range out
  while read -r _lref lsha _rref rsha; do
    [ "$lsha" = "$zero" ] && continue
    # Tras un force-push el commit remoto viejo no existe localmente: se escanea todo.
    if [ "$rsha" = "$zero" ] || ! git cat-file -e "$rsha^{commit}" 2>/dev/null; then
      range="$lsha"
    else
      range="$rsha..$lsha"
    fi
    out=$(git log "$range" --format='%an <%ae> %cn <%ce>%n%B') \
      || fail "no se pudo leer el rango $range (rechazado por seguridad)"
    if hit "$out"; then fail "término prohibido en autores o mensajes del rango $range"; fi
    out=$(git log "$range" -p --format= --no-color) \
      || fail "no se pudo leer el contenido del rango $range (rechazado por seguridad)"
    if hit "$out"; then fail "término prohibido en el contenido o las rutas del rango $range"; fi
  done
}

case "${1:-}" in
  msg) check_msg "${2:?falta archivo de mensaje}" ;;
  staged) check_staged ;;
  push) check_push ;;
  *) echo "uso: $0 {msg <archivo>|staged|push}" >&2; exit 2 ;;
esac
