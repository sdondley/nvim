vim.cmd([[
source ~/.config/nvim/local_customizations.vim
"source ~/.config/nvim/plugins.vim
]])
require("plugins")
HOME = os.getenv("HOME")
vim.opt.syntax = "on"
vim.opt.ttyfast = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.background = "dark"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backupdir = HOME .. "/.cache/nvim"
vim.opt.timeoutlen = 500
vim.g.complete = ".,w,b,u.t"
vim.g.mapleader = ";"

local opts = { noremap = true, silent = true }
vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", '<cmd>lua require("stylua-nvim").format_file()<CR>', opts)


local nvim_lsp = require 'lspconfig'

nvim_lsp.intelephense.setup({
    settings = {
        intelephense = {
            stubs = { 
                "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "wordpress-globals",
                "wp-cli",
                "genesis",
                "polylang"
            },
            files = {
                maxSize = 5000000;
            };
        };
    }
});

