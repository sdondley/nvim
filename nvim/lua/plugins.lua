vim.cmd[[
packadd packer.nvim
]]

local util = require 'packer.util'
return require('packer').startup( {
	function()
		use 'wbthomason/packer.nvim'
		use { 'christoomey/vim-tmux-navigator', opt = false }
		use { 'neoclide/coc.nvim', branch = 'release', ft = 'php' }
		use { 'rayburgemeestre/phpfolding.vim', ft = 'php' } end,
	config = {
		opt_default = true,
		compile_path = util.join_paths(vim.fn.stdpath('config'), '.compiled_packer_config', 'packer_compiled.lua'),
		auto_clean = false
	},
})
