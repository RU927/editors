local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local neodev = require("neodev")

-- if you just want default config for the servers then put them in a table
local servers = require("custom.core.constants").ensure_installed.lsp_config --{ "lua_ls", "pyright", "r_language_server" }

for _, lsp in ipairs(servers) do
	neodev.setup()
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- lspconfig.pyright.setup { blabla}
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = function()
		local caps = capabilities
		caps.offsetEncoding = "utf-8"
		return caps
	end,
})
