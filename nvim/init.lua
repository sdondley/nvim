-- these are essential settings for all vim configs
vim.cmd[[
syntax enable
syntax on
packadd packer.nvim
set clipboard=unnamed 
filetype plugin on
function! Exec(cmd)
	redir @a
		exec printf('silent %s',a:cmd)
	redir END
	tabnew
	norm "ap
endfunction
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set termguicolors
]]

-- set up plugins
local util = require 'packer.util'
require('packer').startup({function()
	use 'wbthomason/packer.nvim'
	use { 'christoomey/vim-tmux-navigator', opt = false }
end,
config = {
	opt_default = true,
	compile_path = util.join_paths(vim.fn.stdpath('config'), 'compiled_packer_config', 'packer_compiled.lua'),
	auto_clean = false
}})

-- set up tmux nav
require'tmux_nav_vim_cfg'
require'persistent_undo_cfg'


