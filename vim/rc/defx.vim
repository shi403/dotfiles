
call defx#custom#option('_', {
            \ 'winwidth': 30,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ })

"call defx#custom#column('icon', {
"      \ 'directory_icon': '▸ ',
"      \ 'file_icon': '  ',
"      \ 'opened_icon': '▾ ',
"      \ 'root_icon': '  ',
"      \ })
"
"call defx#custom#column('mark', {
"      \ 'readonly_icon': '✗',
"      \ 'selected_icon': '✓',
"      \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
	setl nonu
	setl cursorline
	setl norelativenumber
	setl nonumber
	" Define mappings
	nnoremap <silent><buffer><expr><nowait> h     defx#do_action('close_tree')
	nnoremap <silent><buffer><expr><nowait> j     line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr><nowait> k     line('.') == 1         ? 'G'  : 'k'
	nnoremap <silent><buffer><expr><nowait> l     defx#do_action('open_tree', 'toggle')

	nnoremap <silent><buffer><expr><nowait> H     defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr><nowait> L     defx#do_action('open_tree_recursive')
	nnoremap <silent><buffer><expr><nowait> <C-h> defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr><nowait> <C-l> defx#do_action('close_tree')

	nnoremap <silent><buffer><expr><nowait> ~     defx#do_action('cd')
	nnoremap <silent><buffer><expr>         cd    defx#do_action('change_vim_cwd')

	nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
	nnoremap <silent><buffer><expr> e    defx#do_action('call', 'DefxChoosewin')

	nnoremap <silent><buffer><expr> c    defx#do_action('copy')
	nnoremap <silent><buffer><expr> m    defx#do_action('move')
	nnoremap <silent><buffer><expr> p    defx#do_action('paste')
	nnoremap <silent><buffer><expr> l    defx#do_action('open')
	nnoremap <silent><buffer><expr> E    defx#do_action('open', 'vsplit')
	nnoremap <silent><buffer><expr> P    defx#do_action('preview')
	nnoremap <silent><buffer><expr> K    defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N    defx#do_action('new_file')
	nnoremap <silent><buffer><expr> M    defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> C    defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
	nnoremap <silent><buffer><expr> S    defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> d    defx#do_action('remove')
	nnoremap <silent><buffer><expr> r    defx#do_action('rename')
	nnoremap <silent><buffer><expr> !    defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> x    defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> yy   defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> .    defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> ;    defx#do_action('repeat')
	nnoremap <silent><buffer><expr> q    defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> *    defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
endfunction

nnoremap <leader>e :<C-u>Defx -columns=icons:indent:filename:type 
