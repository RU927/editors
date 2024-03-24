local present, null_ls = pcall(require, "null-ls")
local b = null_ls.builtins

if not present then
	return
end

local sources = {
	-- webdev stuff
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettierd.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes

	-- Lua
	b.formatting.stylua,
	b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- Rust
	b.formatting.rustfmt,

	-- Swift
	b.formatting.swiftformat,

	-- cpp
	b.formatting.clang_format,
}

local M = {}

M.setup = function()
	null_ls.setup({
		debug = true,
		sources = sources,

		-- format on save:
		on_attach = function(client)
		  if client.supports_method("textDocument/formatting") then
		    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
		  end
		end,
	})
end

return M
