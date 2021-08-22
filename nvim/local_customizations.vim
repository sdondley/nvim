runtime! debian.vim

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" clipboard-like behavior with temp file
nmap <leader>p :r! cat /tmp/vitmp<CR>
nmap <silent> yy yy:call writefile(split(getreg('"'), '\n'), '/tmp/vitmp')<cr>
nmap <silent> dd dd:call writefile(split(getreg('"'), '\n'), '/tmp/vitmp')<cr>
vmap <silent> yy yy:call writefile(split(getreg('"'), '\n'), '/tmp/vitmp')<cr>
vmap <silent> dd dd:call writefile(split(getreg('"'), '\n'), '/tmp/vitmp')<cr>

