"----------------------------------------------------
" kasaharu.vim (.vimrc) : Vim の設定ファイル
" Maintainer: Wataru KASAHARA
" Last Change: 2018 Jan. 30
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
set cursorcolumn                   " カーソル列に線
set backspace=2                    " 挿入モード時にバックスペースで文字を削除可能にする

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

call dein#add('othree/html5.vim')                       " HTML5 のシンタックスハイライト
call dein#add('leafgarland/typescript-vim')             " TypeScript 用プラグイン
call dein#add('othree/yajs.vim')                        " ES6 のシンタックスハイライト
call dein#add('maxmellon/vim-jsx-pretty')               " JSX のシンタックスハイライト
call dein#add('pangloss/vim-javascript')                " JSX のシンタックスハイライト
call dein#add('othree/javascript-libraries-syntax.vim') " JavaScript ライブラリシンタックスハイライト
call dein#add('othree/es.next.syntax.vim')              " stage-0 のシンタックスハイライト
call dein#add('w0rp/ale')                               " ESLint のチェックツール

" call dein#add('tpope/vim-rails')         " Rails 用プラグイン
" call dein#add('tpope/vim-endwise')       " Rails 用プラグイン
" call dein#add('elixir-lang/vim-elixir')  " Elixir 用プラグイン


call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" Short cut key
" ctl + t でツリー表示
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
" ctl + p で Markdown プレビュー表示
nnoremap <silent> <C-p> :PrevimOpen<CR>

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


" Setting for neocomplete ------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" ------------------------------ Setting for neocomplete
