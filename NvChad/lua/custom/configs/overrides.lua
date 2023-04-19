Constants = require("custom.core.constants")
local M = {}

M.treesitter = {
	ensure_installed = Constants.ensure_installed.treesitter,
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = Constants.ensure_installed.mason,
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.cmp = {
	sources = Constants.completion.sources,
	formating = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", Constants.icons.lsp_kinds[vim_item.kind])
			vim_item.menu = (Constants.completion.source_mapping)[entry.source.name]
			return vim_item
		end,
	},
}
return M
