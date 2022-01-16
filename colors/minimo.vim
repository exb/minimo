" minimo.vim - Minimal vim color scheme
" ----------------------------------------------------------
" Author:   Endrit Bajo (https://github.com/exb/)
" Version:  0.1
" License:  The MIT License (MIT)
" ----------------------------------------------------------

" Setup ----------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "minimo"

if !exists('g:minimo_accent_color')
  let g:minimo_accent_color="#8fce5b"
endif

if !exists('g:minimo_accent_color_cterm')
  let g:minimo_accent_color_cterm="119"
endif

" Colors ---------------------------------------------------
let s:bg           = { "gui": "#080808", "cterm": "232" }

let s:normal       = { "gui": "#e4e4e4", "cterm": "254" }
let s:dimmed       = { "gui": "#a8a8a8", "cterm": "248" }
let s:subtle       = { "gui": "#808080", "cterm": "244" }
let s:faint        = { "gui": "#626262", "cterm": "241" }

let s:ui_normal    = { "gui": "#b2b2b2", "cterm": "249" }
let s:ui_dimmed    = { "gui": "#808080", "cterm": "244" }
let s:ui_subtle    = { "gui": "#444444", "cterm": "238" }
let s:ui_faint     = { "gui": "#303030", "cterm": "236" }

let s:green        = { "gui": "#8fce5b", "cterm": "119" }
let s:red          = { "gui": "#d75f5f", "cterm": "167" }
let s:accent       = { "gui": g:minimo_accent_color, "cterm": g:minimo_accent_color_cterm }

" Utility Function -----------------------------------------
function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" Highlights - Vim >= 7 ------------------------------------
if version >= 700
    call s:h("CursorLine",   { "bg": s:ui_faint })
    call s:h("CursorLineNr", { "fg": s:ui_dimmed, "bg": s:ui_faint })
    call s:h("MatchParen",   { "fg": s:ui_normal })
    call s:h("Pmenu",        { "bg": s:ui_faint })
    call s:h("PmenuSel",     { "bg": s:ui_subtle })
    call s:h("PmenuSbar",    { "bg": s:ui_subtle })
    call s:h("PmenuThumb",   { "bg": s:ui_dimmed })
    call s:h("ColorColumn",  { "fg": s:ui_faint })
    call s:h("SpellBad",     { "gui": "underline", "cterm": "underline" })
    call s:h("SpellCap",     { "gui": "underline", "cterm": "underline" })
    call s:h("SpellLocal",   { "gui": "underline", "cterm": "underline" })
    call s:h("SpellRare",    { "gui": "underline", "cterm": "underline" })
    hi! link CursorColumn CursorLine
endif

" Highlights - UI ------------------------------------------
call s:h("Normal",       { "fg": s:normal, "bg": s:bg })
call s:h("NonText",      { "fg": s:ui_subtle })
call s:h("Cursor",       { "bg": s:ui_subtle })
call s:h("Visual",       { "bg": s:ui_subtle })
call s:h("VisualNOS",    { "bg": s:ui_faint })
call s:h("IncSearch",    { "fg": s:bg, "bg": s:ui_normal })
call s:h("Search",       { "fg": s:bg, "bg": s:ui_normal })
call s:h("StatusLine",   { "fg": s:ui_normal })
call s:h("StatusLineNC", { "fg": s:ui_subtle })
call s:h("SignColumn",   { "fg": s:ui_normal })
call s:h("VertSplit",    { "bg": s:bg, "fg": s:ui_subtle })
call s:h("Folded",       { "fg": s:ui_normal })
call s:h("Directory",    { "fg": s:ui_normal })
call s:h("Title",        { "fg": s:ui_dimmed })
call s:h("DiffAdd",      { "fg": s:green })
call s:h("DiffDelete",   { "fg": s:red })
call s:h("DiffChange",   { })
call s:h("DiffText",     { "fg": s:bg, "bg": s:ui_normal })
call s:h("WildMenu",     { "fg": s:bg, "bg": s:ui_normal })
call s:h("FoldColumn",   { "fg": s:ui_dimmed })
call s:h("ModeMsg",      { "fg": s:ui_normal })
call s:h("LineNr",       { "fg": s:ui_subtle })
call s:h("SpecialKey",   { "fg": s:ui_subtle })
call s:h("QuickFixLine", { "bg": s:bg })
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine
hi! link ErrorMsg Error
hi! link WarningMsg Warning
hi! link MoreMsg ModeMsg
hi! link Question ModeMsg
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC

" Highlights - Generic Syntax ------------------------------
call s:h("Special",      { "fg": s:subtle })
call s:h("Comment",      { "fg": s:faint })
call s:h("Underlined",   { "fg": s:dimmed })
call s:h("Type",         { "fg": s:subtle })
call s:h("Character",    { "fg": s:accent })
call s:h("Statement",    { "fg": s:subtle })
call s:h("Todo",         { "fg": s:bg, "bg": s:dimmed })
call s:h("Identifier",   { "fg": s:dimmed })
call s:h("Constant",     { "fg": s:dimmed })
call s:h("PreProc",      { "fg": s:dimmed })
call s:h("Operator",     { "fg": s:normal })
hi! link Conditonal Statement
hi! link Repeat Statement
hi! link String Character
hi! link Number Character
hi! link Float Number
hi! link Boolean Character
hi! link Delimiter Special
hi! link Keyword Statement
hi! link Function Identifier
hi! link Label Statement
hi! link Exception Statement
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
hi! link SpecialChar Special
hi! link Tag Special
hi! link SpecialComment Special
hi! link Debug Special
hi! link Ignore NonText

" Highlights - HTML ----------------------------------------
hi! link htmlTag htmlTagName
hi! link htmlEndTag htmlTag

" Highlights - Git -----------------------------------------
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link gitcommitSummary Title

" Highlights - Javascript ----------------------------------
call s:h("jsNull",              { "fg": s:accent })
call s:h("jsTemplateBraces",    { "fg": s:dimmed })
hi! link jsUndefined jsNull

" Highlights - CSS -----------------------------------------
call s:h("cssProp",             { "fg": s:normal })
call s:h("cssAttr",             { "fg": s:accent })
call s:h("cssNoise",            { "fg": s:subtle })
call s:h("cssDefinition",       { "fg": s:subtle })
call s:h("cssFunctionName",     { "fg": s:normal })
hi! link cssKeyFrameProp cssProp
hi! link sassClass cssClassName
hi! link sassAmpersand cssNoise
hi! link sassDefinition sassClass

" Highlights - XML -----------------------------------------
hi! link xmlAttrib xmlTagName
hi! link xmlEqual xmlAttrib

" Highlights - netrw ---------------------------------------
hi! link netrwTreeBar NonText

" FZF ------------------------------------------------------
let g:fzf_colors =
\ { 'fg':      ['fg', 'Identifier'],
  \ 'bg':      ['bg', 'Identifier'],
  \ 'hl':      ['fg', 'Normal'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Normal'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Comment'],
  \ 'pointer': ['fg', 'Normal'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
