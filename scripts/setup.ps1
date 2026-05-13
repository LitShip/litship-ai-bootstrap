$ErrorActionPreference = "Stop"

function Write-Step($Message) {
  Write-Host ""
  Write-Host "==> $Message" -ForegroundColor Cyan
}

function Test-Command($Name) {
  return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Install-NpmPackage($PackageName, $CommandName) {
  if (Test-Command $CommandName) {
    Write-Host "$CommandName は既に使えます。"
    return
  }

  if (-not (Test-Command "npm")) {
    throw "npm が見つかりません。先に Node.js をインストールしてください。"
  }

  Write-Step "$PackageName を npm でインストール"
  npm install -g $PackageName
}

Write-Step "GitHub CLI を確認"
if (-not (Test-Command "gh")) {
  if (Test-Command "winget") {
    winget install --id GitHub.cli -e
  } else {
    Write-Warning "winget が見つかりません。https://cli.github.com/ から GitHub CLI をインストールしてください。"
  }
} else {
  Write-Host "gh は既に使えます。"
}

Write-Step "Google Workspace CLI を確認"
Install-NpmPackage "@googleworkspace/cli" "gws"

Write-Step "Lark CLI を確認"
Install-NpmPackage "@larksuite/cli" "lark-cli"

Write-Step "Lark CLI Skills を追加"
if (Test-Command "npx") {
  npx skills add larksuite/cli -y -g
  if ($LASTEXITCODE -ne 0) {
    Write-Warning "Lark CLI Skills の追加はスキップしました。CLI 本体はこのまま使えます。"
  }
} else {
  Write-Warning "npx が見つからないため、Lark CLI Skills はスキップしました。"
}

Write-Step "Claude Code / Codex 共通ルールを配置"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$ClaudeDir = Join-Path $HOME ".claude"
$CodexDir = Join-Path $HOME ".codex"
New-Item -ItemType Directory -Force -Path $ClaudeDir | Out-Null
New-Item -ItemType Directory -Force -Path $CodexDir | Out-Null
Copy-Item -Path (Join-Path $Root "config\claude\CLAUDE.md") -Destination (Join-Path $ClaudeDir "CLAUDE.md") -Force
Copy-Item -Path (Join-Path $Root "config\codex\AGENTS.md") -Destination (Join-Path $CodexDir "AGENTS.md") -Force

Write-Step "完了"
Write-Host "次に必要な認証を行ってください:"
Write-Host "  gh auth login"
Write-Host "  gws auth setup"
Write-Host "  gws auth login -s drive,gmail,sheets"
Write-Host "  lark-cli config init"
Write-Host "  lark-cli auth login --recommend"
