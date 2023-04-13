
--" 検索後は画面の中心に移動
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

--" tab 
for n = 1, 9 do
  vim.keymap.set('n', '<Space>t'..n, ':<C-u>tabnext'..n..'<CR>', { silent = true, noremap = true })
end

--" A better for me window management system... inspired by Spacemacs!
vim.keymap.set('n', '<leader>wh', '<C-W>h', {noremap = true})
vim.keymap.set('n', '<leader>wl', '<C-W>l', {noremap = true})
vim.keymap.set('n', '<leader>wj', '<C-W>j', {noremap = true})
vim.keymap.set('n', '<leader>wk', '<C-W>k', {noremap = true})
vim.keymap.set('n', '<leader>ws', ':sp<CR>', {noremap = true})
vim.keymap.set('n', '<leader>wv', ':vsp<CR>', {noremap = true})
vim.keymap.set('n', '<leader>wc', ':close<CR>', {noremap = true})
vim.keymap.set('n', '<leader>wn', ':vne<CR>', {noremap = true})
vim.keymap.set('n', '<leader>wo', ':only<CR>', {noremap = true})

--" FoldingMarkerを挿入する
--vim.keymap.set('n', 'z[', ':<C-u>call <SID>put_foldmarker(0)<CR>', {noremap =true})
--vim.keymap.set('n', 'z]', ':<C-u>call <SID>put_foldmarker(1)<CR>', {noremap =true})

--function put_foldmarker(foldclose_p) --"{{{
--	crrstr = vim.fn.getline('.')
--	if crrstr == '' then
--		padding = ''
--	elseif string.match(crrstr, '%s$') ~= nil then
--		padding = ''
--	else
--		padding = ' '
--	end
--	cms_start = ''
--	cms_end = ''
--	outside_a_comment_p = string.match(string.lower(vim.fn.synIDattr(vim.fn.synID(vim.fn.line('.'), vim.fn.col('$')-1, 1), 'name')), 'comment')
--	if outside_a_comment_p == nil then
--		cms_start = vim.fn.matchstr(vim.o.commentstring,[['\V\s\*\zs\.\+\ze%s']])
--		cms_end   = vim.fn.matchstr(vim.o.commentstring,[['\V%s\zs\.\+']])
--	end
--	fmr = vim.fn.split(vim.o.foldmarker, ',')[foldclose_p] .. ((vim.v.count) and (vim.v.count) or (''))
--	vim.cmd('norm! A'.. padding .. cms_start .. fmr .. cms_end)
--end --"}}}

--vim.cmd([[
--function! s:put_foldmarker(foldclose_p) "{{{
--	let crrstr = getline('.')
--	let padding = crrstr==#'' ? '' : crrstr=~#'\s$' ? '' : ' '
--	let [cms_start, cms_end] = ['', '']
--	let outside_a_comment_p = synIDattr(synID(line('.'), col('$')-1, 1), 'name') !~? 'comment'
--	if outside_a_comment_p
--		let cms_start = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
--		let cms_end = matchstr(&cms,'\V%s\zs\.\+')
--	endif
--	let fmr = split(&fmr, ',')[a:foldclose_p]. (v:count ? v:count : '')
--	exe 'norm! A'. padding. cms_start. fmr. cms_end
--endfunction "}}}
--]])
