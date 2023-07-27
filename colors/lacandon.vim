
set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "lacandon"

" Colour palette {{{

let s:lacandon = {}

let s:lacandon.pureWhite = ['#ffffff', 15]
let s:lacandon.pureBlack = ['#000000', 16]

let s:fg = 'pureWhite'
let s:bg = 'pureBlack'

let s:lacandon.ebony = ['#546658', 102]

" }}}

" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp
    " guisp is used for undercurl and strikethrough

    let hiFunction = 'hi ' . a:group . ' '

    if strlen(a:fg)
        let colour = get(s:lacandon, a:fg)
        let hiFunction .= 'guifg=' . colour[0] . ' ctermfg=' . colour[1] . ' '
    endif

    if a:0 >= 1 && strlen(a:1)
        let colour = get(s:lacandon, a:1)
        let hiFunction .= 'guibg=' . colour[0] . ' ctermbg=' . colour[1] . ' '
    endif

    if a:0 >= 2 && strlen(a:2)
        let hiFunction .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:lacandon, a:3)
        let hiFunction .= 'guisp=' . colour[0] . ' '
    endif

    execute hiFunction
endfunction
" }}}

" Colour scheme {{{

call s:HL('Normal', 'pureWhite', 'pureBlack')

call s:HL('Folded', 'ebony', s:bg)

" }}}
