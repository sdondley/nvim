vim.cmd[[packadd packer.nvim]]
local util = require 'packer.util'
require('packer').startup({function()
	use 'wbthomason/packer.nvim'
	use { 'christoomey/vim-tmux-navigator', cond = true }
	use { 'neovim/nvim-lspconfig', ft = {'php'}, config  = function() require 'lsp_config_packer' end }
	use { "ray-x/lsp_signature.nvim", config = function() require "lsp_signature".setup(cfg) end  }
end,
config = {
	opt_default = true,
	compile_path = util.join_paths(vim.fn.stdpath('config'), 'compiled_packer_config', 'packer_compiled.lua'),
	auto_clean = false
}})
vim.cmd[[ set clipboard=unnamed ]]
