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
iab args my ($verb) = process_task_args(\@_, verbose => 0);
iab $R $Rex::CLI::host
iab task task ___ => sub {<return>};<esc>kwcw


