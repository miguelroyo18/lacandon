" File: lacandon.vim
" Author: Miguel Royo
" Description: A Vim colour scheme based on the colours of the Lacandon Jungle.

" Preamble {{{

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "lacandon"

" }}}
" Colour palette {{{

let s:lacandon = {}

let s:lacandon.pureWhite = ['#ffffff', 15]
let s:lacandon.pureBlack = ['#000000', 16]

" Green
let s:lacandon.alienParasite = ['#67fe37', 119]
let s:lacandon.mountainMeadow = ['#1dad5e', 72]

" Blue 
let s:lacandon.turquoisePanic = ['#29cbbe', 80]
let s:lacandon.genoa = ['#166b60', 30]

" Purple
let s:lacandon.heraBlue= ['#8b7aea', 141]

" Yellow
let s:lacandon.coniferBlossom = ['#ffe666', 228]

" Orange
let s:lacandon.carrot = ['#fc7445', 209]

" Grey
let s:lacandon.tundora = ['#404040', 237]

" Black
let s:lacandon.chaosBlack = ['#101010', 233]

let s:fg = 'pureWhite'
let s:bg = 'pureBlack'

" }}}
" Highlighting function {{{

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
call s:HL('VisualNOS', '', 'chaosBlack')

call s:HL('Search', 'chaosBlack', 'coniferBlossom', 'bold')
call s:HL('IncSearch', 'chaosBlack', 'pureWhite', 'bold')

call s:HL('StatusLine', 'tundora', 'chaosBlack', 'bold')
call s:HL('StatusLineNC', 'tundora', 'chaosBlack', 'bold')

call s:HL('Title', 'alienParasite')
call s:HL('Directory', 'tundora', '', 'bold')

call s:HL('ErrorMsg', 'carrot', s:bg, 'bold')
call s:HL('ModeMsg', 'tundora', '', 'bold')
call s:HL('Question', 'tundora', '', 'bold')
call s:HL('WarningMsg', 'coniferBlossom', '', 'bold')

call s:HL('NonText', 'mountainMeadow', s:bg)

" }}}
" Left column {{{

call s:HL('LineNr', 'tundora', s:bg)
call s:HL('CursorLineNr', 'mountainMeadow', s:bg)
call s:HL('SignColumn', '', s:bg)

" Diffs
call s:HL('DiffAdd', 'turquoisePanic', s:bg)
call s:HL('DiffDelete', 'carrot', s:bg)
call s:HL('DiffChange', 'coniferBlossom', s:bg)
call s:HL('DiffText', 'mountainMeadow', s:bg)

" }}}
" Syntax highlighting {{{

call s:HL('Comment', 'tundora')

call s:HL('Statement', 'alienParasite', '', 'bold')
call s:HL('Conditional', 'heraBlue', '', 'bold')
call s:HL('Repeat', 'heraBlue', '', 'bold')
call s:HL('Label', 'heraBlue', '', 'bold')
call s:HL('Operator', 'heraBlue', '', 'bold')
call s:HL('Keyword', 'alienParasite', '', 'bold')
call s:HL('Exception', 'heraBlue', '', 'bold')

call s:HL('Constant', 'turquoisePanic', '', 'bold')
call s:HL('String', 'genoa')
call s:HL('Character', 'turquoisePanic', '', 'bold')
call s:HL('Number', 'turquoisePanic', '', 'bold')
call s:HL('Boolean', 'turquoisePanic', '', 'bold')
call s:HL('Float', 'turquoisePanic', '', 'bold')

" TODO
" Fix background when identifier highlighted
call s:HL('Identifier', 'mountainMeadow', '', 'bold')
call s:HL('Function', 'mountainMeadow', '', 'bold')

call s:HL('PreProc', 'coniferBlossom', '', 'none')
call s:HL('Define', 'coniferBlossom', '', 'none')
call s:HL('Macro', 'coniferBlossom', '', 'none')
call s:HL('PreCondit', 'coniferBlossom', '', 'bold')

call s:HL('Type', 'alienParasite', '', 'bold')
call s:HL('StorageClass', 'alienParasite', '', 'bold')
call s:HL('Structure', 'alienParasite', '', 'bold')
call s:HL('Typedef', 'alienParasite', '', 'bold')

call s:HL('Special', s:fg, '', 'bold')
call s:HL('SpecialComment', 'carrot', s:bg, 'bold')
call s:HL('Debug', 'coniferBlossom', '', 'bold')
call s:HL('Underlined', s:fg, '', 'underline')
call s:HL('Error', 'carrot', s:bg, 'bold')
call s:HL('Todo', 'carrot', s:bg, 'bold')

" }}}
" Completion menu {{{

call s:HL('pMenu', s:fg, 'chaosBlack') 
call s:HL('pMenuSel', '', 'tundora', 'bold')
call s:HL('pMenuSbar', '', 'tundora')
call s:HL('pMenuThumb', '', 'mountainMeadow')

" }}}
" Plugins {{{

" Coc
call s:HL('CocListSearch', 'mountainMeadow')
call s:HL('CocSearch', 'mountainMeadow')

" }}}
" Filetype-specific {{{

" LaTeX {{{

call s:HL('texStatement', 'mountainMeadow', '', 'none')
call s:HL('texMathZoneX', s:fg, '', 'none')
call s:HL('texMathZoneA', s:fg, '', 'none')
call s:HL('texMathZoneB', s:fg, '', 'none')
call s:HL('texMathZoneC', s:fg, '', 'none')
call s:HL('texMathZoneD', s:fg, '', 'none')
call s:HL('texMathZoneE', s:fg, '', 'none')
call s:HL('texMathZoneV', s:fg, '', 'none')
call s:HL('texMathZoneX', s:fg, '', 'none')
call s:HL('texMath', s:fg, '', 'none')
call s:HL('texMathMatcher', s:fg, '', 'none')
call s:HL('texRefLabel', s:fg, '', 'none')
call s:HL('texRefZone', 'alienParasite', '', 'none')
call s:HL('texComment', 'tundora', '', 'none')
call s:HL('texDelimiter', 'genoa', '', 'none')
call s:HL('texZone', s:fg, '', 'none')

augroup lacandon_tex
    au!
    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'tundora', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'tundora', '', 'bold')
call s:HL('markdownOrderedListMarker', 'tundora', '', 'bold')
call s:HL('markdownListMarker', 'tundora', '', 'bold')
call s:HL('markdownItalic', 'coniferBlossom', '', 'bold')
call s:HL('markdownBold', 'coniferBlossom', '', 'bold')
call s:HL('markdownH1', 'alienParasite', '', 'bold')
call s:HL('markdownH2', 'alienParasite', '', 'bold')
call s:HL('markdownH3', 'alienParasite', '', 'none')
call s:HL('markdownH4', 'alienParasite', '', 'none')
call s:HL('markdownH5', 'alienParasite', '', 'none')
call s:HL('markdownH6', 'alienParasite', '', 'none')
call s:HL('markdownIdDeclaration', 'heraBlue')
call s:HL('markdownAutomaticLink', 'heraBlue', '', 'bold')
call s:HL('markdownUrl', 'heraBlue', '', 'bold')
call s:HL('markdownCodeDelimiter', 'mountainMeadow', '', 'bold')
call s:HL('markdownCode', 'mountainMeadow', '', 'none')

" }}}
" Vim {{{

" TODO
" Do not fancy 'Type' colour in vim syntax files

" }}}

" }}}

" }}}
