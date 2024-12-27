vim.cmd([[
set mouse=a
hi clear Conceal

filetype off
filetype plugin indent on

colorscheme alduin
let g:alduin_Shout_Dragon_Aspect = 1
let g:rainbow_active = 1

let g:kite_supported_languages = ['*']
let g:kite_tab_complete=1

let g:tex_flavor = 'latex'

let g:vimtex_quickfix_open_on_warning = 0
]])
