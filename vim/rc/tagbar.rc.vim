
"ctagsコマンドの場所
let g:tagbar_ctags_bin = 'ctags'

"タグ画面を左に表示するか
"設定しない(右に表示) または 1(左に表示)
let g:tagbar_left = 0

" Default: 0
"let g:tagbar_vertical = 30

" Default: 40
let g:tagbar_width = 30

"  1: Use the maximum width available.
"  0: Use the width of the longest currently visible tag.
"  >1: Use this width in characters.
" Default: 1/0/>1
let g:tagbar_zoomwidth = 0

"タグを選択時に、画面遷移後にタグリストを閉じるか
"0(閉じない) または 1(閉じる)
let g:tagbar_autoclose = 0

" Default: 0
let g:tagbar_autofocus = 1

" Default: 1
let g:tagbar_sort = 0

" Default: 0
let g:tagbar_case_insensitive = 1

" Default: 0
let g:tagbar_compact = 1

" Default: 2
let g:tagbar_indent = 1

" Default: 1
let g:tagbar_show_visibility = 0

" Default: 0
"  0: Don't show any line numbers.
"  1: Show absolute line numbers.
"  2: Show relative line numbers.
"  -1: Use the global line number settings.
let g:tagbar_show_linenumbers = 0

" Default: 0
let g:tagbar_hide_nonpublic = 1

" Default: 0
let g:tagbar_expand = 1

" Default: 0
let g:tagbar_singleclick = 0

" Default: 99
let g:tagbar_foldlevel = 2

"let g:tagbar_iconchars = ['▶', '▼']
let g:tagbar_iconchars = ['▸', '▾']
"let g:tagbar_iconchars = ['▷', '◢']
"let g:tagbar_iconchars = ['+', '-']

" Default: 0
let g:tagbar_autoshowtag = 1

" Default: "topleft", or "rightbelow vertical" if |g:tagbar_vertical| is set
" string to use the options 'splitbelow' and 'splitright'.
let g:tagbar_previewwin_pos = "aboveleft"

" Default: 0
let g:tagbar_autopreview = 1
" for disable line numbers
"autocmd BufWinEnter * if &previewwindow | setlocal nonumber | endif

" Default: value of 'encoding'
"let g:tagbar_systemenc = 'cp936'

function! TagbarStatusFunc(current, sort, fname, flags, ...) abort
	let colour = a:current ? '%#StatusLine#' : '%#StatusLineNC#'
	let flagstr = join(flags, '')
	if flagstr != ''
		let flagstr = '[' . flagstr . '] '
	endif
	return colour . '[' . sort . '] ' . flagstr . fname
endfunction
"let g:tagbar_status_func = 'TagbarStatusFunc'

" Default: 0
let g:tagbar_silent = 1


