set nocp
filetype plugin on
let mapleader = ';'

nnoremap <expr> s Surround(nr2char(getchar()))

function! Surround(character)
	
        if (a:character == '(')
		let close = ')'
	elseif (a:character == '[')
		let close = ']'
	elseif (a:character == '<')
		let close = '>'
	elseif (a:character == '{')
		let close = '}'
	elseif (a:character == '')
		let close = ''
	elseif (a:character == '“')
		let close = '”'
	elseif (a:character == '‘')
		let close = '’'
	else
		let close = a:character
	endif
	return 'mabi' . a:character . 'ea' . close . '`al'
endfunc
