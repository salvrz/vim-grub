" Name:       grub.vim
" Version:    0.1.1
" Maintainer: github.com/salvrz
" License:    The MIT License (MIT)
"
" A minimal gruvbox-based colorscheme for Vim.
"
" Forked from paramount:
" https://github.com/owickstrom/vim-colors-paramount
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='grub'

let s:black           = { "gui": "#0D0D0D", "cterm": "234" } "off-black"
let s:medium_gray     = { "gui": "#767676", "cterm": "243" } "gray"
let s:dark_gray       = { "gui": "#282828", "cterm": "243" } "gray"
let s:cream           = { "gui": "#EBDBB2", "cterm": "187" } "cream"
let s:actual_white    = { "gui": "#F9F5D7", "cterm": "187" } "cream"
let s:subtle_black    = { "gui": "#121212", "cterm": "233" } "off-black v2"
let s:light_black     = { "gui": "#0A0A0A", "cterm": "235" } "dark gray"
let s:lighter_black   = { "gui": "#4E4E4E", "cterm": "239" } "gray"
let s:light_gray      = { "gui": "#282828", "cterm": "248" } "gray"
let s:lighter_gray    = { "gui": "#C6C6C6", "cterm": "251" } "light gray"
let s:dark_cream      = { "gui": "#F2E5BC", "cterm": "255" } "dark cream"
let s:dark_pink       = { "gui": "#ff5f87", "cterm": "204" } "pink"
let s:light_pink      = { "gui": "#d75f87", "cterm": "168" } "darker pink"
let s:dark_red        = { "gui": "#CC241D", "cterm": "1"   } "red"
let s:light_red       = { "gui": "#FB4934", "cterm": "1"   } "blood orange"
let s:orange          = { "gui": "#FE8019", "cterm": "167" } "orange"
let s:darker_blue     = { "gui": "#076678", "cterm": "18"  } "dark blue"
let s:dark_blue       = { "gui": "#076678", "cterm": "32"  } "dark blue"
let s:blue            = { "gui": "#458588", "cterm": "12"  } "blue/teal"
let s:light_blue      = { "gui": "#83A598", "cterm": "153" } "aqua/teal"
let s:dark_cyan       = { "gui": "#689D6A", "cterm": "6"   } "green/aqua"
let s:light_cyan      = { "gui": "#427B58", "cterm": "14"  } "darker green"
let s:dark_green      = { "gui": "#427B58", "cterm": "2"   } "dark aqua"
let s:light_green     = { "gui": "#98971A", "cterm": "10"  } "yellow-green"
let s:deep_purple     = { "gui": "#8F3F71", "cterm": "129" } "dark purple"
let s:dark_purple     = { "gui": "#B16286", "cterm": "132" } "light purple"
let s:light_purple    = { "gui": "#D3869B", "cterm": "165" } "pinkish"
let s:yellow          = { "gui": "#D79921", "cterm": "11"  } "darker pink"
let s:light_yellow    = { "gui": "#FABD2F", "cterm": "11"  } "yellow"
let s:dark_yellow     = { "gui": "#D65D0E", "cterm": "3"   } "light orange"
let s:dark_column     = { "gui": "#1C1C1C", "cterm": "234" } "off-black v3"
let s:light_column    = { "gui": "#F2E5BC", "cterm": "144" } "tan/dark cream"

let s:background = &background

if &background == "dark"
  let s:bg              = s:black
  let s:bg_column       = s:dark_column
  let s:bg_subtle       = s:lighter_black
  let s:bg_very_subtle  = s:subtle_black
  let s:norm            = s:cream
  let s:norm_subtle     = s:medium_gray
  let s:text_subtle     = s:lighter_black
  let s:purple          = s:dark_purple
  let s:cyan            = s:light_cyan
  let s:green           = s:light_green
  let s:red             = s:light_red
  let s:visual          = s:light_purple
  let s:yellow          = s:light_yellow
else
  let s:bg              = s:actual_white   "background"
  let s:bg_column       = s:light_column   "color column"
  let s:bg_subtle       = s:lighter_black  "comments"
  let s:bg_very_subtle  = s:dark_cream     "cursor linenr bg"
  let s:norm            = s:light_black    "text"
  let s:norm_subtle     = s:lighter_black  "braces, lots of keywords and delineators"
  let s:text_subtle     = s:dark_gray      "comments"
  let s:purple          = s:deep_purple    "constants, linenr"
  let s:cyan            = s:dark_cyan      "unused"
  let s:green           = s:dark_green     "diff add"
  let s:red             = s:dark_red       "error, diff delete, spellbad"
  let s:visual          = s:dark_purple    "SAME"
  let s:yellow          = s:dark_yellow    "warning(? I think?)"
endif

" https://github.com/noahfrederick/vim-hemisu/
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

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:norm, "fg": s:norm })
call s:h("Comment",       {"fg": s:text_subtle, "gui": "italic"})

call s:h("Constant",      {"fg": s:purple})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

"call s:h("Identifier",    {"fg": s:dark_blue})
hi! link Identifier       Normal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:norm_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": "bold", "gui": "bold"})

call s:h("PreProc",     {"fg": s:norm_subtle})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:red, "cterm": "bold"})
call s:h("Todo",          {"fg": s:purple, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:light_green})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:dark_blue})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:light_black})
call s:h("Search",        {"bg": s:light_green, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:text_subtle})
call s:h("CursorLineNr",  {"fg": s:purple, "bg": s:bg_very_subtle, "gui": "bold"})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:dark_blue})
call s:h("Visual",        {"fg": s:norm, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:text_subtle})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:text_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:dark_blue})
call s:h("SignColumn",    {"fg": s:light_green})


if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:red})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:light_green})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:light_purple})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:dark_green})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:red})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:light_green})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:light_purple})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:dark_green})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("PmenuSel",      {"fg": s:subtle_black, "bg": s:purple})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:subtle_black, "bg": s:purple, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_column})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" Syntastic
call s:h("SyntasticWarningSign",    {"fg": s:yellow})
call s:h("SyntasticWarning",        {"bg": s:yellow, "fg": s:black, "gui": "bold", "cterm": "bold"})
call s:h("SyntasticErrorSign",      {"fg": s:red})
call s:h("SyntasticError",          {"bg": s:red, "fg": s:cream, "gui": "bold", "cterm": "bold"})

" which-key.nvim
call s:h("WhichKey",                {"bg": s:bg, "fg": s:purple, "gui": "bold", "cterm": "bold"})
call s:h("WhichKeyDesc",            {"bg": s:bg, "fg": s:norm_subtle, "gui": "bold", "cterm": "bold"})
call s:h("WhichKeySeparator",       {"bg": s:bg, "fg": s:norm, "gui": "bold", "cterm": "bold"})
call s:h("WhichKeyFloat",           {"bg": s:bg})

hi link WhichKeyGroup WhichKey

" Neomake
hi link NeomakeWarningSign	SyntasticWarningSign
hi link NeomakeErrorSign	SyntasticErrorSign

" ALE
hi link ALEWarningSign	SyntasticWarningSign
hi link ALEErrorSign	SyntasticErrorSign

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr
