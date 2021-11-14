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
set spellfile=~/git_repos/dotfiles2/nvim/spell/en.utf-8.add


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
set splitright

fun! StripTrailingWhitespace()
    if &ft =~ 'ruby\|javascript\|perl'
        %s/\s\+$//e
    endif
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

"augroup Perl_Setup
"    autocmd!
"    autocmd BufNewFile   *  0r !vim_file_template <afile>
"    autocmd BufNewFile   *  :call search('^[ \t]*[#].*implementation[ \t]\+here')
"    " SD added this line per Conway's instructions in email from him
"    autocmd BufNewFile   *  :redraw
"augroup END


let b:commentChar='#'
autocmd BufNewFile,BufReadPost *.[ch]    let b:commentChar='//'
autocmd BufNewFile,BufReadPost *.py    let b:commentChar='#'
autocmd BufNewFile,BufReadPost *.*sh    let b:commentChar='#'
autocmd BufNewFile,BufReadPost *.*vim    let b:commentChar='"'
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
Plug 'junegunn/fzf.vim', { 'branch': 'master' }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'c9s/perlomni.vim'
Plug 'sedm0784/vim-you-autocorrect'
Plug 'tools-life/taskwiki'
call plug#end()
let g:taskwiki_markup_syntax = 'markdown'

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
let g:fzf_tags_command = 'ctags --languages=Perl -R --regex-Perl="/^task\s+(''*[a-zA-Z0-9_]+''*)\s{0,}/c/"'
inoremap <expr> <leader>f fzf#vim#complete#path('rg --files')

function! RipgrepFzf(query, fullscreen, dir)
  let command_fmt = 'rg -L --column --line-number --no-heading --color=always --smart-case %s %s | sed "s|%s||g" || true'
  let initial_command = printf(command_fmt, shellescape(a:query), a:dir, a:dir)
  let reload_command = printf(command_fmt, '{q}', a:dir, a:dir)
  "let spec = {'options': ['--delimiter', ':', '--with-nth', '-1', '--preview-window', '+{2}', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = {'options': [ '--preview-window' , '~2', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0, '.')
command! -nargs=* -bang RGR call RipgrepFzf(<q-args>, <bang>0, '~/scripts/lib')
command! -nargs=* -bang RGN call RipgrepFzf(<q-args>, <bang>0, fnamemodify('~', ':p') . 'notes/')
nnoremap <leader>rgg :RG<cr>
nnoremap <leader>rgr :RGR<cr> # for bastion only
nnoremap <leader>rgn :RGN<cr>
nnoremap <leader>rgt :RGT ^task '*<cr>


" Work out whether the line has a comment then reverse that condition...
"nnoremap <silent> # :call ToggleComment()<CR>j0
"vmap <silent> # :call ToggleBlock()<CR>
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
inoremap <Leader><Leader> <c-x><c-f>


"<<<<<<<<<<<<<<<<<< fzf >>>>>>>>>>>>>>>>>>>>>>>>>>>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>l :Lines<cr>
nnoremap <Leader>bl :Blines<cr>
"inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
"<<<<<<<<<<<<<<<<<< fzf end >>>>>>>>>>>>>>>>>>>>>>>


"<<<<<<<<<<<<<<<<<< vimwiki >>>>>>>>>>>>>>>>>>>>>>>>>>>

let g:vimwiki_folding='custom'
inoremap <Leader>gu <esc>:silent !~/bin/copy_safari_url.osa <cr>"+pa<space>
nnoremap <Leader>gu :silent !~/bin/copy_safari_url.osa <cr>"+p<cr>
let g:vimwiki_list=[{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'name': 'nice'}, {'path': '~/vimwiki/steve/*', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/vimwiki/client_wikis', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md', 'name': 'notes'}, ]

" also look in after/ftplugin/vimwiki.vim for additional settings

" <<<<<<<<<<<<<<<<<<<<<<<<< end: vimwiki >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"
" <<<<<<<<<<<<<<<<<< taskwiki >>>>>>>>>>>>>>>>>>>>>>>>>>>
iab *[ * [ ]
let g:taskwiki_extra_warriors={'W': {'data_location': '~/.task_work', 'taskrc_location': '~/.taskrc_work'}}
" <<<<<<<<<<<<<<<<<<<<<<<<< end: taskwiki >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
