#!/usr/bin/env bash
# Activa los hooks versionados del repo (guardarraíl de términos prohibidos).
# Ejecutar una vez después de clonar: bash scripts/install-hooks.sh
set -eu
root="$(git rev-parse --show-toplevel)"
chmod +x "$root"/scripts/git-hooks/* "$root"/scripts/check-forbidden-terms.sh
git -C "$root" config --local core.hooksPath scripts/git-hooks
echo "hooks activos: $(git -C "$root" config --local core.hooksPath)"
