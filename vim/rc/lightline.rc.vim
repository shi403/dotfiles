"
"-- lightline modify : <https://yuheikagaya.hatenablog.jp/entry/2013/09/20/232719>
"

let g:lightline = { 
	\ 'colorscheme': 'default',
	\ 'mode_map': {'c': 'NORMAL'},
	\ 'active': {
	\     'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename', 'readonly', 'modified' ] ]
	\     } ,
	\ 'component_function': {
	\     'mode': 'LightlineMode',
	\     'readonly': 'MyReadonly',
	\     'gitbranch': 'MyGitbranch'
	\     } ,
	\ 'separator': {
	\     'left' : "",
	\     'right': "" 
	\     } ,
	\ 'subseparator': {
	\     'left' : "\u2502",
	\     'right': "\u2502" 
	\     }  
	\ }
"│
function! LightlineMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"
"
function! MyGitbranch()
  try
    "if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
      return '' . gina#component#repo#branch()
      "return ' ' . fugitive#head()
      "return '[' . fugitive#head() . ']'
    "endif
  catch
  endtry
  return ''
endfunction

"
"
function! MyReadonly()
	if &ft == "help" | return ""
	elseif &readonly | return "\ue0a2"
	else             | return ""
	endif
endfunction

"
"
function! MySepalator(font, side, level)
	if s:font == 1
		if s:side == 1 return "\ue0c4"
		else           return "\ue0c5"
		endif
	else if s:font == 2
		if s:side == 1 return "\ue0c6"
		else           return "\ue0c7"
		endif
	else
		if s:side == 1 return "|"
		else           return ":"
		endif
	endif
endfunction
"
let g:lightline.tab = {
		\ 'active': [ 'tabnum', 'filename', 'modified'  ],
		\ 'inactive': [ 'tabnum', 'filename', 'modified'  ]
		\ }
let g:lightline.tab_component_function = {
		\ 'filename': 'LightlineTabFilename',
		\ 'modified': 'lightline#tab#modified',
		\ 'readonly': 'lightline#tab#readonly',
		\ 'tabnum'  : 'lightline#tab#tabnum' }
function! LightlineTabFilename(n) abort
    let bufnrs = tabpagebuflist(a:n)
    let bufnr = bufnrs[tabpagewinnr(a:n) - 1]  " first window, first appears
    "let no = a:n  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
	return title !=# '' ? '['. title . ']' : '[No Name]'
endfunction

