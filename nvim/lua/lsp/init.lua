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
-- local status_ok, _ =pcall(require, "lspconfig")
-- if not status_ok then
-- 	return
-- end
--
-- require "lsp.lsp-installer"
-- require ("lsp.handlers").setup()
