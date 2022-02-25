require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use { 'christoomey/vim-tmux-navigator', cond = true }
	use { 'neovim/nvim-lspconfig', ft = {'php'}, config  = function() require 'lsp_config_packer' end }
	use { "ray-x/lsp_signature.nvim", config = function() require "lsp_signature".setup(cfg) end  }
end)
vim.cmd[[
set clipboard=unnamed
]]
