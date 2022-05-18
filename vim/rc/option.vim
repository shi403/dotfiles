
set helplang=ja
set t_Co=256

"-------------------------------------------------------------------------
" W Search Options: {{{1
"-------------------------------------------------------------------------
set   hlsearch
set noincsearch     " do incremental searching
set   ignorecase    " 検索時に大文字小文字を無視
set   smartcase     " 大文字小文字の両方が含まれている場合は大文字小文字を>
set   wrapscan

" 検索後は画面の中心に移動
nmap n nzz
nmap N Nzz

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
set   complete=.,w,b,u,t,i,k

" ポップアップメニューに表示される項目数
set pumheight=8

"--" X Complete: }}}1

"-------------------------------------------------------------------------
"--" Syntax: {{{1
"-------------------------------------------------------------------------
let g:syntastic_vim_checkers = ['vint']

"--" Syntax: }}}1
"
"-------------------------------------------------------------------------
" X Mouse Event: {{{1
"-------------------------------------------------------------------------
set mouse=a

"-- マウス利用可能モード
nnoremap <silent> ,mm :<C-u>set mouse=a<CR>
"-- マウス無効モード
nnoremap <silent> ,mn :<C-u>set mouse=<CR>
" }}}1 X Mouse Event:

"-------------------------------------------------------------------------
"--" Color Scheme: {{{1
"-------------------------------------------------------------------------
set background=dark
let g:solarized_termcolors=256
colorscheme alduin

" 100 桁以上はハイライトしない
set synmaxcol=200

"--" Color Scheme: }}}1

"-- Tab可視化 --"
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set tabstop=4

set fillchars=vert:┃,fold:─,diff:─

set history=1000

set number
set relativenumber
set noshowmatch

set title 
set titleold="Vim"
"auto BufEnter * let &titlestring = hostname() . "/" . expand("%:p")
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
"}}}1

"高速ターミナル接続を行う
set ttyfast
"マクロなどの途中経過を描写しない
set lazyredraw

"-- complete

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

"-- 連番自発
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber 
	\ let c = col('.')|
	\ for n in range(1, <count>?<count>-line('.'):1) |
	\ 	exec 'normal! j' . n . <q-args> |
	\ 	call cursor('.', c) |
	\ endfor

" A better for me window management system... inspired by Spacemacs!
nnoremap <leader>wh <C-W>h
nnoremap <leader>wl <C-W>l
nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>ws :sp<CR>
nnoremap <leader>wv :vsp<CR>
nnoremap <leader>wc :close<CR>
nnoremap <leader>wn :vne<CR>
nnoremap <leader>wo :only<CR>

" vim:foldmethod=marker:foldlevel=10
