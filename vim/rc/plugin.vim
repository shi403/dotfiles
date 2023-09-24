
"------------------------------------------------------------------------ 
" Disable Default Plugins:  {{{
"------------------------------------------------------------------------ 
"let g:loaded_2html_plugin      = 1 
"let g:loaded_logiPat           = 1 
"let g:loaded_getscriptPlugin   = 1 
"let g:loaded_gzip              = 1 
"let g:loaded_man               = 1 
"let g:loaded_matchit           = 1 
"let g:loaded_matchparen        = 1 
"let g:loaded_netrwFileHandlers = 1 
"let g:loaded_netrwPlugin       = 1 
"let g:loaded_netrwSettings     = 1 
"let g:loaded_rrhelper          = 1 
"let g:loaded_shada_plugin      = 1 
"let g:loaded_spellfile_plugin  = 1 
"let g:loaded_tarPlugin         = 1 
"let g:loaded_tutor_mode_plugin = 1 
"let g:loaded_vimballPlugin     = 1 
"let g:loaded_zipPlugin         = 1 
" }}} Disable Default Plugins: 

" check the specified plugin is installed
function! s:is_plugged(name)
	return exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
endfunction

let $CACHE = expand('~/.cache') 

call plug#begin('$CACHE/vim-plug')

	"-- root common
	Plug 'vim-jp/vimdoc-ja'

	"-- tag
	Plug 'majutsushi/tagbar'

	"-- visual usefull
	Plug 'itchyny/lightline.vim'
	Plug 'LeafCage/foldCC'

	Plug 'ryanoasis/vim-devicons'
	Plug 'scrooloose/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
	"Plug 'nixprime/cpsm'

	Plug 'Shougo/unite.vim'
	"Plug 'Shougo/vimfiler.vim'
	if has('nvim')
		Plug 'Shougo/defx.nvim'
	else
		Plug 'Shougo/defx.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	Plug 'kristijanhusak/defx-icons'
	Plug 't9md/vim-choosewin'

	"-- filetype
	Plug 'plasticboy/vim-markdown' , { 'for': 'markdown' }
	Plug 'kannokanno/previm' , { 'for': 'markdown' }
	Plug 'dag/vim-fish'

	"-- filetype:systemverilog + ctags
	Plug 'nachumk/systemverilog.vim'
	Plug 'vhda/verilog_systemverilog.vim'
	Plug 'ervandew/supertab'

	"-- syntax check
	Plug 'scrooloose/syntastic'

	"-- script quick-run
	Plug 'thinca/vim-quickrun'

	"-- grep/search faster
	Plug 'rking/ag.vim'

	Plug 'tyru/capture.vim'

	"-- コンテキストに合わせてftを切り替え
	"Plug 'osyo-manga/vim-precious'
	"-- カーソル位置のコンテキストのftを判定するライブラリ
	"Plug 'Shougo/context_filetype.vim'

	"-- git control
	Plug 'lambdalisue/gina.vim'
	Plug 'tpope/vim-fugitive'

	"-- testing...
	Plug 'mh21/errormarker.vim'
	Plug 'jpalardy/vim-slime'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'yegappan/grep'
	Plug 'lilydjwg/colorizer'

	"-- .vim
	"Plug 'vim-scripts/taglist.vim'

	"-- .vim_common
	Plug 'junegunn/vim-easy-align'


call plug#end()

" common plugin settings {{{
let g:Align_xstrlen = 3

" }}}
"-------------------------------------------------------------------------
"--" C Foldings: 折り畳み設定 {{{1
"---------------------------------------------------------------------------
" LeafCage/foldCC:
"-- foldmethodについて
"-- manual      折り畳みは手動で設定する。(.viminfoファイルに情報が記録される？)
"-- indent      等しいインデントの行で折り畳みを作る。
"-- expr        オプション 'foldexpr' で深さを設定する。
"-- marker      マーカーで折り畳みを指定する。
"-- syntax      構文強調表示のキーワードを使って指定する。
"-- diff        変更されていないテキストを折り畳む。

"-- hilight
"hi Folded     gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey30 guifg=     Grey80
"hi FoldColumn gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey   guifg=     DarkBlue

set commentstring=%s

set foldmethod=syntax
set foldlevel=1
set foldnestmax=2

"-- verilog_systemverilog
let g:verilog_syntax_fold_lst = 'package,class,function,task,interface,define'

let perl_fold=1

"-- Insert-modeの時だけmanual、それ以外syntax
augroup foldmethod-syntax "{{{
	autocmd!
	autocmd InsertEnter * if &l:foldmethod ==# 'syntax'
	\                   |   setlocal foldmethod=manual
	\                   | endif
	autocmd InsertLeave * if &l:foldmethod ==# 'manual'
	\                   |   setlocal foldmethod=syntax
	\                   | endif
augroup END "}}}

"-- FoldingMarkerを挿入する
nnoremap  z[     :<C-u>call <SID>put_foldmarker(0)<CR>
nnoremap  z]     :<C-u>call <SID>put_foldmarker(1)<CR>
function! s:put_foldmarker(foldclose_p) "{{{
	let crrstr = getline('.')
	let padding = crrstr==#'' ? '' : crrstr=~#'\s$' ? '' : ' '
	let [cms_start, cms_end] = ['', '']
	let outside_a_comment_p = synIDattr(synID(line('.'), col('$')-1, 1), 'name') !~? 'comment'
	if outside_a_comment_p
		let cms_start = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
		let cms_end = matchstr(&cms,'\V%s\zs\.\+')
	endif
	let fmr = split(&fmr, ',')[a:foldclose_p]. (v:count ? v:count : '')
	exe 'norm! A'. padding. cms_start. fmr. cms_end
endfunction "}}}

set foldtext=FoldCCtext()
set foldcolumn=5
set fillchars=vert:\|
let g:foldCCtext_maxchars = 158
let g:foldCCtext_head = '"-"'
let g:foldCCtext_tail = '"-[ ".(v:foldend-v:foldstart+1)." lines  Lv".(v:foldlevel)." ]-"'
let g:foldCCtext_enable_autofdc_adjuster = 1
let g:foldCCnavi_maxchars = 120

"}}}1 " Foldings:

"-------------------------------------------------------------------------
" Netrw:{{{1
"-------------------------------------------------------------------------
if s:is_plugged('vimfiler.vim')

	let g:vimfiler_as_default_explorer=1
	let g:vimfiler_safe_mode_by_default=0

	call vimfiler#custom#profile('default', 'context', { 
			\ 'safe' : 0, 
			\ 'auto_expand' : 1, 
			\ 'parent' : 0, 
			\ }) 

	if has('win32') || has('win64') 
		" For Windows. 
		let g:vimfiler_detect_drives = [ 
				\ 'C:/', 'D:/', 'E:/', 'F:/', 'G:/', 'H:/', 'I:/', 
				\ 'J:/', 'K:/', 'L:/', 'M:/', 'N:/'] 
		" Use trashbox. 
		let g:unite_kind_file_use_trashbox = 1 
	else 
		" Like Textmate icons. 
		let g:vimfiler_tree_leaf_icon     = ' ' 
		let g:vimfiler_tree_opened_icon   = '▾' 
		let g:vimfiler_tree_closed_icon   = '▸' 
		let g:vimfiler_file_icon          = ' ' 
		let g:vimfiler_readonly_file_icon = '✗' 
		let g:vimfiler_marked_file_icon   = '✓' 
	endif 

	" カーソル位置の単語をgrep検索
	nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

	" unite grep に ag(The Silver Searcher) を使う
	if executable('ag')
		let g:unite_source_grep_command = 'ag'
		let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
		let g:unite_source_grep_recursive_opt = ''
	endif

	nnoremap <C-e> :VimFiler -split -simple -winwidth=35 -no-quit<CR> 
else "-- no vimfiler

	let g:WebDevIconsUnicodeDecorateFolderNodes = 1

endif

"}}}1

"-------------------------------------------------------------------------
" Tagbar Taglist:{{{1
"-------------------------------------------------------------------------
"source ~/.vim/rc/taglist.rc.vim

if s:is_plugged('tagbar')

	execute 'source' expand('~/.vim/rc/tagbar.rc.vim')

else

endif

"}}}1 " Taglist:

"-------------------------------------------------------------------------
" StatusLine TabLine:{{{1
"-------------------------------------------------------------------------
set laststatus=2
set showtabline=2 " 常にタブラインを表示
set cmdheight=2

"-- }}}1" Status Line:

" vim:foldmethod=marker:foldlevel=10
