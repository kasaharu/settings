"----------------------------------------------------
" kasaharu.gvim (.gvimrc) : MacVim の設定ファイル
" Maintainer: Wataru KASAHARA <Wataru.Kasahara@gmail.com>
" Last Change: 30-May-2015.
"
" MacVim を便利に使うために以下の設定をしておくとよい
" .bash_profile を開き、"alias mvim='open -a MacVim'" と記載する
" ターミナルで "source .bash_profile" と入力する
" mvim で MacVim が起動するようになる
"----------------------------------------------------

" カラー設定:
colorscheme darkblue
" 縦幅  デフォルトは24
set lines=100
" 横幅  デフォルトは80
set columns=120
" バックアップファイルを作成しない
set nobackup
set noundofile



augroup hack234
  autocmd!
    if has('mac')
      autocmd FocusGained * set transparency=10
      autocmd FocusLost * set transparency=50
    endif
  augroup
END

