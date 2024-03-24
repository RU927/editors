return {
    -- Appearance

      --Темы
  'arcticicestudio/nord-vim',
  'EdenEast/nightfox.nvim',
  'navarasu/onedark.nvim',
    -- 'ellisonleao/gruvbox.nvim',

    -- Статуслайн
    -- 'nvim-lualine/lualine.nvim',
    -- Значки для проводника и панели вкладок
    -- 'nvim-tree/nvim-web-devicons',
    -- Проводник
    -- 'nvim-tree/nvim-tree.lua',
    -- Панель вкладок
    -- 'akinsho/bufferline.nvim',

    -- 'rcarriga/nvim-notify',
    -- 'stevearc/dressing.nvim', -- меняет окно поиска??

    -- Предпросмотр цветов css
     'ap/vim-css-color',
    -- 'norcalli/nvim-colorizer.lua',
    -- 'stevearc/oil.nvim',

    -- Utilities
    --Appearance
    -- "lukas-reineke/indent-blankline.nvim",
    -- "goolord/alpha-nvim",
    -- "RRethy/vim-illuminate",

    -- 'lewis6991/gitsigns.nvim',
    'sindrets/diffview.nvim',
    'TimUntersberger/neogit',

    -- General
    -- Коментирование
    'terrortylor/nvim-comment',
    -- 'numToStr/Comment.nvim',
    -- "JoosepAlviste/nvim-ts-context-commentstring",
    -- "lewis6991/impatient.nvim",
    -- "kylechui/nvim-surround",
    -- { 'mbbill/undotree', cmd = 'UndotreeToggle', lazy = true },
    -- "mg979/vim-visual-multi", -- Vimscript
    -- "glacambre/firenvim", -- Vimscript
    -- "gbprod/yanky.nvim",

    -- Git
    -- 'lewis6991/gitsigns.nvim',
    -- Discord
    'andweeb/presence.nvim',

    -- Интеграция с ranger
    -- 'kevinhwang91/rnvimr',
    -- Автодополнение скобок и кавычек
    -- 'windwp/nvim-autopairs',

    -- 'gelguy/wilder.nvim',
    -- 'ThePrimeagen/refactoring.nvim',
    -- 'windwp/nvim-spectre',
    -- 'ThePrimeagen/harpoon',
    -- 'abecodes/tabout.nvim',
    -- 'ggandor/leap.nvim',
    -- 'aserowy/tmux.nvim',
    { 'ldelossa/gh.nvim', dependencies = { 'ldelossa/litee.nvim' } },
    -- { 'folke/which-key.nvim', lazy = true },
    -- { 'michaelb/sniprun', build = 'bash ./install.sh', cmd = 'SnipRun' },
    -- { '2kabhishek/co-author.nvim', cmd = 'GitCoAuthors' },

    "Shatur/neovim-session-manager",
    "ahmedkhalf/project.nvim",

    -- R
    -- "jalvesaq/Nvim-R",
    -- "REditorSupport/languageserver"
    -- "jozefhajnala/languageserversetup"

    -- LaTeX support
    -- 'lervag/vimtex',
    'kdheepak/cmp-latex-symbols',
    'jbyuki/nabla.nvim', -- show symbols in editor

    -- Markdown
    {
      "iamcco/markdown-preview.nvim",
      build = function()
        vim.fn["mkdp#util#install"]()
      end,
    },

    -- {
    --   "iamcco/markdown-preview.nvim",
    --   build = "cd app && npm install",
    --   setup = function()
    --     vim.g.mkdp_filetypes = { "markdown" }
    --   end,
    --   ft = { "markdown" },
    -- },

    -- LSP сервер
    {
        -- 'neovim/nvim-lspconfig',
        -- 'williamboman/mason.nvim', -- Инсталлер для серверов LSP
        'williamboman/mason-lspconfig.nvim',
        -- 'jose-elias-alvarez/null-ls.nvim',   -- for formatters and linters
        -- 'folke/trouble.nvim',
        -- 'Maan2003/lsp_lines.nvim',
        -- 'ray-x/lsp_signature.nvim',
        -- 'glepnir/lspsaga.nvim',
        -- Keep Mason updated
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        -- ful status updates for LSP
        'j-hui/fidget.nvim',

        -- Автодополнение
        -- {
        -- 'hrsh7th/nvim-cmp', -- движок автодополнения для LSP
        -- event = 'InsertEnter',
        -- dependencies = {
        -- 'hrsh7th/cmp-nvim-lsp',
        -- зависимости для движка автодополнения:
        -- 'hrsh7th/cmp-buffer',
        -- 'hrsh7th/cmp-path',
        -- 'hrsh7th/cmp-cmdline',
        -- 'hrsh7th/cmp-nvim-lua',
        -- 'hrsh7th/cmp-emoji',
        -- 'hrsh7th/cmp-nvim-lsp-signature-help',

        'jalvesaq/cmp-nvim-r',
        -- 'f3fora/cmp-spell', -- spelling completions
        -- 'hrsh7th/cmp-omni', -- helps Vimtex completions
        -- 'aspeddro/cmp-pandoc.nvim',
        -- --??'garbas/vim-snipmate',

        -- 'L3MON4D3/LuaSnip', -- движок для снипетов
        'saadparwaiz1/cmp_luasnip', -- автодополнения для сниппетов
        'rafamadriz/friendly-snippets',   -- набор готовых сниппетов для всех языков

        --'onsails/lspkind-nvim', -- иконки в выпадающем списке автодополнений
    },

    -- {
    --     'mfussenegger/nvim-dap',
    --     dependencies = {
    --         'rcarriga/nvim-dap-ui',
    --     },
    --     cmd = 'DapToggleBreakpoint',
    -- },

    -- Telescope
    {
        -- 'nvim-telescope/telescope.nvim',
        -- version = '0.1.0',
        -- dependencies = {
        --     'nvim-lua/plenary.nvim',
        --     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-symbols.nvim',
            -- 'nvim-telescope/telescope-hop.nvim',
            -- 'renerocksai/telekasten.nvim',
            -- 'renerocksai/calendar-vim',

            -- { "nvim-telescope/telescope-bibtex.nvim",
            --  config = function()
            --    require "telescope".load_extension("bibtex")
            --  end,
            -- },

        -- lazy = true,
    },

    -- Tresitter  -- Подсветка синтаксиса
    {
        -- 'nvim-treesitter/nvim-treesitter',
        -- build = ':TSUpdate',
        -- dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-endwise',
            'windwp/nvim-ts-autotag',
            -- 'p00f/nvim-ts-rainbow',
             'JoosepAlviste/nvim-ts-context-commentstring',
             'nvim-treesitter/playground',
        -- },
        -- lazy = true,
    },

    -- Language specific
    -- { 'tpope/vim-rails', ft = 'ruby' },
  }
