---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "gruvbox",
	--theme = "onedark",
	theme_toggle = { "gruvbox", "gruvchad" },

	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = {
		theme = "minimal", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		overriden_modules = nil,
	},

	nvdash = {
		load_on_startup = true,
		-- buttons = {
		-- 	{ "  Mappings", "Spc c h", "NvCheatsheet" },
		-- },
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
