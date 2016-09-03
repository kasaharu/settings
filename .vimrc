"----------------------------------------------------
" kasaharu.vim (.vimrc) : Vim の設定ファイル
" Maintainer: Wataru KASAHARA <Wataru.Kasahara@gmail.com>
" Last Change: 2016 Aug 31
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
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

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
call dein#add('scrooloose/syntastic')
" call dein#add('plasticboy/vim-markdown')
" call dein#add('kannokanno/previm')
" call dein#add('tyru/open-browser.vim')
" call dein#add('nathanaelkane/vim-indent-guides')


call dein#add('tpope/vim-rails')         " Rails 用プラグイン
call dein#add('tpope/vim-endwise')       " Rails 用プラグイン
call dein#add('elixir-lang/vim-elixir')  " Elixir 用プラグイン
" call dein#add('othree/html5.vim')        " HTML5 のシンタックスハイライト
" call dein#add('othree/yajs.vim')         " ES6 のシンタックスハイライト
" call dein#add('mxw/vim-jsx')             " HTML5 のシンタックスハイライト
" call dein#add('pangloss/vim-javascript')
" call dein#add('othree/javascript-libraries-syntax.vim')
" call dein#add('othree/es.next.syntax.vim')
" call dein#add('hail2u/vim-css3-syntax')


call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-p> :PrevimOpen<CR>

" Markdown Preview 用
au BufRead,BufNewFile *.md set filetype=markdown

