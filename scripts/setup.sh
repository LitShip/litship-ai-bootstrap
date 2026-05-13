#!/usr/bin/env bash
set -euo pipefail

step() {
  printf '\n==> %s\n' "$1"
}

has_cmd() {
  command -v "$1" >/dev/null 2>&1
}

install_npm_package() {
  local package_name="$1"
  local command_name="$2"

  if has_cmd "$command_name"; then
    echo "$command_name は既に使えます。"
    return
  fi

  if ! has_cmd npm; then
    echo "npm が見つかりません。先に Node.js をインストールしてください。" >&2
    exit 1
  fi

  step "$package_name を npm でインストール"
  npm install -g "$package_name"
}

step "GitHub CLI を確認"
if ! has_cmd gh; then
  if has_cmd brew; then
    brew install gh
  else
    echo "Homebrew が見つかりません。https://cli.github.com/ から GitHub CLI をインストールしてください。" >&2
  fi
else
  echo "gh は既に使えます。"
fi

step "Google Workspace CLI を確認"
install_npm_package "@googleworkspace/cli" "gws"

step "Lark CLI を確認"
install_npm_package "@larksuite/cli" "lark-cli"

step "Lark CLI Skills を追加"
if has_cmd npx; then
  npx skills add larksuite/cli -y -g || echo "Lark CLI Skills の追加はスキップしました。CLI 本体はこのまま使えます。"
else
  echo "npx が見つからないため、Lark CLI Skills はスキップしました。" >&2
fi

step "Claude Code / Codex 共通ルールを配置"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$HOME/.claude" "$HOME/.codex"
cp "$ROOT_DIR/config/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
cp "$ROOT_DIR/config/codex/AGENTS.md" "$HOME/.codex/AGENTS.md"

step "完了"
cat <<'EOF'
次に必要な認証を行ってください:
  gh auth login
  gws auth setup
  gws auth login -s drive,gmail,sheets
  lark-cli config init
  lark-cli auth login --recommend
EOF
