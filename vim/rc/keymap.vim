
"-- Tabpage operation.
nnoremap <Space>t <Nop>
nnoremap <silent> <Space>tn :<C-u>tabnew<CR>
"nnoremap <silent> <Space>tc :<C-u><C-r>=v:count?v:count:''<CR>tabclose<CR>

"--" Tab Jump: <Space>t1 で1番左のタブ、<Space>t2 で1番左から2番目のタブにジャンプ
for n in range(1, 7)
  execute 'nnoremap <silent> <Space>t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

"map <silent> [Tag]c :tablast <bar> tabnew<CR>
"map <silent> [Tag]x :tabclose<CR>
"map <silent> [Tag]n :tabnext <CR>
"map <silent> [Tag]p :tabprevious<CR>

