local present, alpha = pcall(require, "alpha")

if not present then
	return
end

local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 5,
		width = 36,
		align_shortcut = "right",
		hl = "AlphaButtons",
	}

	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

local options = {}

local ascii = {
	"           ▄ ▄                   ",
	"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
	"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
	"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
	"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
	"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
	"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
	"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
	"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
	-- 	-- [[                                                    ]],
	-- 	-- [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	-- 	-- [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	-- 	-- [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	-- 	-- [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	-- 	-- [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	-- 	-- [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	-- 	-- [[                                                    ]],
}

options.header = {
	type = "text",
	val = ascii,
	opts = {
		position = "center",
		hl = "AlphaHeader",
	},
}

options.buttons = {
	type = "group",
	val = {
		button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		button("p", "  Find project", ":Telescope projects <CR>"),
		button("w", "  Find Word", ":Telescope live_grep <CR>"),
		button("d", "✗  Delete session", "<cmd>SessionsManager delete_session<CR>"),
		button("s", "  Sessions", "<cmd>SessionManager load_session<CR>"),
		button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
		button("f", "  Find File", ":Telescope find_files <CR>"),
		button("i", "  Info", "<cmd>e ~/.config/CheatSheet.md<cr>"),
		button("m", "  Mappings", ":NvCheatsheet<cr>"),
		button("M", "  Bookmarks", ":Telescope marks<cr>"),
		button("s", "  Settings", ":e $HOME/.config/nvim/lua/custom/chadrc.lua<CR>"),
		button("q", "  Quit", ":qa<CR>"),
	},
	opts = {
		spacing = 1,
	},
}

-- options = require("core.utils").load_override(options, "goolord/alpha-nvim")

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * marginTopPercent) })

alpha.setup({
	layout = {
		{ type = "padding", val = headerPadding },
		options.header,
		{ type = "padding", val = 2 },
		options.buttons,
	},
	opts = {},
})
