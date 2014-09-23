SETTING FILE
===============
これは設定ファイルです。
現在は vim 用の設定ファイルのみです。

ディレクトリ構成
-----
```
/
├─ run_command
│   ├─ kasaharu.bashrc    : bash 用設定ファイル
│   └─ kasaharu.gitconfig : git 用設定ファイル
│
├─ vim
│   ├─ kasaharu.vim       : vim 用設定ファイル
│   └─ kasaharu.gvim      : MacVim 用設定ファイル
│
└─ README.md               : 本ファイル
```


* .bashrc を使用する場合は、.bash_profile に下記を追加すること
```
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

```
