-------------------------------------------------------------------------- 
--" Disable Default Plugins:  {{{1
-------------------------------------------------------------------------- 
--vim.g.loaded_2html_plugin      = 1 
--vim.g.loaded_logiPat           = 1 
--vim.g.loaded_getscriptPlugin   = 1 
--vim.g.loaded_gzip              = 1 
--vim.g.loaded_man               = 1 
--vim.g.loaded_matchit           = 1 
--vim.g.loaded_matchparen        = 1 
--vim.g.loaded_netrwFileHandlers = 1 
--vim.g.loaded_netrwPlugin       = 1 
--vim.g.loaded_netrwSettings     = 1 
--vim.g.loaded_rrhelper          = 1 
--vim.g.loaded_shada_plugin      = 1 
--vim.g.loaded_spellfile_plugin  = 1 
--vim.g.loaded_tarPlugin         = 1 
--vim.g.loaded_tutor_mode_plugin = 1 
--vim.g.loaded_vimballPlugin     = 1 
--vim.g.loaded_zipPlugin         = 1 
-- }}} Disable Default Plugins: 

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " 

require("lazy").setup({

	-- root common
	"vim-jp/vimdoc-ja",

	-- tag
	'majutsushi/tagbar',

	--  
	'thinca/vim-quickrun',
	'junegunn/vim-easy-align',
	'LeafCage/foldCC',
	'andymass/vim-matchup',
  
	-- filer
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim', },
	},
	{
	    "nvim-telescope/telescope-file-browser.nvim",
	    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- filetype
	--'nachumk/systemverilog.vim',
	{
		'vhda/verilog_systemverilog.vim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.g.verilog_syntax_fold_lst = 'package,class,function,task,interface,define'
		end
	},

	{'hrsh7th/nvim-cmp', event = 'InsertEnter, CmdlineEnter'},
	{'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter'}, 
	{'hrsh7th/cmp-buffer', event = 'InsertEnter'},
	{'hrsh7th/cmp-path', event = 'InsertEnter'},
	{'hrsh7th/cmp-vsnip', event = 'InsertEnter'},
	{'hrsh7th/cmp-cmdline', event = 'ModeChanged'}, --これだけは'ModeChanged'でなければまともに動かなかった。
	{'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter'},
	{'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter'},
	{'hrsh7th/cmp-calc', event = 'InsertEnter'},
	{'onsails/lspkind.nvim', event = 'InsertEnter'},
	{'hrsh7th/vim-vsnip', event = 'InsertEnter'},
	{'hrsh7th/vim-vsnip-integ', event = 'InsertEnter'},
	{'rafamadriz/friendly-snippets', event = 'InsertEnter'},

	'ervandew/supertab',

	"tpope/vim-fugitive",
	"tpope/vim-repeat",

	-- Colorschemes
	"EdenEast/nightfox.nvim",
	--"AlessandroYorba/Alduin",
	"4513ECHO/vim-colors-hatsunemiku",
	"morhetz/gruvbox",

	'Shougo/defx.nvim',
	{
		'nvim-tree/nvim-tree.lua',
		config = function()
			require("nvim-tree").setup()
			require("nvim-tree.api").tree.open()
		end
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
})


if vim.fn.has("gui_vimr") == 0 then
	require("nvim-tree").setup {
		-- Here goes some VimR specific settings like
		open_on_setup_file = true
	}
end

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

-- open file_browser with the path of the current buffer
vim.keymap.set(
  "n",
  "<leader>fe",
  ":<C-u>Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
--local fb_actions = require "telescope".extensions.file_browser.actions
--require('telescope').setup {
--  extensions = {
--    file_browser = {
--      mappings = {
--        ["n"] = {
--          ["<C-a>"] = fb_actions.create,
--          ["<C-d>"] = function(prompt_bufnr)
--              -- your custom function logic here
--              ...
--            end
--        }
--      }
--    }
--  }
--}

local cmp = require('cmp')
local lspkind = require('lspkind')

 cmp.setup({
   snippet = {
     expand = function(args)
       vim.fn['vsnip#anonymous'](args.body)
     end
   },

   window = {
      completion = cmp.config.window.bordered({
        border = 'single'
    }),
      documentation = cmp.config.window.bordered({
        border = 'single'
    }),
   },

   mapping = cmp.mapping.preset.insert({
     ['<Tab>'] = cmp.mapping.select_next_item(),
     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
     ['<C-f>'] = cmp.mapping.scroll_docs(4),
     ['<C-Space>'] = cmp.mapping.complete(),
     ['<C-e>'] = cmp.mapping.abort(),
     ['<CR>'] = cmp.mapping.confirm({ select = true }),
   }),

 formatting = {
   format = lspkind.cmp_format({
     mode = 'symbol',
     maxwidth = 50,
     ellipsis_char = '...',
   })
  },

 sources = cmp.config.sources({
   { name = 'nvim_lsp' },
   { name = 'vsnip' },
   { name = 'nvim_lsp_signature_help' },
   { name = 'calc' },
  }, {
   { name = 'buffer', keyword_length = 2 },
  })
 })

 cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
  { name = 'nvim_lsp_document_symbol' }
  }, {
   { name = 'buffer' }
  })
 })

 cmp.setup.cmdline(':', {
 mapping = cmp.mapping.preset.cmdline(),
 sources = cmp.config.sources({
   { name = 'path' }
  }, {
   { name = 'cmdline', keyword_length = 2 }
  })
 })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.cmd('let g:vsnip_filetypes = {}')

