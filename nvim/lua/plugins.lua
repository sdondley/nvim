vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {
    { 'wbthomason/packer.nvim',		    opt = false },
    { 'christoomey/vim-tmux-navigator',	    opt = true, cond = true },
    { 'jebaum/vim-tmuxify', 		    opt = true, cond = true },
    --{ 'vimwiki/vimwiki', 		    opt = true, ft = 'markdown', branch = 'dev' },
    --{ 'tools-life/taskwiki', 		    opt = true, ft = 'markdown', branch = 'master' },
}
end)

