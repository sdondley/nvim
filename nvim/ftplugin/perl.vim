packadd syntastic

set statusline+=-\ %{SyntasticStatuslineFlag()}
let g:syntastic_enable_perl_checker = 1
let g:syntastic_enable_raku_checker = 1
let g:syntastic_raku_checkers = ["raku"]
let g:syntastic_raku_lib_path = ['lib']
let g:syntastic_perl_lib_path = ['lib']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set foldmethod=syntax
set foldlevelstart=1
let perl_fold=1
let perl_nofold_packages=1
let perl_fold_anonymous_subs=1

set foldmarker={,}
set foldmethod=marker

" keep this line last
set syntax=perl
"let perl_fold_blocks=1

" abbreviations
"iab args my ($verb) = process_task_args(\@_, verbose => 0);
"iab $R $Rex::CLI::host
"iab task task ___ => sub {<return>};<esc>kwcw

hi Folded ctermbg=black
