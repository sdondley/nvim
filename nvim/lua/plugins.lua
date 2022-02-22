-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'christoomey/vim-tmux-navigator'
  use 'jebaum/vim-tmuxify'
  use { 'c9s/perlomni.vim', ft = "perl" }
  use 'windwp/nvim-autopairs'
  use 'neovim/nvim-lspconfig'
  use { 'vimwiki/vimwiki', branch = 'dev', ft = 'markdown' }
  use { 'junegunn/fzf.vim', branch = 'master' }
  use 'sedm0784/vim-you-autocorrect'
  use { 'tools-life/taskwiki', branch = 'master', ft = 'markdown' }
  use { 'junegunn/fzf', cmd = 'fzf#install()' }
  use { 'ms-jpq/coq_nvim', branch = 'coq' }

  use { 'ckipp01/stylua-nvim', ft = 'lua' }
end)
