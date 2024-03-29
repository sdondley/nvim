set signcolumn=number

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set termguicolors

highlight Pmenu   guifg=yellow guibg=#222222
highlight PmenuSel guibg=#111111 guifg=white

set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-@> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
nmap <silent> ga <Plug>(coc-codeaction-line)

highlight Folded guibg=#222222

nnoremap <expr> sw SurroundWord(nr2char(getchar()))
nnoremap <expr> sr SurroundWordRemove()
inoremap <expr> <leader>s SurroundWordI(nr2char(getchar()))
inoremap <expr> <leader>sc SurroundWordC(nr2char(getchar()))
inoremap <expr> <leader>' JumpOut()
nnoremap <expr> <leader>' JumpOut('n')

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
endfunct


