-- these are essential settings for all vim configs
vim.cmd[[
packadd packer.nvim
set clipboard=unnamed 
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
]]
require'persistent_undo_cfg'
require'plugins'
vim.cmd[[luafile ~/.config/nvim/.compiled_packer_config/packer_compiled.lua]]

-- set up tmux nav
require'tmux_nav_vim_cfg'

