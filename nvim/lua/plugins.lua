vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  tmux = os.getenv("TMUX") and true or false

  use { 'wbthomason/packer.nvim',
  { 'christoomey/vim-tmux-navigator',     opt = true, cond = true },
  { 'jebaum/vim-tmuxify',             opt = true, cond = true },
}
end)
