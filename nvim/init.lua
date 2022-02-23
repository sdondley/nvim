vim.g.mapleader = ";"
vim.cmd([[
source ~/.config/nvim/local_customizations.vim
inoremap <leader>; <esc>%%a
nnoremap <leader>w :w<cr>

nnoremap \\ :noh<cr>
inoremap <Leader><Leader> <c-x><c-f>

"tmuxify
let g:tmuxify_custom_command = 'tmux split-window -h'
let g:file_name = expand('%:p')
let g:file = @%
let g:tmuxify_run = { 'raku': '/Users/stevedondley/run_perl6_tests.bash ' . g:file_name . ' ' . g:file}

" tmux navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <c-h> :up<cr>:TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :up<cr>:TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :up<cr>:TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :up<cr>:TmuxNavigateRight<cr>
inoremap <silent> <c-h><c-h> <esc>:w<cr>:TmuxNavigateLeft<cr>
inoremap <silent> <c-j><c-j> <esc>:w<cr>:TmuxNavigateDown<cr>
inoremap <silent> <c-k><c-k> <esc>:w<cr>:TmuxNavigateUp<cr>
inoremap <silent> <c-l><c-l> <esc>:w<cr>:TmuxNavigateRight<cr>

"source ~/.config/nvim/plugins.vim

if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    set undodir=$HOME/.VIM_UNDO_FILES

    " Save a lot of back-history...
    set undolevels=5000

    " Actually switch on persistent undo
    set undofile

endif

" jump back to last cursor position
augroup redhat
autocmd!
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
augroup END

function! RipgrepFzf(query, fullscreen, dir)
    let command_fmt = 'rg -L -g "*.{md}" --hidden --column --line-number --no-heading --color=always --smart-case %s %s | sed "s|%s||g" || true'
  let initial_command = printf(command_fmt, shellescape(a:query), a:dir, a:dir)
  let reload_command = printf(command_fmt, '{q}', a:dir, a:dir)
  "let spec = {'options': ['--delimiter', ':', '--with-nth', '-1', '--preview-window', '+{2}', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = {'options': [ '--preview-window' , '~2', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call  RipgrepFzf(<q-args>, <bang>0, './')
command! -nargs=* -bang RGN call RipgrepFzf(<q-args>, <bang>0, fnamemodify('~', ':p') . 'notes/')
command! -nargs=* -bang RGC call RipgrepFzf(<q-args>, <bang>0, fnamemodify('~', ':p') . 'git_repos/websites/climate_change_chat/')
command! -nargs=* -bang RGR call RipgrepFzf(<q-args>, <bang>0, '~/scripts/lib')

" search in current directory
nnoremap <leader>rgg :RG<cr>

" for bastion only
nnoremap <leader>rgr :RGR<cr>

" search through notes directory
nnoremap <leader>rgn :RGN<cr>
nnoremap <leader>rc :RGC<cr>

 " search for tasks
nnoremap <leader>rgt :RGT ^task '*<cr>
"autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()
]])
require("plugins")
HOME = os.getenv("HOME")
vim.opt.syntax = "off"
vim.opt.ttyfast = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.g.number = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.background = "dark"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backupdir = HOME .. "/.cache/nvim"
vim.opt.timeoutlen = 500
vim.g.complete = ".,w,b,u.t"


require('my_autopairs_cfg')
require("mylspconfig")
require('my_lspsignature_cfg' )
require("lsp_signature").setup(cfg)

--vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
