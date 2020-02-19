" Just a simple mod of 'colorshot'
" named as barrage.

hi clear
if exists('syntax_on')
    syntax reset
endif
set bg=dark
let colors_name = 'barrage'

" General colors
hi NonText     cterm=NONE ctermfg=1         ctermbg=NONE
hi LineNr      cterm=NONE ctermfg=241       ctermbg=NONE
hi VertSplit   cterm=NONE ctermfg=238       ctermbg=NONE
hi Visual      cterm=NONE ctermfg=253       ctermbg=1
hi Title       cterm=NONE ctermfg=magenta   ctermbg=NONE
hi WildMenu    cterm=NONE ctermfg=black     ctermbg=lightgray
hi ErrorMsg    cterm=NONE ctermfg=red       ctermbg=black
hi WarningMsg  cterm=NONE ctermfg=3         ctermbg=black
hi ModeMsg     cterm=NONE ctermfg=lightgray ctermbg=black

if version >= 700 " Vim 7 specific colors
   hi CursorLine  cterm=NONE      ctermfg=NONE ctermbg=235
   hi MatchParen  cterm=NONE      ctermfg=1    ctermbg=black
   hi! link CursorColumn CursorLine
endif

" Completion menu
hi Pmenu       cterm=NONE ctermfg=white     ctermbg=black
hi PmenuSel    cterm=NONE ctermfg=lightgray ctermbg=black

" Tabs
hi TabLine     cterm=NONE ctermfg=252       ctermbg=222
hi TabLineSel  cterm=NONE ctermfg=17        ctermbg=190
hi TabLineFill cterm=NONE ctermfg=NONE      ctermbg=NONE

" Syntax highlighting
hi Comment     cterm=NONE      ctermfg=240         ctermbg=NONE
hi String      cterm=NONE      ctermfg=244         ctermbg=NONE
hi Keyword     cterm=NONE      ctermfg=1           ctermbg=NONE
hi PreProc     cterm=NONE      ctermfg=cyan        ctermbg=NONE
hi Todo        cterm=underline ctermfg=magenta     ctermbg=NONE
hi Constant    cterm=NONE      ctermfg=1           ctermbg=NONE
hi Identifier  cterm=NONE      ctermfg=darkmagenta ctermbg=NONE
hi Type        cterm=NONE      ctermfg=yellow      ctermbg=NONE
hi Statement   cterm=NONE      ctermfg=1           ctermbg=NONE
hi Special     cterm=NONE      ctermfg=magenta     ctermbg=NONE
hi Delimiter   cterm=NONE      ctermfg=1           ctermbg=NONE
hi Function    cterm=NONE      ctermfg=3           ctermbg=NONE
hi Directory   cterm=NONE      ctermfg=245         ctermbg=NONE

hi  link Number         Constant
hi! link StatusLine     VertSplit
hi! link StatusLineNC   VertSplit
hi! link Question       Special
hi! link MoreMsg        Special
hi! link Folded         Normal

hi link Operator        Delimiter
hi link PmenuSel        PmenuThumb
hi link Error           ErrorMsg
hi link Conditional     Keyword
hi link Character       String
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
hi link cTodo           Todo

" Diff

hi! link DiffAdd TabLineSel
hi! link DiffDelete TabLine
hi! link DiffChange Pmenu
hi! link DiffText PmenuSel

" Syntastic
hi link SyntasticErrorSign    ErrorMsg
hi link SyntasticWarningSign  WarningMsg
hi SignColumn                 cterm=NONE ctermfg=NONE ctermbg=NONE
hi SyntasticErrorLine         cterm=NONE ctermfg=NONE ctermbg=black
hi SyntasticWarningLine       cterm=NONE ctermfg=NONE ctermbg=black

" Ruby
hi link rubyClass             Keyword
hi link rubyModule            Keyword
hi link rubyKeyword           Keyword
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type

" HTML/XML
hi link xmlTag             HTML
hi link xmlTagName         HTML
hi link xmlEndTag          HTML
hi link htmlTag            HTML
hi link htmlTagName        HTML
hi link htmlSpecialTagName HTML
hi link htmlEndTag         HTML
hi link HTML               NonText

" JavaScript
hi link javaScriptNumber   Number

" Objc
hi link objcDirective      Type
hi objcMethodName          cterm=NONE ctermfg=darkyellow ctermbg=NONE

" CSS
hi link cssBraces          Normal
hi link cssTagName         NonText
hi link StorageClass       Special
hi link cssClassName       Special
hi link cssIdentifier      Identifier
hi link cssColor           Type
hi link cssValueInteger    Type
hi link cssValueNumber     Type
hi link cssValueLength     Type
hi cssPseudoClassId        cterm=NONE ctermfg=darkyellow ctermbg=NONE

" Spell checking
hi SpellBad   cterm=underline ctermfg=1   ctermbg=NONE
hi SpellCap   cterm=underline ctermfg=3   ctermbg=NONE
hi SpellRare  cterm=underline ctermfg=3   ctermbg=NONE
hi SpellLocal cterm=underline ctermfg=3   ctermbg=NONE

" vim: set ts=8 sw=4 tw=78 :
