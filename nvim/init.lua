-- these are essential settings for all vim configs
vim.cmd[[
syntax enable
syntax on
filetype plugin indent on
set clipboard=unnamed 
"filetype plugin indent on
function! Exec(cmd)
	redir @a
		exec printf('silent %s',a:cmd)
	redir END
	tabnew
	norm "ap
endfunction
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set termguicolors
]]

require'persistent_undo_cfg'
require'plugins'
vim.cmd[[luafile ~/.config/nvim/compiled_packer_config/packer_compiled.lua]]

-- set up tmux nav
require'tmux_nav_vim_cfg'


