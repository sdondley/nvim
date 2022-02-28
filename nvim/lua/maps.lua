vim.cmd[[
" function keys
nnoremap <silent> <F3> :w<CR>:execute "silent !~/bin/refresh_safari quick"<CR>
nnoremap <silent> <F5> :call ToggleSyntax()<CR>
nnoremap <leader><leader> :w<cr>
nnoremap ;tn :tabnew<space>
nnoremap <leader>;so :so ~/.config/nvim/init.lua<cr>

" turn off highlighting
nnoremap \\ :noh<cr>

nnoremap <leader>q :q<cr>
]]
