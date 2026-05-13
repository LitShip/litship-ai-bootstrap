# Lark Harness Template

LarkをAIの作業台として使うための最小テンプレートです。

## 目的

Lark Docs / Base / Sheets / Calendar を、AIが安全に扱える形にします。

## 3層

1. Universal Checks
   - どの会社でも守るルール
   - 例: 個人情報を外に出さない、必須項目を空にしない、承認前に更新しない

2. Tenant Overrides
   - その会社だけの呼び方や業務ルール
   - 例: 月次締め日、担当者、レビューが必要な条件

3. LLM Hybrid
   - ルールだけで判断できない部分をAIが補助する
   - ただし最終判断が必要なものは人間に戻す

## 使い方

1. `tenant-overrides.example.json` を `tenant-overrides.json` にコピー
2. 自社・チームの呼び方やルールだけ埋める
3. `universal-checks.md` を見ながら、AIに作業前チェックをさせる

秘密情報や本番トークンはここに書かないでください。
