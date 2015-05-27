"----------------------------------------------------
" kasaharu.vim (.vimrc) : Vim $B$N@_Dj%U%!%$%k(B
" Maintainer: Wataru KASAHARA <Wataru.Kasahara@gmail.com>
" Last Change: 2014 May 30
"
" $B%U%!%$%kL>$r(B [.vimrc] $B$KJQ99$7!"=jDj$N0LCV$KCV$/$3$H$G;HMQ2D(B
"----------------------------------------------------

"----------------------------------------------------
" Visual
"----------------------------------------------------
" $B%+%i!<@_Dj(B:
colorscheme darkblue

"----------------------------------------------------
" $BI=<(4X78(B
"----------------------------------------------------
" $B%?%$%H%k$r%&%$%s%I%&OH$KI=<($9$k(B
set title
" $B9THV9f$rI=<($9$k(B
set number
" $B%?%V$H9TKv$rI=<($9$k(B
set list
" $B%k!<%i!<$rI=<((B
set ruler
" $BF~NOCf$N%3%^%s%I$r%9%F!<%?%9$KI=<($9$k(B
set showcmd
" $B%9%F!<%?%9%i%$%s$r>o$KI=<((B
set laststatus=2
" $B3g8LF~NO;~$NBP1~$9$k3g8L$rI=<((B
"$BJD$83g8L$,F~NO$5$l$?$H$-!"BP1~$9$k3g8L$rI=<($9$k(B
set showmatch
" $B%7%s%?%C%/%9%O%$%i%$%H$rM-8z$K$9$k(B
syntax on
" $B8!:w7k2LJ8;zNs$N%O%$%i%$%H$rM-8z$K$9$k(B
set hlsearch
" $B%3%a%s%HJ8$N?'$rJQ99(B
highlight Comment ctermfg=DarkCyan
"$B?7$7$$9T$N%$%s%G%s%H$r8=:_9T$HF1$8$K$9$k(B
set autoindent
"$B%?%V$NBe$o$j$K6uGrJ8;z$rA^F~$9$k(B
set expandtab
"$B%$%s%/%j%a%s%?%k%5!<%A$r9T$&(B
set incsearch
" $B8!:w$N;~$KBgJ8;z>.J8;z$r6hJL$7$J$$(B
set ignorecase
"$B8!:w;~$KBgJ8;z$r4^$s$G$$$?$iBg(B/$B>.$r6hJL(B
set smartcase
"$B?7$7$$9T$r:n$C$?$H$-$K9bEY$J<+F0%$%s%G%s%H$r9T$&(B
set smartindent
" $B%+!<%=%k9T$K2<@~(B
set cursorline


" --- --- --- --- ---
" $B%7%U%H0\F0I}(B
"set shiftwidth=2
" $B9TF,$NM>GrFb$G(B Tab $B$rBG$A9~$`$H!"(B'shiftwidth' $B$N?t$@$1%$%s%G%s%H$9$k!#(B
"set smarttab
" $B%U%!%$%kFb$N(B <Tab> $B$,BP1~$9$k6uGr$N?t(B
"set tabstop=2
" list$B$GI=<($5$l$kJ8;z$N%U%)!<%^%C%H$r;XDj$9$k(B
" --> tab:$B%?%V(B, trail:$B9TKv$KB3$/%9%Z!<%9(B, 
set listchars=tab:>.,trail:_,eol:$
" set listchars $B$G;XDj$7$?CV$-49$($r$9$k(B
set list
" $BA43Q%9%Z!<%9$N;k3P2=(B
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /$B!!(B/
"$B%?%V$NBe$o$j$K6uGrJ8;z$rA^F~$9$k(B
set expandtab
" $B%?%V$rI=<($9$k$H$-$NI}(B
set tabstop=2
" $B%?%V$rA^F~$9$k$H$-$NI}(B
set shiftwidth=2
" $B%?%VI}(B
" set softtabstop=2

set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932


nnoremap <silent> <Esc> :nohlsearch<CR>


" ------------------------------------------
" GNU Global$B$N@_Dj(B
"Ctrl+t :Gtags $B$HF~NO$9$k(B
"Ctrl+h :$B%+!<%=%k2<J8;zNs$G(Bcurrent$B$N%=!<%9%3!<%I$N(B grep
"Ctrl+i $B3+$$$F$$$k%U%!%$%k$KDj5A$5$l$F$$$k4X?t$N0lMw$rI=<((B
"Ctrl+j $B%+!<%=%k0LCV$N4X?t$X%8%c%s%W(B
"Ctrl+n $B<!$N8!:w7k2L$X%8%c%s%W$9$k(B
"Ctrl+p $BA0$N8!:w7k2L$X%8%c%s%W$9$k(B
noremap <C-g> :Gtags
noremap <C-r> :Gtags -r
noremap <C-h> :Gtags -gl<CR>
noremap <C-i> :Gtags -f %<CR>
noremap <C-j> :GtagsCursor<CR>
noremap <C-n> :cn<CR>
noremap <C-p> :cp<CR>
":Gtags $B4X?tL>(B        | $B4X?tL>(B $B"*(B $B%=!<%9%3!<%I!JDj5A!K(B
":Gtags -r $B4X?tL>(B         | $B4X?tL>(B $B"*(B $B%=!<%9%3!<%I!J;2>H!K(B
":Gtags -f $B%U%!%$%kL>(B | $B%=!<%9%3!<%I(B $B"*(B $B4X?t0lMw(B
"global -c $B4X?tL>0lIt(B | $B4X?tL>$N0lIt(B $B"*(B $B4X?t0lMw(B
":Gtags -g $B8!:wJ8;zNs(B | $B%=!<%9%3!<%I$N(B grep



