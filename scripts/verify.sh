#!/usr/bin/env bash
set -euo pipefail

for command_name in git node npm gh gws lark-cli; do
  if command -v "$command_name" >/dev/null 2>&1; then
    echo "[OK] $command_name"
  else
    echo "[NG] $command_name が見つかりません"
  fi
done

echo ""
echo "認証状態:"
if command -v gh >/dev/null 2>&1; then
  gh auth status || true
fi
if command -v lark-cli >/dev/null 2>&1; then
  lark-cli auth status || true
fi
if command -v gws >/dev/null 2>&1; then
  echo 'gws は auth status コマンドがない場合があります。ログイン後の確認は次を使ってください:'
  echo '  gws drive files list --params "{\"pageSize\": 1}"'
fi
