hi SpellBad ctermbg=green ctermfg=white
hi SpellCap ctermbg=green ctermfg=white
hi Folded ctermfg=White ctermbg=darkgrey
syn match UrlNoSpell "[~\/\.>:]\w\+" contains=@NoSpell
syn match UrlNoSpell "\w\+[\/!]" contains=@NoSpell
hi clear Conceal
