require("mason").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})
require("mason-lspconfig").setup {
	ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "marksman", "pyright" },
}
require("mason-nvim-dap").setup({
	automatic_setup = true,
	ensure_installed = { "python", "cppdbg", "bash" }
})
require 'mason-nvim-dap'.setup_handlers {}
