# git-commit スキル作成サマリー

## 概要

skill-creator を使用して Git commit 用のスキルを作成した。

## 作成したスキル

**場所:** `~/.claude/skills/git-commit/`

**構成:**
```
git-commit/
├── SKILL.md
└── references/
    └── conventional-commits.md
```

## スキルの機能

- **トリガー:** 「コミットして」「変更をコミット」「/commit」など
- **形式:** Conventional Commits（feat:, fix:, docs: など）
- **言語:** 日本語
- **スコープ:** 機能名を使用（auth, api, ui など）
- **複数変更:** 種類ごとに分割コミット

## ワークフロー

1. `git status` / `git diff` で状態確認
2. 変更内容を分析（種類、スコープ、破壊的変更）
3. 複数変更時は分割コミット
4. ステージング（`git add`）
5. コミット実行
6. `git log` で結果確認

## 注意事項

- コミット前に差分確認必須
- `.env` や認証情報はコミットしない
- 破壊的変更マーク（`!`）はユーザー確認後に付与
- `--amend` は自分が作成した未プッシュのコミットのみ

## 作成日

2026-01-08
