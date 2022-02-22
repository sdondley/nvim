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

require 'mylspconfig'
require('nvim-autopairs').setup{
    fast_wrap = {
      map = '<leader>e',
      --chars = { '{', '[', '(', '"', "'" },
      --pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      --offset = 0, -- Offset from pattern match
      --end_key = '$',
      --keys = 'qwertyuiopzxcvbnmasdfghjkl',
      --check_comma = true,
      --highlight = 'Search',
      --highlight_grey='Comment'
    },
}

-- autopair with COQ
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false, map_cr = false })

vim.g.coq_settings = { keymap = { recommended = false } }

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
