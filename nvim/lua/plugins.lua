vim.cmd[[
packadd packer.nvim
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]

local util = require 'packer.util'
return require('packer').startup( {
	function()
		use 'wbthomason/packer.nvim'
		use { 'christoomey/vim-tmux-navigator', opt = false }
	end,
	config = {
		opt_default = true,
		compile_path = util.join_paths(vim.fn.stdpath('config'), 'compiled_packer_config', 'packer_compiled.lua'),
		auto_clean = false
	},
})
