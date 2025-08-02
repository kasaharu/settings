# Obsidian にあるデイリーノートの月次サマリーを作る

この処理のやりとりは日本語でお願いします。
作成しようとしているファイルやフォルダがある場合はそのパスを正確に教えて下さい。

# 月次処理をおこなう

現在の日報ファイル（/Users/watarukasahara/Documents/kasaharu\'s\ vault/01_Daily/$(date +%Y-%m-%d).md）に以下の処理をおこなってください。

## ひとつ目の処理: $ARGUMENTS

$ARGUMENTS は年月日の「月」です。
/Users/watarukasahara/Documents/kasaharu\'s\ vault/01_Daily/ を Daily ディレクトリと呼びます。
Daily ディレクトリの直下に $(date +%Y)-$ARGUMENTS というフォルダを作ってください。
そして Daily ディレクトリに直下にある $ARGUMENTS 月に相当するファイルを上で作成したフォルダに移動してください。

Daily ディレクトリの直下に $(date +%Y)-$ARGUMENTS というフォルダがすでにある場合は、この処理はスキップしてください。

## ふたつ目の処理

ひとつ目の処理でできた Daily ディレクトリの直下の $(date +%Y)-$ARGUMENTS というフォルダにある日報ファイルを要約して $(date +%Y)-$ARGUMENTS-summary.md というファイルを作ってください。
