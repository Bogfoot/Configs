vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
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

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


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
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
]])

-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cpp'] = 'c++'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cxx'] = 'c++'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['c'] = 'c'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['h'] = 'h'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['hpp'] = 'h'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['hxx'] = 'h'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['hash'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['lock'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[''] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['toc'] = '﬒'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['aux'] = '﬒'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['fls'] = '﬒'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['log'] = '﬒'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['out'] = '﬒'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pdf'] = '﬒'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['gz'] = 'ﰇ'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zip'] = 'ﰇ'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ttf'] = 'ﰇ'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['fdb_latexmk'] = '﬒'
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['wiki'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['toml'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sum'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['mod'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jpg'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['png'] = ''
-- let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jpeg'] = ''


-- au FileType py,pyx,h,hpp,hxx,cxx,c,cpp,objc,objcpp call rainbow#load()
-- inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
-- inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
--   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
-- inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
--   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
