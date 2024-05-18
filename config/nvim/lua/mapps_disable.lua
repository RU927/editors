require "nvchad.mappings"

-- n, v, i, t = mode names
local disabled = {
  -- n = { "<C-n>", "<C-s>" },
  -- i = { "jk" },
	i = {
		-- go to  beginning and end
		"<C-b>",
		"<C-e>",
		-- navigate within insert mode
		"<C-h>",
		"<C-l>",
		"<C-j>",
		"<C-k>"
	},
	n = {
		"<Esc>",
		-- switch between windows
		"<C-h>",
		"<C-l>",
		"<C-j>",
		"<C-k>",
		-- save
		"<C-s>",
		-- Copy all
		"<C-c>",
		-- line numbers
		"<leader>n",
		"<leader>rn",
		"j",
		"k",
		"<Up>",
		"<Down>",
		-- new buffer
		"<leader>b",
		"<leader>ch",
		-- cycle through buffers
		"<tab>",

		"<S-tab>",
		-- close buffer + hide terminal buffer
		"<leader>x",
		-- toggle comment in both modes
		"<leader>/",
		"gD",
		"gd",
		"K",
		"gi",
		"<leader>ls",
		"<leader>D",
		"<leader>ra",
		"<leader>ca",
		"gr",
		"<leader>f",
		"[d",
		"]d",

		"<leader>q",
		"<leader>fm",
		"<leader>wa",
		"<leader>wr",
		"<leader>wl",
		-- toggle
		"<C-n>",
		-- focus
		"<leader>e",
		-- find
		"<leader>ff",
		"<leader>fa",
		"<leader>fw",
		"<leader>fb",
		"<leader>fh",
		"<leader>fo",
		"<leader>fz",
		-- git
		"<leader>cm",
		"<leader>gt",
		-- pick a hidden term
		"<leader>pt",
		-- theme switcher
		"<leader>th",
		-- toggle in normal mode
		"<A-i>",
		"<A-h>",
		"<A-v>",
		-- new
		"<leader>h",
		"<leader>v",
		"<leader>wK",
		"<leader>wk",
		"<leader>cc",
		"]c",
		"[c",
		-- Actions
		"<leader>rh",

		"<leader>ph",

		"<leader>gb",
		"<leader>td"
	},

	t = {
		"<C-x>",
		-- toggle in terminal mode
		"<A-i>",
		"<A-h>",
		"<A-v>"
	},

	v = {
		"<Up>",
		"<Down>",
		"<leader>/"
	},

	x = {
		"j",
		"k",
		"p",
	}
}
-- return M

for mode, mappings in pairs(disabled) do
  for _, keys in pairs(mappings) do
    vim.keymap.del(mode, keys)
  end
end

