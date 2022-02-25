-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  tmux = os.getenv("TMUX") and true or false
  use {
    { 'wbthomason/packer.nvim',		    opt = true },
    { 'christoomey/vim-tmux-navigator', opt = true, cond = true },
    { 'jebaum/vim-tmuxify', 		    opt = true, cond = true },
    { 'c9s/perlomni.vim', 		        opt = true, ft = {"perl"} },
    { 'windwp/nvim-autopairs', 		    opt = true, ft = {'php', 'perl'}, config = function() require('autopairs_cfg') end },
    { 'neovim/nvim-lspconfig', 		    opt = true, },
    { 'vimwiki/vimwiki', 		        opt = true, ft = 'markdown', branch = 'dev' },
    { 'junegunn/fzf', 			        opt = true, cond = true, cmd = 'fzf#install()' },
    { 'junegunn/fzf.vim', 		        opt = true, cond = true, branch = 'master', },
    { 'sedm0784/vim-you-autocorrect', 	opt = true },
    { 'tools-life/taskwiki', 		    opt = true, ft = 'markdown', branch = 'master' },
    { 'ms-jpq/coq_nvim', 		        opt = true, branch = 'coq', },
    { 'ms-jpq/coq.artifacts',  		    opt = true, branch = 'artifacts' },
    { 'neoclide/coc.nvim', 		        opt = true, ft = {'php'}, branch = 'master' },
    { 'yaegassy/coc-intelephense',  	opt = true, ft = {'php'}, run = 'yarn install --frozen-lockfile'},
    { 'ray-x/lsp_signature.nvim', 	    opt = true, ft = {'php'} },
    { 'junegunn/vim-easy-align', 	    opt = true, ft = {'php', 'perl'} },
    { 'ckipp01/stylua-nvim', 		    opt = true, ft = {'lua'} },
    { 'rayburgemeestre/phpfolding.vim', opt = true, ft = {'php'} },
    { "folke/trouble.nvim", 		    opt = true, requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
	}
	end
    }
}
end)

