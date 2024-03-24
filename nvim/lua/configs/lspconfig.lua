local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local neodev = require("neodev")

-- if you just want default config for the servers then put them in a table
local servers = require("core.constants").ensure_installed.lsp_config --{ "lua_ls", "pyright", "r_language_server" }

for _, lsp in ipairs(servers) do
	neodev.setup()
	lspconfig[lsp].setup({
    on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				workspace = {
					library = {
						["$XDG_DATA_HOME/awesome-code-doc/"] = true,
					},
				},
			},
		},
	})
end

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = function()
		local caps = capabilities
		caps.offsetEncoding = "utf-8"
		return caps
	end,
})
