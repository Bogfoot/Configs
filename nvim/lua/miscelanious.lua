vim.cmd [[
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

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


"let g:vimtex_mappings_prefix='\'.
let g:vimtex_quickfix_open_on_warning = 0
let g:airline#extensions#vimtex#enabled=1

let g:airline#extensions#nerdtree_statusline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_flat'


let g:netrw_browsex_viewer= "google-chrome"


let g:translator_source_lang='auto'
let g:translator_target_lang='hr'
let g:translator_default_engines='google'

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
"imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
"inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

"snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
"snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
"imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
"smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
]]
