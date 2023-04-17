local highlights = require("custom.core.highlights")

return {
	theme = "gruvchad",
	theme_toggle = { "gruvchad", "gruvbox" },
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
