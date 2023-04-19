local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {

	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "  ", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},

	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},

	window = {
		border = "none", -- none/single/double/shadow
	},

	layout = {
		spacing = 6, -- spacing between columns
	},

	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = { "<leader>", "<Bslash>" },
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<CR>", "explorer" },
	["u"] = { "<cmd>UndotreeToggle<CR>", "undo" },
	["r"] = { "<cmd>RnvimrToggle<CR>", "undo" },
}

local register = {
	["<leader>"] = {
		-- H = {
		--   name = '+Help',
		-- },
		a = {
			name = "+Actions",
		},
		d = {
			name = "+panDoc)",
		},
		-- b = {
		-- 	name = "+Buffer adjustments",
		-- },
		-- c = {
		-- 	name = "+Copy & Paste & tmux",
		-- },
		-- D = {
		-- 	name = "+Debug Adapter Protocol",
		-- },
		-- d = {
		-- 	name = "+DAP)",
		-- },
		f = {
			name = "+Find & Tmux",
		},
		g = {
			name = "Git",
			h = {
				name = "hunk",
			},
		},
		i = {
			name = "+LSP",
			w = {
				name = "workspace folder",
			},
		},
		-- k = {
		-- 	name = "+kill runner",
		-- },
		l = {
			name = "+LaTeX",
		},
		m = {
			name = "+MANAGE SESSION",
		},
		-- o = {
		-- 	name = "+Options",
		-- },
		-- p = {
		-- 	name = "+Lazy",
		-- },
		-- r = {
		-- 	name = "+Runners",
		-- },
		-- s = {
		-- 	name = "+Split & Sort",
		-- },
		t = {
			name = "+Terminals",
		},
		w = {
			name = "+Wiki & WhiteSpace",
		},
		-- A = {
		-- 	name = "ACTIONS",
		-- },
		-- P = {
		-- 	name = "+PANDOC",
		-- },
		y = {
			name = "+TEMPLATES",
		},
		z = {
			name = "+SURROUND",
		},
	},

	["<Bslash>"] = {
		r = {
			name = "+R",
		},
	},
}

-- which_key.setup(setup)
-- which_key.opts(opts)
-- which_key.mappings(mappings)
which_key.register(register)
