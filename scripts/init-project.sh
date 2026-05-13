#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: bash scripts/init-project.sh /path/to/your-app" >&2
  exit 1
fi

TARGET_PATH="$1"
if [ ! -d "$TARGET_PATH" ]; then
  echo "Target path not found: $TARGET_PATH" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE_DIR="$ROOT_DIR/templates/project"

cp "$TEMPLATE_DIR/CLAUDE.md" "$TARGET_PATH/CLAUDE.md"
cp "$TEMPLATE_DIR/DESIGN.md" "$TARGET_PATH/DESIGN.md"
mkdir -p "$TARGET_PATH/.claude"
cp -R "$TEMPLATE_DIR/.claude/." "$TARGET_PATH/.claude/"

echo "プロジェクトテンプレートを配置しました: $TARGET_PATH"
echo "次に Claude Code Setup へ 'recommend automations for this project' と依頼してください。"
