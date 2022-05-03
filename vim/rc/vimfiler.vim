
"-------------------------------------------------------------------------
" Netrw:{{{1
"-------------------------------------------------------------------------
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

call vimfiler#custom#profile(
	\ 'default',
	\ 'context', { 
		\ 'safe' : 0, 
		\ 'auto_expand' : 1, 
		\ 'parent' : 0, 
		\ }) 

if IsWindows()
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
"}}}1

