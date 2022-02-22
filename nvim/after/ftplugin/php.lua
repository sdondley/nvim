vim.opt.formatoptions:remove ( "t" )
vim.opt.formatoptions:remove ( "r" )
vim.opt.formatoptions:append ( "o" )
vim.opt.formatoptions:append ( "c" )
vim.opt.formatoptions:append ( "b" )
vim.g.PHP_autoformatcomment = 0

vim.cmd[[
set signcolumn=number

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set termguicolors

highlight Pmenu   guifg=yellow guibg=#222222
highlight PmenuSel guibg=#111111 guifg=white

set completeopt = "menu,menuone,preview"

]]
