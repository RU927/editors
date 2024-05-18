local overrides = require "configs.overrides"
-- local functions = require("custom.core.functions")

--@type NvPluginSpec[]
local plugins = {
  {},
  {
    "ms-jpq/coq_nvim",
    lazy = false,
    dependencies = {
      "ms-jpq/coq.thirdparty",
      -- "ms-jpq/coq.artifacts",
    },
    -- config = function()
    --   require("coq").setup()
    -- end,
  },
  {
    "potamides/pantran.nvim",
    lazy = false,
    config = function()
      require "configs.pantran"
    end,
  },

  {
    "aspeddro/pandoc.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jbyuki/nabla.nvim", -- optional
    },
    config = function()
      require("pandoc").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require "configs.alpha"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    ft = "gitcommit",
    opts = overrides.gitsigns,
  },

  {
    "akinsho/toggleterm.nvim",
    -- version = "*",
    keys = {
      {
        "<leader>Tf",
        "<leader>Tl",
        "<leader>Tr",
      },
    },
    config = function()
      require "configs.toggleterm"
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ ranger
  {
    "kevinhwang91/rnvimr",
    lazy = false,
    keys = { "<leader>r" },
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ vim-dadbod-ui
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
      "tpope/vim-dotenv",
    },
    keys = { { "<localleader><localleader>db", ":tab DBUI<cr>" } },
    init = function()
      require "configs.database"
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Nvim-R
  {
    -- "jalvesaq/Nvim-R",
    "R-nvim/R.nvim",
    ft = { "r" },
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ undotree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    lazy = true,
    config = function()
      require "configs.undotree"
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  -- {{{ Events and dependencies
  {
    "nvim-telescope/telescope-bibtex.nvim",
    config = function()
      require("telescope").load_extension "bibtex"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        -- "hrsh7th/cmp-nvim-lsp",
        -- "hrsh7th/cmp-buffer",
        -- "hrsh7th/cmp-path",
        -- "saadparwaiz1/cmp_luasnip",
        "kdheepak/cmp-latex-symbols",
        {
          "R-nvim/cmp-r",
          config = function()
            require "configs.cmp-r"
          end,
        },
        -- "hrsh7th/cmp-calc",
        -- "hrsh7th/cmp-cmdline",
        -- "hrsh7th/cmp-nvim-lsp-document-symbol",
        -- "hrsh7th/cmp-nvim-lsp-signature-help",
        -- "hrsh7th/cmp-omni", -- helps Vimtex completions
        "f3fora/cmp-spell",
        "aspeddro/cmp-pandoc.nvim",
        -- "onsails/lspkind-nvim",
        -- "roobert/tailwindcss-colorizer-cmp.nvim",
      },
    },

    opts = function()
      local cmp_conf = require "nvchad.configs.cmp"
      table.insert(cmp_conf.sources, { name = "cmp_r" })
      -- table.remove(cmp_conf.window)
      -- table.remove(cmp_conf.formatting)
      cmp_conf.window = overrides.cmp.window
      cmp_conf.formatting = overrides.cmp.formatting
      return cmp_conf
    end,

    -- opts = function()
    --   return require "nvchad.configs.cmp"
    -- end,
    -- config = function(_, opts)
    --   require("cmp").setup(opts)
    -- end,
  },

  -- --------------------------------------------------------------------- }}}
  -- {{{ vimtex

  {
    "lervag/vimtex",
    ft = { "tex", "texx" },
    dependencies = { "micangl/cmp-vimtex" },
    version = "*",
    -- event = { "BufReadPre", "BufNewFile" },       -- WARNING: adding events can prevent synctex inverse search from working
    config = function()
      require "configs.vimtex"
    end,
  },

  -- {
  -- 	"lervag/vimtex",
  -- 	ft = { "tex", "texx" },
  -- 	dependencies = { "Traap/vim-bundle-vimtex" },
  -- 	config = function()
  -- 		require("custom.configs.vimtex")
  -- 	end,
  -- },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ which-key
  {
    "folke/which-key.nvim",
    -- opts = overrides.whichkey,
    config = function()
      require "configs.which-key"
    end,
  },
  -- ----------------------------------------------------------------------- }}}
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- -- format & linting
      {
        "folke/neodev.nvim",
        opts = {},
      },
    },
    config = function()
      -- require("plugins.configs.lspconfig")
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "configs.conform"
    end,
  },

  -- Override plugin definition options
  --
  --

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    -- init = function()
    -- 	require("core.utils").load_mappings("nvimtree")
    -- end,
    opts = overrides.nvimtree,
    -- config = function(_, opts)
    -- 	dofile(vim.g.base46_cache .. "nvimtree")
    -- 	require("nvim-tree").setup(opts)
    -- end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
}

return plugins
