vim.cmd[[
packadd packer.nvim
set clipboard=unnamed 
]]

local util = require 'packer.util'
require('packer').startup({function()
	use 'wbthomason/packer.nvim'
	use { 'christoomey/vim-tmux-navigator', cond = true }
end,
config = {
	opt_default = true,
	compile_path = util.join_paths(vim.fn.stdpath('config'), 'compiled_packer_config', 'packer_compiled.lua'),
	auto_clean = false
}})
