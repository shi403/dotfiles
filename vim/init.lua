

require('options')
require('keymap')
--require('plugins')

local DEFAULT_COLORSCHEME = 'alduin'
--local ALTERNATIVE_COLORSCHEME = 'gruvbox'
local function set_colorscheme(nm)
    vim.cmd('colorscheme ' .. nm)
end
set_colorscheme(DEFAULT_COLORSCHEME)


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- lazy.nvimでmason.nvimをインストールする設定
    {
        "williamboman/mason.nvim", -- LSP Installer
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            --"nvim-lua/plenary.nvim",
        },
        event = "VeryLazy",
        config = function()
            require "mason".setup {
                ui = {
                  check_outdated_packages_on_open = false,
                  border = 'single',
                },
            }
            local mason_lspconfig = require("mason-lspconfig")
            local on_attach = function(_, bufnr)
                vim.api.nvim_buf_set_option(bufnr, "formatexpr",
                    "v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
                    -- _G.lsp_onattach_func(i, bufnr)
            end
            mason_lspconfig.setup_handlers({
                function(server_name)
                    local opts = {}
                    opts.on_attach = on_attach

                    --if server_name == "sumneko_lua" then
                    --    opts.settings = {
                    --        Lua = {
                    --            diagnostics = { globals = { 'vim' } },
                    --        }
                    --}
                    --end

                    opts.settings = {
                        omniSharp = { useGlobalMono = "always"  },
                    }

                    require("lspconfig")[server_name].setup(opts)
                end,
            })
            vim.cmd("LspStart") -- 初回起動時はBufEnterが発火しない
        end,
    },
	require "test_plugin",
})

