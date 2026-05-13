# Security Rules

paths

**

## 絶対に守ること

- APIキー、パスワード、本番環境の認証情報をコードやチャットに含めない。
- `.env`、`credentials.json`、秘密鍵は読まない。必要なら先に理由を説明して確認する。
- 本番DB、本番Lark Base、本番Google Driveを直接変更しない。
- 削除・上書き・外部送信がある操作は、実行前に日本語で説明する。

## 確認が必要な操作

- `rm -rf`
- `git reset --hard`
- `git push --force`
- `DROP TABLE`
- `DELETE FROM`
- 外部APIへの大量リクエスト
- OAuth / ブラウザログイン
