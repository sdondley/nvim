source ~/.config/nvim/local_customizations.vim
syntax on

set nocompatible
set ttyfast
set mouse=a
set clipboard=unnamedplus
set background=dark
set tabstop=4
set hlsearch
set incsearch
set expandtab
set foldmarker={,}
set foldmethod=marker
set number
set cpt=.,w,b,u,t
set softtabstop=4
set shiftwidth=4
set autoindent
set number
set backupdir=~/.cache/nvim
let mapleader = ';'

filetype plugin on
filetype plugin indent on

hi Folded ctermbg=black
autocmd BufWritePre FileType perl  %s/\s\+$//e

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)


set foldopen+=jump

fun! StripTrailingWhitespace()
    if &ft =~ 'ruby\|javascript\|perl'
        %s/\s\+$//e
    endif
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

let b:commentChar='#'
autocmd BufNewFile,BufReadPost *.[ch]    let b:commentChar='//'
autocmd BufNewFile,BufReadPost *.cpp    let b:commentChar='//'
autocmd BufNewFile,BufReadPost *.py    let b:commentChar='#'
autocmd BufNewFile,BufReadPost *.*sh    let b:commentChar='#'
function! Docomment ()
  "make comments on all the lines we've grabbed
  execute '''<,''>s/^\s*/&'.escape(b:commentChar, '\/').' /e'
endfunction
function! Uncomment ()
  "uncomment on all our lines
  execute '''<,''>s/\v(^\s*)'.escape(b:commentChar, '\/').'\v\s*/\1/e'
endfunction
function! Comment ()
  "does the first line begin with a comment?
  let l:line=getpos("'<")[1]
  "if there's a match
  if match(getline(l:line), '^\s*'.b:commentChar)>-1
    call Uncomment()
  else
    call Docomment()
  endif
endfunction
vnoremap <silent> <C-r> :<C-u>call Comment()<cr><cr>

call plug#begin()
Plug 'vim-syntastic/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jebaum/vim-tmuxify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf.vim'
call plug#end()

" tmux navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

"tmuxify
let g:tmuxify_custom_command = 'tmux split-window -d'
nnoremap <leader>so :so ~/.config/nvim/init.vim<cr>

highlight Status ctermbg=darkgrey ctermfg=white
set statusline=%#warningmsg#
set statusline+=-\ %{SyntasticStatuslineFlag()}
set statusline+=%#Status#
set statusline+=%=%f
"set statusline+=%#PmenuSel#
"set statusline+=%*
set laststatus=2

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ["perl"]
let g:syntastic_perl_lib_path = ['lib']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set conceallevel=2
syntax match Text /^_desc.*/ conceal
syntax match Text /^my @.*tas.*/ conceal

iab $R $Rex::CLI::host
iab args my ($verb) = process_task_args(\@_, verbose => 0);
iab task task ___ => sub {<return>};<esc>kwcw

" remember last cursor position between files
augroup redhat
autocmd!
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
augroup END
"

"====[ Use persistent undo ]=================

if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    set undodir=$HOME/.VIM_UNDO_FILES

    " Save a lot of back-history...
    set undolevels=5000

    " Actually switch on persistent undo
    set undofile

endif

" advanced fzf/ripgrep integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Work out whether the line has a comment then reverse that condition...
nnoremap <silent> # :call ToggleComment()<CR>j0
vmap <silent> # :call ToggleBlock()<CR>
function! ToggleComment ()
    " What's the comment character???
    let comment_char = exists('b:cmt') ? b:cmt : '#'

    " Grab the line and work out whether it's commented...
    let currline = getline(".")

    " If so, remove it and rewrite the line...
    if currline =~ '^' . comment_char
        let repline = substitute(currline, '^' . comment_char, "", "")
        call setline(".", repline)

    " Otherwise, insert it...
    else
        let repline = substitute(currline, '^', comment_char, "")
        call setline(".", repline)
    endif
endfunction

" Toggle comments down an entire visual selection of lines...
function! ToggleBlock () range
    " What's the comment character???
    let comment_char = exists('b:cmt') ? b:cmt : '#'

    " Start at the first line...
    let linenum = a:firstline

    " Get all the lines, and decide their comment state by examining the first...
    let currline = getline(a:firstline, a:lastline)
    if currline[0] =~ '^' . comment_char
        " If the first line is commented, decomment all...
        for line in currline
            let repline = substitute(line, '^' . comment_char, "", "")
            call setline(linenum, repline)
            let linenum += 1
        endfor
    else
        " Otherwise, encomment all...
        for line in currline
            let repline = substitute(line, '^\('. comment_char . '\)\?', comment_char, "")
            call setline(linenum, repline)
            let linenum += 1
        endfor
    endif
endfunction

" turn off highlighting
nnoremap \\ :noh<cr>
