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
  use { 'junegunn/fzf', cmd = 'fzf#install()' }
  use { 'junegunn/fzf.vim', branch = 'master' }
  use 'sedm0784/vim-you-autocorrect'
  use { 'tools-life/taskwiki', branch = 'master', ft = 'markdown' }

  use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  
  use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
  use { 'yaegassy/coc-intelephense', run = 'yarn install --frozen-lockfile'}


  -- for display function signatures
  use 'ray-x/lsp_signature.nvim'
  use 'junegunn/vim-easy-align'
  use { 'ckipp01/stylua-nvim', ft = 'lua' }
  use 'rayburgemeestre/phpfolding.vim'

  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

end)
