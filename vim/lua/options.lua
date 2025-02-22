
local opt = vim.opt

opt.helplang = "ja,en"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
--opt.ambiwidth = 'double'

--opt.mouse = 'a'

-------------------------------------------------------------------------
--" View: {{{1
-------------------------------------------------------------------------
opt.background = "dark"

opt.cmdheight = 2
opt.laststatus = 2
opt.showtabline = 2
opt.foldcolumn = 'auto'
opt.showmode = false

opt.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%"
opt.wrap   = false
opt.number = true
opt.relativenumber = true

opt.scrolloff = 4
opt.inccommand = 'split'

opt.title = true
opt.titleold = ''
--"auto BufEnter * let &titlestring = hostname() . "/" . expand("%:p")
--opt.titlestring = '%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)'

--" Tab可視化:
opt.list = true
--opt.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%"

--vim.cmd("call setcellwidths([[0x2502, 0x2502, 1], [0x2194, 0x2199, 2]])")
--vim.cmd("call setcellwidths([[0x2500, 0x2500, 1]])")
--vim.cmd("call setcellwidths([[0x251c, 0x251c, 1]])")
--vim.cmd("call setcellwidths([[0x2524, 0x2524, 1]])")
--vim.cmd("call setcellwidths([[0x256d, 0x256d, 1]])")
--vim.cmd("call setcellwidths([[0x256e, 0x256e, 1]])")
--vim.cmd("call setcellwidths([[0x256f, 0x256f, 1]])")
--vim.cmd("call setcellwidths([[0x2570, 0x2570, 1]])")

--opt.fillchars = "stl:^,stlnc:=,diff:-,vert:│"
--opt.fillchars = "stl:^,stlnc:=,vert:│,fold:-,diff:-"

opt.tabstop = 4
opt.shiftwidth = 4
--" ポップアップメニューに表示される項目数
opt.pumheight = 30

--" Path delimiter use '/' for windows
opt.shellslash = true

-------------------------------------------------------------------------
--" W Search Options: {{{1
-------------------------------------------------------------------------
opt.hlsearch   = true
opt.incsearch  = false    --" do incremental searching
opt.ignorecase = true     --" 検索時に大文字小文字を無視
opt.smartcase  = true     --" 大文字小文字の両方が含まれている場合は大文字小文字を>
opt.wrapscan   = true 

--" 100 桁以上はハイライトしない
opt.synmaxcol = 200

-------------------------------------------------------------------------
--" X Complete: {{{1
-------------------------------------------------------------------------
opt.showcmd     = true		    --" display incomplete commands
opt.wildchar    = ('\t'):byte()
opt.wildmenu    = true
--opt.wildmode    = 'list:longest,list:full'          --" zsh like complete
opt.wildmode    = 'longest:full'
opt.wildignore:append('.DS_Store')
opt.wildignore:append('.git,.svn')
opt.wildignore:append('*.o,*.obj,*.rbc,*.dll,*.exe')
opt.wildignore:append('*.png,*.jpg,*.gif')
opt.wildignore:append('*.so,*.sw?')
opt.wildignore:append('*.out,*.aux')
opt.wildignore:append('*.spl')
opt.wildignore:append('*.luac,*.jar,*.pyc,.class')
opt.completeopt = 'menuone,preview'
--opt.completeopt = { "menuone", "noselect" }
opt.complete    = '.,w,b,u,t,i,k'

opt.clipboard = "unnamedplus"

opt.conceallevel = 0
opt.smartindent = true
opt.termguicolors = true
opt.timeoutlen = 300
opt.swapfile = false
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.winblend = 0

opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work


--" vim:fdm=marker:fdl=10
