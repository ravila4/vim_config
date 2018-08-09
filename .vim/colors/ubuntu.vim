" Vim color file
" Arc Theme
"

hi clear
let g:colors_name="ubuntu"

"
" Support for 256-color terminal
"

if &t_Co > 255
   " complete menu
   hi Pmenu           ctermfg=7   ctermbg=0
   hi PmenuSel        ctermfg=0   ctermbg=11
   hi PmenuSbar                   ctermbg=241
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118              cterm=bold
   hi PreProc         ctermfg=11
   hi Question        ctermfg=81
   hi Repeat          ctermfg=11                cterm=bold
   hi Search          ctermfg=253 ctermbg=66

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=11                cterm=bold
   hi SpecialComment  ctermfg=245              cterm=bold
   hi Special         ctermfg=81
   hi SpecialKey      ctermfg=245

   hi Statement       ctermfg=11                cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=0
   hi StatusLineNC    ctermfg=244 ctermbg=0
   hi StorageClass    ctermfg=11
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=0    cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81               cterm=none
   hi Underlined      ctermfg=244              cterm=underline

   hi VertSplit       ctermfg=238 ctermbg=244  cterm=bold
   hi VisualNOS                   ctermbg=235
   hi Visual                      ctermbg=24
   hi WarningMsg      ctermfg=231 ctermbg=238  cterm=bold
   hi WildMenu        ctermfg=238  ctermbg=8

   hi Comment         ctermfg=244
   hi CursorLine                  ctermbg=0    cterm=none
   hi CursorColumn                ctermbg=0
   hi LineNr          ctermfg=8   ctermbg=0
end
