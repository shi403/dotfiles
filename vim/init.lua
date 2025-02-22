

require('options')
require('keymap')
require('plugins')

local DEFAULT_COLORSCHEME = 'alduin'
--local ALTERNATIVE_COLORSCHEME = 'gruvbox'
local function set_colorscheme(nm)
	vim.cmd('colorscheme ' .. nm)
end
set_colorscheme(DEFAULT_COLORSCHEME)

