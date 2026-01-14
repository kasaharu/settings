# Save Knowledge

会話で得た知識を Markdown ファイルとして保存するコマンド。

## 保存先

/Users/watarukasahara/Documents/kasaharu's vault/20_ Knowledge/

## ファイル名形式

`YYYYMMDD_<トピック名をケバブケースに変換>.md`

例: `20260114_ngx-quill-version-upgrade.md`

## 指示

1. **トピックの特定**: 会話内容を分析し、主要なトピック・学んだ知識を特定する

2. **タグの抽出**: 会話内容から関連する技術・トピックをタグとして抽出
   - 小文字、ハイフン区切りで統一
   - 例: `typescript`, `angular`, `module-resolution`, `build-config`

3. **ファイル名の生成**:
   - 今日の日付を `YYYYMMDD` 形式で取得
   - トピックを英語のケバブケース（小文字、ハイフン区切り）に変換
   - 形式: `YYYYMMDD_topic-name.md`

4. **内容の整理**: 以下の構成で Markdown を作成

   ```markdown
   ---
   tags:
     - tag1
     - tag2
   created: YYYY-MM-DD
   ---

   # タイトル（日本語）

   ## 概要

   何について学んだか

   ## 詳細

   具体的な内容（箇条書きやコードブロックを活用）

   ## 参考

   関連リンクや参考情報（あれば）
   ```

5. **ファイル保存**: 指定ディレクトリに保存

6. **完了報告**: 保存したファイルパスとタグを報告

## 注意事項

- 会話の中で特に重要・有用だった知識を抽出する
- 技術的な内容はコードブロックを使用して可読性を高める
- 将来の自分が読んで理解できるよう、背景情報も含める
- タグは具体的かつ再利用可能なものを選ぶ（例: `javascript` より `typescript` のように具体的に）
