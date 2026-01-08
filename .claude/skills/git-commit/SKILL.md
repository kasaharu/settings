---
name: git-commit
description: Git リポジトリへの変更をコミットする。Conventional Commits 形式（feat:, fix:, docs: など）で日本語のコミットメッセージを作成する。機能名をスコープとして使用（例: feat(auth):）。複数の異なる変更がある場合は分割コミットする。ユーザーが「コミットして」「変更をコミット」「/commit」「git commit」などと言ったときに使用する。
---

# Git Commit

変更内容を確認し、Conventional Commits 形式で日本語のコミットを作成する。

## コミットメッセージのルール

- **言語**: 日本語
- **スコープ**: 機能名を使用（auth, api, ui, db など）
- **原則**: 1コミット1目的（複数の異なる変更は分割）

**形式:**
```
<type>(scope): <description>

[optional body]

Co-Authored-By: Claude <noreply@anthropic.com>
```

**タイプ一覧:**
| タイプ | 用途 |
|--------|------|
| `feat` | 新機能 |
| `fix` | バグ修正 |
| `docs` | ドキュメント |
| `style` | フォーマット（動作に影響なし） |
| `refactor` | リファクタリング |
| `perf` | パフォーマンス改善 |
| `test` | テスト |
| `build` | ビルド設定 |
| `ci` | CI設定 |
| `chore` | その他 |

詳細は [references/conventional-commits.md](references/conventional-commits.md) を参照。

## ワークフロー

### 1. 状態確認

```bash
git status
git diff --staged
git diff
```

### 2. 変更内容の分析

差分を確認し、以下を特定：
- 変更の種類（新機能、バグ修正、リファクタリング等）
- 影響範囲（スコープ）→ 機能名を使用
- 破壊的変更の有無

### 3. 複数変更時の分割

異なる種類の変更がある場合は分割コミットする：

```bash
# 例: 機能追加とバグ修正が混在している場合

# 1. まずバグ修正をコミット
git add <bug-fix-files>
git commit -m "fix(auth): ログインエラーを修正"

# 2. 次に機能追加をコミット
git add <feature-files>
git commit -m "feat(auth): パスワードリセット機能を追加"
```

### 4. ステージング

```bash
git add <files>
# または全ファイル（単一目的の変更の場合のみ）
git add .
```

### 5. コミット実行

```bash
git commit -m "$(cat <<'EOF'
<type>(scope): <description>

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"
```

### 6. コミット後の確認

```bash
git log --oneline -3
git status
```

## 注意事項

- コミット前に必ず `git diff` で変更内容を確認する
- `.env` や認証情報を含むファイルをコミットしない
- コミットは明示的にユーザーから依頼された場合のみ実行する
- `--amend` は直前のコミットが自分で作成し、まだプッシュしていない場合のみ使用可能
- 破壊的変更がある場合はタイプの後に `!` を付ける（例: `feat!:`）。ただし、`!` を付ける前に必ずユーザーに確認する
