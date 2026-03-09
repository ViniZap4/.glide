#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "→ Installing Glide tiling WM for macOS..."

# ── Install dependencies ─────────────────────────────────────────
brew install glide koekeishiya/formulae/skhd 2>/dev/null || true

# ── Create config directories ────────────────────────────────────
mkdir -p ~/.config/glide ~/.config/skhd

# ── Create symlinks ──────────────────────────────────────────────
for pair in "glide/glide.toml:$HOME/.config/glide/glide.toml" "skhd/skhdrc:$HOME/.config/skhd/skhdrc"; do
  SOURCE="${pair%%:*}"
  TARGET="${pair##*:}"

  if [[ -f "$TARGET" && ! -L "$TARGET" ]]; then
    BACKUP="${TARGET}.backup.$(date +%Y%m%d%H%M%S)"
    echo "→ Backing up existing $TARGET to $BACKUP"
    mv "$TARGET" "$BACKUP"
  elif [[ -L "$TARGET" ]]; then
    rm "$TARGET"
  fi

  ln -s "${SCRIPT_DIR}/$SOURCE" "$TARGET"
  echo "✔ Linked $SOURCE → $TARGET"
done

# ── Start services ───────────────────────────────────────────────
glide launch 2>/dev/null || true
glide service install 2>/dev/null || true

skhd --install-service 2>/dev/null || true
skhd --start-service 2>/dev/null || true

echo ""
echo "→ Grant Accessibility permissions to Glide and skhd:"
echo "  System Settings > Privacy & Security > Accessibility"
echo ""
echo "→ Press Alt+Z on any space to activate tiling."
