function! JumpOut(...)
    let foo = a:0
    let coi = FindCharOfInterest()
    let close = GetClose(coi)
    if (foo == 0)
        return "f" . close . 'a'
    else
        return "f" . close . 'l'
    endif

endfunc

function! SurroundWordC(character)
    let close = GetClose(a:character)
	return close . '' . "bi" . a:character . 'ela, '
endfunc

function! SurroundWordI(character)
    let close = GetClose(a:character)
	return close . '' . "bi" . a:character . 'ela '
endfunc

function! SurroundWord(character)
    let close = GetClose(a:character)
	return "m'bi" . a:character . 'ea' . close . "`'l"
endfunc

function! FindCharOfInterest()
    let cc = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let count = 0
    while (cc != '"' && cc != "'" && cc != "(" && cc != "{" && cc != '[' && (col('.') - count >= 1))
        let count = count + 1
        let cc = matchstr(getline('.'), '\%' . (col('.') - count) . 'c.')
    endwhile
    return cc
            
endfunc

function! SurroundWordRemove()
    let char = FindCharOfInterest()
    let close = GetClose(a:char)
	return 'maF' . char . 'xf' . close . 'x`ah'
endfunc

function! GetClose(character)
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
    return close
endfunc
