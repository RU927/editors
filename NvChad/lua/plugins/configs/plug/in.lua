Constants = require("config.constants")
local functions = require("config.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaultsrequire("config.customize")

Constants = require("config.constants")
Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ nvim-transpartent

	{
		"xiyaowong/nvim-transparent",
		enabled = Is_Enabled("nvim-transparent"),
		lazy = true,
		event = "VimEnter",
		opts = {
			enable = true,
			"Comment",
			extra_gropus = {
				"CursorLine",
				"CursorLineNr",
				"CursorLineSign",
				"Folded",
				"LineNr",
				"Normal",
				"SignColumn",
			},
			exclude = {
				"ColorColumn",
				"EndOfBuffer",
				"NonText",
			},
		},
		config = function()
			vim.cmd([[TransparentEnable]])
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("nvim-treesitter"),
		version = false,
		build = ":TSUpdate",

		-- opts = {
		--   autopairs = { enable = true },
		--   autotag = { enable = true, disable = { "xml" } },
		--   context_commenting = { enable = true, enable_autocmd = false },
		--   highlight = {
		--     enable = true,
		--     disable = Constants.disabled.treesitter,
		--     additional_vim_regex_highlighting = true,
		--   },
		--   indent = { enable = true, disable = { "yml", "yaml" } },
		--   playground = { enable = true },
		--   rainbow = {
		--     enable = true,
		--     extended_mode = true,
		--     max_file_lines = 1500,
		--     colors = Constants.colors.rainbow,
		--   },
		--   disable = { "latex" },
		--   ensure_installed = Constants.ensure_installed.treesitter,
		-- },

		-- config = function()
		--     -- require("plugins.configs.treesitt").init()
		--     require("plugins.configs.treesitter")
		-- end,

		-- opts = require "plugins.configs.treesittr",

		opts = {
			opts = require("plugins.configs.treesittr"),
		},
	},

	-- ----------------------------------------------------------------------- }}}

	-- {{{ Comment.nvim

	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("Comment.nvim"),
		opts = {
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ bullets.nvim

	{
		"dkarter/bullets.vim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("bullets.vim"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ clipboard-image.nvim

	{
		"ekickx/clipboard-image.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("clipboard-image.nvim"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ neoformat

	{
		"sbdchd/neoformat",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("neoformat"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-autopairs

	{
		"windwp/nvim-autopairs",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("nvim-autopairs"),
		config = function()
			require("plugins.configs.autopairs")
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-spectre

	{
		"windwp/nvim-spectre",
		enabled = Is_Enabled("nvim-spectre"),
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-surround

	{
		"kylechui/nvim-surround",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		enabled = Is_Enabled("nvim-surround"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-bundle-plantuml

	{
		"Traap/vim-bundle-plantuml",
		ft = "puml",
		enabled = Is_Enabled("vim-bundle-plantuml"),
		dependencies = {
			"aklt/plantuml-syntax",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-commentary

	{
		"tpope/vim-commentary",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-commentary"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-easy-align

	{
		"junegunn/vim-easy-align",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-easy-align"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-endwise

	{
		"tpope/vim-endwise",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-endwise"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-repeat

	{
		"tpope/vim-repeat",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-repeat"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-surround

	{
		"tpope/vim-surround",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-surround"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-unimpaired

	{
		"tpope/vim-unimpaired",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-unimpaired"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ wiki.vim

	{
		"lervag/wiki.vim",
		cmd = { "WikiIndex", "WikiJournal" },
		ft = { "wiki", "md", "puml" },
		enabled = Is_Enabled("wiki.vim"),
		dependencies = {
			"lervag/wiki-ft.vim",
			"Traap/vim-bundle-plantuml",
			"Traap/vim-bundle-wiki.vim",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ JuneGunn fzf.

	{
		"junegunn/fzf.vim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("fzf.vim"),
		dependencies = {
			"junegunn/fzf.vim",
			"Traap/vim-bundle-fzf",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-projectionist

	{
		"tpope/vim-projectionist",
		ft = { "c", "cpp", "rb" },
		enabled = Is_Enabled("vim-projectionist"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Telescope

	{
		"nvim-telescope/telescope.nvim",
		enabled = Is_Enabled("telescope.nvim"),
		cmd = "Telescope",
		keys = false,
		-- opts = {
		--   defaults = {
		--     layout_config = { prompt_position = "top" },
		--     layout_strategy = "horizontal",
		--     prompt_prefix = " ",
		--     selection_caret = " ",
		--     sorting_strategy = "ascending",
		--     winblend = 0,
		--   },
		--   pickers = {
		--     colorscheme = { enable_preview = true },
		--   },
		opts = function()
			return require("plugins.configs.telescope")
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
		end,

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ Telescope fzf native
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		enabled = Is_Enabled("telescope-fzf-native.nvim"),
		cmd = "Telescope",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ todo-comments.nvim
	--
	--     Unicodes:
	--       Youtube -> F167
	--       Cloud -> F0C2

	{
		"folke/todo-comments.nvim",
		enabled = Is_Enabled("todo-comments.nvim"),
		opts = function(_, opts)
			opts.merge_keywords = true
			opts.keywords = Constants.icons.keywords
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ mason.nvim

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		enabled = Is_Enabled("mason.nvim"),
		keys = { { "<leader>cm", "<cmd>Mason<cr> " } },
		opts = {
			ensure_installed = Constants.ensure_installed.mason,
			ui = {
				border = "none",
				icons = Constants.icons.mason,
				keymaps = {
					toggle_server_expand = "<CR>",
					install_server = "i",
					update_server = "u",
					check_server_version = "c",
					update_all_servers = "U",
					check_outdated_servers = "C",
					uninstall_server = "X",
					cancel_installation = "<C-c>",
				},
			},
			max_concurrent_installers = 4,
		},

		dependencies = {

			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = Constants.ensure_installed.lsp_config,
					automatic_installation = false,
				},
			},

			{
				"j-hui/fidget.nvim",
				opts = {
					-- window = {
					--   blend = 0,
					-- },
					-- sources = {
					--   ["null-ls"] = {
					--     ignore = true,
					--   },
					-- },
				},
			},
		},
	},
	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-lspconfig

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		enabled = Is_Enabled("nvim-lspconfig"),
		opts = function(_, opts)
			opts.servers = {
				ansiblels = {},
				astro = {},
				bashls = {},
				clangd = {},
				cssls = {},
				denols = false,
				dockerls = {},
				gopls = {},
				html = {},
				jsonls = {},
				marksman = {},
				pyright = {},
				svelte = {},
				tsserver = {},
				yamlls = {},

				lua_ls = {
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									"--log-level=trace",
								},
							},
							diagnostics = {
								enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},

				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							procMacro = { enable = true },
							cargo = { allFeatures = true },
							checkOnSave = {
								command = "clippy",
								extraArgs = { "--no-deps" },
							},
						},
					},
				},
			}
		end,
	},
	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-tmux-navigator

	{
		"christoomey/vim-tmux-navigator",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-tmux-navigator"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-tmux-runner

	{
		"christoomey/vim-tmux-runner",
		enabled = Is_Enabled("vim-tmux-runner") and In_Tmux(),
		event = "VeryLazy",
		dependencies = {
			"Traap/vim-bundle-tmux-runner",
		},
	},

	{
		"Traap/vim-bundle-tmux-runner",
		enabled = Is_Enabled("vim-bundle-tmux-runner") and In_Tmux(),
		event = "VeryLazy",
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ harpoon

	{
		"ThePrimeagen/harpoon",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("harpoon"),
		config = true,
	},

	-- ----------------------------------------------------------------------- }}}

	-- {{{ vim-tmux-navigator

	{
		"christoomey/vim-tmux-navigator",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-tmux-navigator"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-tmux-runner

	{
		"christoomey/vim-tmux-runner",
		enabled = Is_Enabled("vim-tmux-runner") and In_Tmux(),
		event = "VeryLazy",
		dependencies = {
			"Traap/vim-bundle-tmux-runner",
		},
	},

	{
		"Traap/vim-bundle-tmux-runner",
		enabled = Is_Enabled("vim-bundle-tmux-runner") and In_Tmux(),
		event = "VeryLazy",
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ harpoon

	{
		"ThePrimeagen/harpoon",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("harpoon"),
		config = true,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-bundler

	{
		"tpope/vim-bundler",
		event = { "BufEnter *.rb" },
		enabled = Is_Enabled("vim-bundler"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-bbye

	{
		"moll/vim-bbye",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-bbye"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-eunuch

	{
		"tpope/vim-eunuch",
		event = { "BufReadPost", "BufNewFile" },
		enabled = Is_Enabled("vim-eunuch"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-fugitive

	{
		"tpope/vim-fugitive",
		-- lazy = false,
		event = "BufEnter",
		enabled = Is_Enabled("vim-fugitive"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-rails

	{
		"tpope/vim-rails",
		event = { "BufEnter *.rb" },
		enabled = Is_Enabled("vim-rails"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-rake

	{
		"tpope/vim-rake",
		event = { "BufEnter *.rb", "BufEnter Rakefile" },
		enabled = Is_Enabled("vim-rake"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ vim-rbven

	{
		"tpope/vim-rbenv",
		event = { "BufEnter *.rb" },
		enabled = Is_Enabled("vim-rbenv"),
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ toggleterm.nvim

	{
		"akinsho/toggleterm.nvim",
		enabled = Is_Enabled("toggleterm.nvim"),
		version = "*",
		-- opts = {
		--   size = 13,
		--   -- open_mapping = [[<c-\>]],
		--   shade_filetypes = {},
		--   shade_terminals = true,
		--   shading_factor = "1",
		--   start_in_insert = true,
		--   persist_size = true,
		--   direction = "horizontal",
		-- },
		-- keys = {
		--   {
		--     "<Bslash><Bslash>",
		--     "<leader>Tf",
		--     "<leader>Tl",
		--     "<leader>Tr",
		--   },
		config = function()
			require("plugins.configs.toggleterm")
		end,
		-- },
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ zen-mode.nvim

	{
		"folke/zen-mode.nvim",
		enabled = Is_Enabled("zen-mode.nvim"),
		opts = {
			window = {
				width = 0.5,
				height = 0.85,
				options = {
					colorcolumn = "",
					cursorcolumn = false,
					cursorline = false,
					number = true,
					relativenumber = true,
				},
			},
			plugins = {
				enabled = true,
				options = {
					ruler = false,
					showmd = true,
				},
				twilight = { enabled = false },
				gitsigns = { enabled = false },
				tmux = { enabled = false },
				alacritty = {
					enabled = true,
					font = "15",
				},
			},
		},
	},

	-- ----------------------------------------------------------------------- }}}
}
