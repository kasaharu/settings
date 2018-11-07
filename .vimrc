"----------------------------------------------------
" kasaharu.vim (.vimrc) : Vim の設定ファイル
" Maintainer: Wataru KASAHARA
" Last Change: 2018 Jan. 30
"
" ファイル名を [.vimrc] に変更し、所定の位置に置くことで使用可
"----------------------------------------------------

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
set cursorcolumn                   " カーソル列に線
set backspace=2                    " 挿入モード時にバックスペースで文字を削除可能にする
set encoding=utf-8

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

call dein#add('scrooloose/nerdtree')                    " ツリー表示
call dein#add('Shougo/neocomplete.vim')                 " コード自動補完
call dein#add('plasticboy/vim-markdown')                " Markdown 記法のシンタックス
call dein#add('kannokanno/previm')                      " Markdown ファイルのプレビュー
call dein#add('tyru/open-browser.vim')                  " browser を開く(主に Markdown のプレビュー)
call dein#add('nelstrom/vim-visual-star-search')        " ビジュアルモードでのサーチ強化
call dein#add('dhruvasagar/vim-table-mode')             " TableMode

call dein#add('othree/html5.vim')                       " HTML5 のシンタックスハイライト
call dein#add('leafgarland/typescript-vim')             " TypeScript 用プラグイン
call dein#add('kchmck/vim-coffee-script')               " CoffeeScript のシンタックスハイライト
call dein#add('othree/yajs.vim')                        " ES6 のシンタックスハイライト
call dein#add('maxmellon/vim-jsx-pretty')               " JSX のシンタックスハイライト
call dein#add('pangloss/vim-javascript')                " JSX のシンタックスハイライト
call dein#add('othree/javascript-libraries-syntax.vim') " JavaScript ライブラリシンタックスハイライト
call dein#add('othree/es.next.syntax.vim')              " stage-0 のシンタックスハイライト
call dein#add('w0rp/ale')                               " ESLint のチェックツール
call dein#add('prettier/vim-prettier')                  " Prettier プラグイン

" call dein#add('tpope/vim-rails')         " Rails 用プラグイン
" call dein#add('tpope/vim-endwise')       " Rails 用プラグイン
" call dein#add('elixir-lang/vim-elixir')  " Elixir 用プラグイン

call dein#add('w0ng/vim-hybrid')           " Color Scheme

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

set background=dark
colorscheme hybrid   " カラー設定
syntax on            " シンタックスハイライトを有効にする

" Short cut key
" ctl + t でツリー表示
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
" ctl + p で Markdown プレビュー表示
nnoremap <silent> <C-p> :PrevimOpen<CR>
" ctl + b で Markdown 記法の Table 整形モード
nnoremap <silent> <C-b> :TableModeToggle<CR>

" Markdown Preview 用
au BufRead,BufNewFile *.md set filetype=markdown

" ESlint
let g:ale_statusline_format = ['E%d', 'W%d', '']

" maxmellon/vim-jsx-pretty
let g:vim_jsx_pretty_enable_jsx_highlight = 0
let g:vim_jsx_pretty_colorful_config = 1

" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore,react,flux'

" TypeScript
let g:typescript_indent_disable = 1

" TableMode
let g:table_mode_corner='|'

let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier
