# Optional: agentmemory

agentmemory は、セッションをまたいでAI coding agentの作業記憶を保持するためのツールです。

合宿の初回セットアップでは必須にしません。理由は、Windowsでは追加の実行環境やDockerが必要になる場合があり、30分セットアップには重いからです。

使う場合の基本形:

```bash
npx @agentmemory/agentmemory
```

Claude Code で使う場合:

```text
/plugin marketplace add rohitg00/agentmemory
/plugin install agentmemory
```

Codex で使う場合:

```bash
codex plugin marketplace add rohitg00/agentmemory
codex plugin install agentmemory
```

導入するなら、合宿後に「同じプロジェクトを継続して育てる」段階で検討します。
