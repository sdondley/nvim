vim.cmd[[
nnoremap <leader><leader> :w<cr>
nnoremap <F3> :w<CR>:execute "silent !~/bin/refresh_safari quick"<CR>
nnoremap ;tn :tabnew<space>
nnoremap <leader>;so :so ~/.config/nvim/init.lua<cr>
nnoremap <silent>  <f5>  :call ToggleSyntax()<CR>

" turn off highlighting
nnoremap \\ :noh<cr>
inoremap <Leader><Leader> <c-x><c-f>
nnoremap <leader>q :q<cr>
]]
