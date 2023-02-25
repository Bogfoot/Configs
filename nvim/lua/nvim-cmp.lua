-- Setup nvim-cmp.
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local kind_icons = {
		Text = "",
		Method = "m",
		Function = "",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "",
		Interface = "",
		Module = "",
		Property = "",
		Unit = "",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
}
require("luasnip/loaders/from_vscode").lazy_load()
local cmp = require 'cmp'
cmp.setup({
		snippet = { -- REQUIRED - you must specify a snippet engine
				expand = function(args) -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end, },
		mapping = {
				['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs( -4), { 'i', 'c' }), --ovaj i onaj ispod su bili +/- 4
				['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
				['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						fallback()
					else
						fallback()
					end
				end, { "i", "s", }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable( -1) then
						luasnip.jump( -1)
					else
						fallback()
					end
				end, { "i", "s", }), },
		formatting = { fields = { "menu", "abbr", "kind" },
				-- format = lspkind.cmp_format(),
				format = function(entry, vim_item)
					-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					vim_item.menu = ({ nvim_lsp = "[LSP]", luasnip = "[Snippet]", buffer = "[Buffer]", path = "[Path]" })[
							entry.source.name]
					return vim_item
				end,
		},
		window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
		},
		confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
		},
		sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
				{ name = 'nvim_lua' },
				{ name = 'buffer',  keyword_length = 2 },
				{ name = 'path' },
		}, {
				{ name = 'buffer' },
		})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).

cmp.setup.cmdline('/', {
		sources = {
				{ name = "nvim-cmp" },
				{ name = "luasnip" },
				{ name = "buffer" }, -- ovaj je sam tu bija
				{ name = "path" },
		}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
		sources = cmp.config.sources({
				{ name = 'path' }
		}, {
				{ name = 'cmdline' }
		})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'cmake', 'pylsp', 'lua_ls' }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
			capabilities = capabilities,
	}
end
require 'lspconfig'.pyright.setup { capabilities = capabilities }
require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/.config/nvim/snippets" })
