# Project Guide

このファイルは、Claude Code がプロジェクトを理解するための入口です。
作り始めたら、実際の内容に合わせて短く更新してください。

## Project Overview

- 目的:
- 主な利用者:
- 2日間で作る最小ゴール:

## Tech Stack

- Frontend:
- Backend:
- Database:
- External APIs:

## Commands

```bash
# 開発サーバー

# テスト

# Lint / format

# ビルド
```

## Workflow

- まず小さく動くものを作る。
- 変更は意味のある単位で分ける。
- エラーが出たら、原因説明と次の一手を日本語で出す。
- 本番データ・秘密情報・APIキーは扱わない。

## AI Safety Rules

- APIキー、パスワード、本番環境の認証情報をチャットに貼らない。
- `.env`、`credentials.json`、秘密鍵は明示的な許可なしに読まない。
- `rm -rf`、`git reset --hard`、`git push --force`、DB削除系コマンドは、何が消えるか説明してから確認する。
- Auto-approve や危険な権限スキップ設定は使わない。

## Notes For Future Sessions

- 決めた仕様:
- つまずいたこと:
- 次にやること:
