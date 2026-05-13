param(
  [Parameter(Mandatory = $true)]
  [string]$TargetPath
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $TargetPath)) {
  throw "TargetPath が見つかりません: $TargetPath"
}

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$TemplateDir = Join-Path $Root "templates\project"

Copy-Item -Path (Join-Path $TemplateDir "CLAUDE.md") -Destination (Join-Path $TargetPath "CLAUDE.md") -Force
Copy-Item -Path (Join-Path $TemplateDir "DESIGN.md") -Destination (Join-Path $TargetPath "DESIGN.md") -Force

$ClaudeTarget = Join-Path $TargetPath ".claude"
New-Item -ItemType Directory -Force -Path $ClaudeTarget | Out-Null
Copy-Item -Path (Join-Path $TemplateDir ".claude\*") -Destination $ClaudeTarget -Recurse -Force

Write-Host "プロジェクトテンプレートを配置しました: $TargetPath"
Write-Host "次に Claude Code Setup へ 'recommend automations for this project' と依頼してください。"
