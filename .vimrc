"----------------------------------------------------
" kasaharu.vim (.vimrc) : Vim の設定ファイル
" Maintainer: Wataru KASAHARA <Wataru.Kasahara@gmail.com>
" Last Change: 2013 Apr 14
"
" ファイル名を [.vimrc] に変更し、所定の位置に置くことで使用可
"----------------------------------------------------

"----------------------------------------------------
" Visual
"----------------------------------------------------
" カラー設定:
colorscheme darkblue

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示する
set number
" タブと行末を表示する
set list
" ルーラーを表示
set ruler
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
"新しい行のインデントを現在行と同じにする
set autoindent
"タブの代わりに空白文字を挿入する
set expandtab
"インクリメンタルサーチを行う
set incsearch
" 検索の時に大文字小文字を区別しない
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
" カーソル行に下線
set cursorline


" --- --- --- --- ---
" シフト移動幅
"set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
"set smarttab
" ファイル内の <Tab> が対応する空白の数
"set tabstop=2
set expandtab
" listで表示される文字のフォーマットを指定する
" --> tab:タブ, trail:行末に続くスペース,
set listchars=tab:>.,trail:_,eol:$
" set listchars で指定した置き換えをする
set list
" 全角スペースの視覚化
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/
"タブの代わりに空白文字を挿入する
set expandtab
" タブを表示するときの幅
set tabstop=2
" タブを挿入するときの幅
set shiftwidth=2
" タブ幅
" set softtabstop=2


nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

"----------------------------------------------------
" plugin
"----------------------------------------------------
" 事前に下記を実行する
" mkdir -p ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

filetype off
if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ここにインストールしたいプラグインのリストを書く:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'elixir-lang/vim-elixir'

call neobundle#end()

" Reqiured:
filetype plugin indent on

NeoBundleCheck
