# Claude Code のコストを表示する

[ccusage](https://github.com/ryoppippi/ccusage) を使ってコストを表示します。
ccusage は必ず npx 経由で使い、グローバルインストールなどは禁止します。

# 引数($ARGUMENTS)による処理の分岐

$ARGUMENTS の指定がなければ今月分の usage を出してください。
例えば今月が 2025 年の 7 月であれば、`npx ccusage@latest --since 20250701 --until 20250731` を実行して結果を表示します。

$ARGUMENTS が 202506 の場合は 2025 年 6 月の usage を出してください。
$ARGUMENTS が 2025 の場合は 2025 年のすべての usage を出してください。

結果は次のように表示してください。

- ccusage が出力する表をそのまま表示
  - table の header は英語のままでいいので、レイアウトを重視してください
- 表のサマリーを表示
