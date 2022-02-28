vim.cmd[[
packadd packer.nvim
packadd nvim-lspconfig
packadd nvim-cmp
packadd cmp-nvim-lsp
packadd cmp_luasnip
packadd LuaSnip
augroup packer_user_config
  autocmd!
  autocmd BufWritePost */plugins.lua source <afile> | PackerCompile
  autocmd BufWinLeave */plugins.lua sleep 50m
augroup end
]]

local util = require 'packer.util'
return require('packer').startup( {
	function()
		use 'wbthomason/packer.nvim'
		use { 'christoomey/vim-tmux-navigator', opt = false }
	    use { 'neovim/nvim-lspconfig', opt = true, ft = 'perl' }
        use { 'hrsh7th/nvim-cmp' } -- Autocompletion plugin
        use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
        use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
        use 'L3MON4D3/LuaSnip' -- Snippets plugin
	end,
	config = {
		opt_default = true,
		compile_path = util.join_paths(vim.fn.stdpath('config'), '.compiled_packer_config', 'packer_compiled.lua'),
		auto_clean = false
	},
})

