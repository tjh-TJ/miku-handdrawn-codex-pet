#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
PET_SOURCE="$SCRIPT_DIR/pet/miku-handdrawn"
PETS_ROOT="${CODEX_PETS_DIR:-${HOME}/.codex/pets}"
PET_DEST="$PETS_ROOT/miku-handdrawn"

test -f "$PET_SOURCE/pet.json"
test -f "$PET_SOURCE/spritesheet.webp"
mkdir -p "$PET_DEST"
cp "$PET_SOURCE/pet.json" "$PET_DEST/pet.json"
cp "$PET_SOURCE/spritesheet.webp" "$PET_DEST/spritesheet.webp"

printf 'Hand-drawn Miku installed to %s\nOpen Codex Settings → Pets and choose Refresh.\n' "$PET_DEST"
