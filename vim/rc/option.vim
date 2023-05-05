
set helplang=ja
set t_Co=256
set mouse=a

"-------------------------------------------------------------------------
"--" View: {{{1
"-------------------------------------------------------------------------
set background=dark
let g:solarized_termcolors=256
colorscheme alduin

set number
set relativenumber

set title 
set titleold="Vim"
"auto BufEnter * let &titlestring = hostname() . "/" . expand("%:p")
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

"--" Tab可視化 --"
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set tabstop=4

set fillchars=vert:┃,fold:─,diff:─

"-------------------------------------------------------------------------
"--" W Search Options: {{{1
"-------------------------------------------------------------------------
set   hlsearch
set noincsearch     " do incremental searching
set   ignorecase    " 検索時に大文字小文字を無視
set   smartcase     " 大文字小文字の両方が含まれている場合は大文字小文字を>
set   wrapscan

" 100 桁以上はハイライトしない
set synmaxcol=200

"-- ctrlp + ag
let g:ctrlp_user_command = 'ag %s -l'

" }}}1 W Search Options:

"-------------------------------------------------------------------------
"--" X Complete: {{{1
"-------------------------------------------------------------------------
set   showcmd		    " display incomplete commands
set   wildmenu
set   wildchar=<tab>
"set   wildmode=list:longest
set   wildmode=list:longest,list:full          " zsh like complete
set   wildignore+=.DS_Store
set   wildignore+=.git,.svn
set   wildignore+=*.o,*.obj,*.rbc,*.dll,*.exe
set   wildignore+=*.png,*.jpg,*.gif
set   wildignore+=*.so,*.sw?
set   wildignore+=*.out,*.aux
set   wildignore+=*.spl
set   wildignore+=*.luac,*.jar,*.pyc,.class
set   completeopt=menuone,preview
"set   complete=.,w,b,u,t,i,k

" ポップアップメニューに表示される項目数
set pumheight=12

"--" X Complete: }}}1

"-------------------------------------------------------------------------
"--" Syntax: {{{1
"-------------------------------------------------------------------------
let g:syntastic_vim_checkers = ['vint']

"--" Syntax: }}}1
"
set history=10000

set noshowmatch

"}}}1

"高速ターミナル接続を行う
set ttyfast
"マクロなどの途中経過を描写しない
set lazyredraw

if has('win32')
else
  syntax enable
endif

if !has('gui_running')
	let g:loaded_matchparen = 1
else

	set guioptions=c
	"set guifont=Ricty\ Regular\ for\ Powerline:h13

endif

" vim:foldmethod=marker:foldlevel=10
