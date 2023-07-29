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

let s:lacandon.white = ['#c6ff8a', 230]
let s:lacandon.black = ['#040b10', 0]

let s:fg = 'pureWhite'
let s:bg = 'pureBlack'

" Green
let s:lacandon.alienParasite = ['#67fe37', 119]
let s:lacandon.mountainMeadow = ['#1dad5e', 72]

" Blue 
let s:lacandon.turquoisePanic = ['#29cbbe', 80]
let s:lacandon.genoa = ['#166b60', 30]

" Yellow
let s:lacandon.coniferBlossom = ['#ffdb47', 221]

" Orange
let s:lacandon.carrot = ['#fc7445', 209]

" Grey
let s:lacandon.tundora = ['#404040', 237]

" Black
let s:lacandon.chaosBlack = ['#101010', 233]

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

" UI {{{

call s:HL('Normal', s:fg, s:bg, 'bold')

call s:HL('Folded', 'tundora', s:bg, 'none')

call s:HL('CursorLine', '', 'chaosBlack', 'none')
call s:HL('CursorColumn', '', 'chaosBlack')
call s:HL('ColorColumn', '', 'tundora')

call s:HL('MatchParen', 'chaosBlack', 'tundora', 'bold')

call s:HL('Visual', '', 'chaosBlack')

call s:HL('Search', 'chaosBlack', 'coniferBlossom', 'bold')
call s:HL('IncSearch', 'chaosBlack', 'white', 'bold')

" call s:HL('StatusLine', 'tundora', 'chaosBlack', 'bold')
" call s:HL('StatusLineNC', 'carrot', 'carrot', 'bold')

" call s:HL('Title', 'mountainMeadow')
" call s:HL('Directory', 'mountainMeadow', '', 'bold')

call s:HL('ErrorMsg', 'carrot', s:bg, 'bold')
call s:HL('ModeMsg', 'tundora', '', 'bold')
call s:HL('Question', 'tundora', '', 'bold')
call s:HL('WarningMsg', 'coniferBlossom', '', 'bold')

" }}}
" Left column {{{

call s:HL('LineNr', 'tundora', s:bg)
call s:HL('CursorLineNr', 'mountainMeadow', s:bg)
call s:HL('SignColumn', '', s:bg)

" Versioning
call s:HL('DiffAdd', 'turquoisePanic', s:bg)
call s:HL('DiffDelete', 'carrot', s:bg)
call s:HL('DiffChange', 'coniferBlossom', s:bg)
call s:HL('DiffText', 'mountainMeadow', s:bg)

" }}}
" Cursor {{{

" TODO
" Nothing seems to change
call s:HL('Cursor', 'genoa', 'genoa')

" }}}
" Syntax highlighting {{{

call s:HL('Comment', 'tundora')
" TODO
" Fix background when highlighted
call s:HL('SpecialComment', 'carrot', s:bg, 'bold')
call s:HL('Todo', 'carrot', s:bg, 'bold')

call s:HL('Special', s:fg, '', 'bold')

call s:HL('String', 'genoa')

call s:HL('Conditional', 'alienParasite', '', 'bold')
call s:HL('Keyword', 'alienParasite', '', 'bold')
call s:HL('Label', 'alienParasite', '', 'bold')
call s:HL('Operator', 'alienParasite', '', 'bold')
call s:HL('Repeat', 'alienParasite', '', 'bold')
call s:HL('Statement', 'alienParasite', '', 'bold')

call s:HL('Function', 'mountainMeadow', '', 'bold')
call s:HL('Identifier', 'mountainMeadow', '', 'bold')

call s:HL('Boolean',   'turquoisePanic', '', 'bold')
call s:HL('Character', 'turquoisePanic', '', 'bold')
call s:HL('Constant',  'turquoisePanic', '', 'bold')
call s:HL('Float',  'turquoisePanic', '', 'bold')
call s:HL('Number', 'turquoisePanic', '', 'bold')

call s:HL('PreProc',   'coniferBlossom', '', 'none')
call s:HL('Macro',     'coniferBlossom', '', 'none')
call s:HL('Define',    'coniferBlossom', '', 'none')
call s:HL('PreCondit', 'coniferBlossom', '', 'bold')

" }}}

" Completion menu

call s:HL('pMenu', s:fg, 'chaosBlack') 
call s:HL('pMenuSel', 'chaosBlack', s:bg, 'bold')
call s:HL('pMenuSbar', '', 'chaosBlack')
" call s:HL('pMenuThumb', '')

" }}}
