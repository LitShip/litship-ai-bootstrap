$commands = @("git", "node", "npm", "gh", "gws", "lark-cli")

foreach ($command in $commands) {
  if (Get-Command $command -ErrorAction SilentlyContinue) {
    Write-Host "[OK] $command" -ForegroundColor Green
  } else {
    Write-Host "[NG] $command が見つかりません" -ForegroundColor Red
  }
}

Write-Host ""
Write-Host "認証状態:"
if (Get-Command gh -ErrorAction SilentlyContinue) {
  gh auth status
}
if (Get-Command lark-cli -ErrorAction SilentlyContinue) {
  lark-cli auth status
}
if (Get-Command gws -ErrorAction SilentlyContinue) {
  Write-Host "gws は auth status コマンドがない場合があります。ログイン後の確認は次を使ってください:"
  Write-Host '  gws drive files list --params "{\"pageSize\": 1}"'
}
