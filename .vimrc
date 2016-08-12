"----------------------------------------------------
" kasaharu.vim (.vimrc) : Vim の設定ファイル
" Maintainer: Wataru KASAHARA <Wataru.Kasahara@gmail.com>
" Last Change: 2013 Apr 14
"
" ファイル名を [.vimrc] に変更し、所定の位置に置くことで使用可
"----------------------------------------------------

colorscheme darkblue " カラー設定:
syntax on            " シンタックスハイライトを有効にする

" 表示関係
"----------------------------------------------------

set title                          " タイトルをウインドウ枠に表示する
set number                         " 行番号を表示する
set listchars=tab:>.,trail:_,eol:$ " list で表示する文字フォーマット指定(--> tab:タブ, trail:行末に続くスペース)
set list                           " タブと行末を表示する
set ruler                          " ルーラーを表示
set showcmd                        " 入力中のコマンドをステータスに表示する
set laststatus=2                   " ステータスラインを常に表示
set showmatch                      " 閉じ括弧が入力されたとき、対応する括弧を表示する
set autoindent                     " インデント機能を有効にする
set smartindent                    " 新しい行を作ったときに高度な自動インデントを行う
set shiftwidth=2                   " インデントに使われる空白の数
set expandtab                      " タブの代わりに空白文字を挿入する
set tabstop=2                      " タブを表示するときの幅
set cursorline                     " カーソル行に下線

" 検索系
"----------------------------------------------------
set ignorecase " 検索の時に大文字小文字を区別しない
set smartcase  " 検索時に大文字を含んでいたら大/小を区別
set incsearch  " インクリメンタルサーチを行う
set hlsearch   " 検索結果文字列のハイライトを有効にする


" その他
"----------------------------------------------------
" 全角スペースの視覚化
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>


" プラグイン
"----------------------------------------------------
let s:dein_dir      = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-rails')         " Rails 用プラグイン
call dein#add('tpope/vim-endwise')       " Rails 用プラグイン
call dein#add('elixir-lang/vim-elixir')  " Elixir 用プラグイン

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
