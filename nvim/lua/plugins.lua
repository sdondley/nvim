return require('packer').startup(function()
	use { 'wbthomason/packer.nvim', opt = false }
	use { 'christoomey/vim-tmux-navigator', opt = false }
	use { 'rayburgemeestre/phpfolding.vim', ft = 'php' }
	use { 'neoclide/coc.nvim', branch = 'release', ft = 'php' }
end)
