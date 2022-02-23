let b:match_words .= '<?php:[^-]>'
set matchpairs-=<:>
let b:match_words = substitute(b:match_words, '<:>', '<:\@<=[^-]>', '')
