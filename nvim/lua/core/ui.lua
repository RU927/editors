local highlights = require("core.highlights")

return {
	theme = "gruvchad",
	theme_toggle = { "gruvchad", "gruvbox" },
	hl_override = highlights.override,
	hl_add = highlights.add,
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
		separator_style = "default", --default,block,round,arrow
		overriden_modules = nil,
	},
	nvdash = {
		load_on_startup = false,
		buttons = {
			{ "  Mappings", "Spc c h", "NvCheatsheet" },
		},
	},
	cmp = {
		lspkind_text = true,
		style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
		icons = true,
		border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
		selected_item_bg = "simple", -- colored / simple
	},

	telescope = {
		style = "bordered", -- borderless / bordered
	},
}
