
" 検索後は画面の中心に移動
nmap n nzz
nmap N Nzz

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"-- マウモード有効/無効モード
nnoremap <silent> ,mm :<C-u>set mouse=a<CR>
nnoremap <silent> ,mn :<C-u>set mouse=<CR>

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

