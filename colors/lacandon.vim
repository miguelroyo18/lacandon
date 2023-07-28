
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

let s:lacandon.white = ['#f7ecd5', 230]
let s:lacandon.black = ['#040b10', 0]

let s:fg = 'white'
let s:bg = 'black'

let s:lacandon.lightGreen = ['#90ee90', 108]
let s:lacandon.green = ['#50fa7b', 0]
let s:lacandon.darkGreen = ['#2c8160', 72]

let s:lacandon.lightBlue = ['#70acaa', 109]

let s:lacandon.yellowGreen = ['#d3d04f', 186]

let s:lacandon.red = ['#ff6d60', 0]

let s:lacandon.grey = ['#232b2b', 59]
let s:lacandon.lightGrey = ['#9da9a0', 145]

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

call s:HL('Normal', s:fg, s:bg, 'bold')

call s:HL('Folded', 'lightGreen', s:bg, 'none')

call s:HL('CursorLine', '', 'grey', 'none')
call s:HL('CursorColumn', '', 'grey')
call s:HL('ColorColumn', '', 'lightGreen')

" TODO

" Syntax highlighting

call s:HL('Comment', 'lightGrey', s:bg)
call s:HL('SpecialComment', 'red', s:bg, 'bold')
call s:HL('Todo', 'red', s:bg, 'bold')

call s:HL('Special', s:fg, s:bg, 'bold')

call s:HL('String', 'darkGreen')

call s:HL('Conditional', 'yellowGreen', '', 'bold')
call s:HL('Keyword', 'yellowGreen', '', 'bold')
call s:HL('Label', 'yellowGreen', '', 'bold')
call s:HL('Operator', 'yellowGreen', '', 'bold')
call s:HL('Repeat', 'yellowGreen', '', 'bold')
call s:HL('Statement', 'yellowGreen', '', 'bold')

call s:HL('Function', 'green', '', 'bold')
call s:HL('Identifier', 'green', '', 'bold')

call s:HL('Boolean',   'lightBlue', '', 'bold')
call s:HL('Character', 'lightBlue', '', 'bold')
call s:HL('Constant',  'lightBlue', '', 'bold')
call s:HL('Float',  'lightBlue', '', 'bold')
call s:HL('Number', 'lightBlue', '', 'bold')


" Completion menu

call s:HL('pMenu', s:fg, 'grey') 
call s:HL('pMenuSel', 'grey', s:bg, 'bold')
call s:HL('pMenuSbar', '', 'grey')
call s:HL('pMenuThumb', 'lightGreen')

" }}}
