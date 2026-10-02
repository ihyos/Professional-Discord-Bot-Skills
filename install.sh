#!/usr/bin/env bash
set -e

echo "Instalando Professional Discord Bot Skills..."

TEMP_DIR=$(mktemp -d)
git clone --depth 1 --filter=blob:none --sparse https://github.com/ihyos/Professional-Discord-Bot-Skills.git "$TEMP_DIR" --quiet
(
  cd "$TEMP_DIR"
  git sparse-checkout set skill.md "emojis discord" --quiet
)

cp -f "$TEMP_DIR/skill.md" ./
cp -rf "$TEMP_DIR/emojis discord" ./

rm -rf "$TEMP_DIR"

echo "Sucesso: skill.md e pasta 'emojis discord' instalados no projeto."
