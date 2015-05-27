SETTING FILE
===============
各設定ファイル

ディレクトリ構成
-----
```
/
├─ .bashrc    : bash 用設定ファイル
├─ .gitconfig : git 用設定ファイル
├─ .vim       : vim 用設定ファイル
├─ .gvim      : MacVim 用設定ファイル
└─ README.md  : 本ファイル
```


* .bashrc を使用する場合は、.bash_profile に下記を追加すること
```
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

```
