local Customize = {}

-- {{{ Customize documentation.
-- Customize table is a plugin name and true or false.  Using nvim_tree as the
-- example:
--   true - plug is loaded
--  false - plugin is NOT loaded.
--
-- This is a quick way to determine when a customization is interfering with
-- your expected behavior or two plugins are impacting with each other.

-- ------------------------------------------------------------------------- }}}

Customize = {
  -- {{{ Enable or disable plugins.

  plugins = {
    ["Comment.nvim"] = { enabled = false },
    ["LuaSnip"] = { enabled = true },
    ["alpha-nvim"] = { enabled = false },
    ["bufferline.nvim"] = { enabled = false },
    ["bullets.vim"] = { enabled = false },
    ["catppuccin"] = { enabled = false },
    ["clipboard-image.nvim"] = { enabled = false },
    ["crates.nvim"] = { enabled = false },
    ["dressing"] = { enabled = false },
    ["flit.nvim"] = { enabled = false },
    ["fzf.vim"] = { enabled = true },
    ["gem-browse"] = { enabled = false },
    ["gitsigns.nvim"] = { enabled = true },
    ["gruvbox.nvim"] = { enabled = false },
    ["harpoon"] = { enabled = false },
    ["indent-blankline"] = { enabled = false, defaults = false },
    ["leap.nvim"] = { enabled = false },
    ["markdown-preview.nvim"] = { enabled = true },
    ["mason.nvim"] = { enabled = false },
    ["mason-nvim-dap.nvim"] = { enabled = false },
    ["mini-ai"] = { enabled = false },
    ["mini-comment"] = { enabled = false },
    ["mini-indentscope"] = { enabled = false },
    ["mini-pairs"] = { enabled = false },
    ["mini-surround"] = { enabled = false },
    ["neo-tree.nvim"] = { enabled = false },
    ["neoconf.nvim"] = { enabled = false },
    ["neodev.nvim"] = { enabled = false },
    ["neoformat"] = { enabled = false },
    ["noice.nvim"] = { enabled = false, defaults = false },
    ["null-ls.nvim"] = { enabled = false },
    ["nvim-autopairs"] = { enabled = false },
    ["nvim-base16"] = { enabled = false },
    ["nvim-cmp"] = { enabled = true },
    ["nvim-colorizer.lua"] = { enabled = false },
    ["nvim-dap"] = { enabled = false },
    ["nvim-dap-go"] = { enabled = false },
    ["nvim-dap-python"] = { enabled = false },
    ["nvim-dap-ruby"] = { enabled = false },
    ["nvim-dap-ui"] = { enabled = false },
    ["nvim-dap-virtual-text"] = { enabled = false },
    ["nvim-lspconfig"] = { enabled = false },
    ["nvim-navic"] = { enabled = false },
    ["nvim-notify"] = { enabled = false },
    ["nvim-r"] = { enabled = true },
    ["nvim-spectre"] = { enabled = false },
    ["nvim-surround"] = { enabled = false },
    ["nvim-transparent"] = { enabled = false },
    ["nvim-tree"] = { enabled = true },
    ["nvim-treesitter"] = { enabled = true },
    ["nvim-ts-rainbow"] = { enabled = false },
    ["nvim-unimpaired"] = { enabled = false },
    ["nvim-web-devicons"] = { enabled = false },
    ["one-small-step-for-vimkind"] = { enabled = false },
    ["lualine.nvim"] = { enabled = true, defaults = false },
    ["plenary.nvim"] = { enabled = true },
    ["popup.nvim"] = { enabled = false },
    ["rainbow_csv"] = { enabled = false },
    ["rnvimr"] = { enabled = true },
    ["rust-tools.nvim"] = { enabled = false },
    ["sxhkd-vim"] = { enabled = false },
    ["telescope.nvim"] = { enabled = true },
    ["telescope-dap.nvim"] = { enabled = false },
    ["telescope-fzf-native.nvim"] = { enabled = true },
    ["todo-comments.nvim"] = { enabled = true },
    ["toggleterm.nvim"] = { enabled = true },
    ["tokyonight.nvim"] = { enabled = false },
    ["trouble.nvim"] = { enabled = true },
    ["undotree"] = { enabled = true },
    ["vim-bbye"] = { enabled = false },
    ["vim-bundle-abbreviate"] = { enabled = false },
    ["vim-bundle-fzf"] = { enabled = false },
    ["vim-bundle-plantuml"] = { enabled = false },
    ["vim-bundle-tmux-runner"] = { enabled = false },
    ["vim-bundle-vimtex"] = { enabled = false },
    ["vim-bundle-wiki.vim"] = { enabled = false },
    ["vim-bundler"] = { enabled = false },
    ["vim-commentary"] = { enabled = false },
    ["vim-dadbod-ui"] = { enabled = true },
    ["vim-easy-align"] = { enabled = false },
    ["vim-endwise"] = { enabled = false },
    ["vim-eunuch"] = { enabled = false },
    ["vim-fugitive"] = { enabled = false},
    ["vim-illuminate"] = { enabled = false },
    ["vim-most-minimal-folds"] = { enabled = true },
    ["vim-projectionist"] = { enabled = false },
    ["vim-rails"] = { enabled = false },
    ["vim-rake"] = { enabled = false },
    ["vim-rbenv"] = { enabled = false },
    ["vim-repeat"] = { enabled = false },
    ["vim-startuptime"] = { enabled = false},
    ["vim-surround"] = { enabled = false },
    ["vim-tmux-navigator"] = { enabled = false },
    ["vim-tmux-runner"] = { enabled = false },
    ["vim-unimpaired"] = { enabled = false },
    ["vim-visual-increment"] = { enabled = false },
    ["vimtex"] = { enabled = true },
    ["virtcolumn.nvim"] = { enabled = false },
    ["which-key.nvim"] = { enabled = true },
    ["wiki.vim"] = { enabled = true },
    ["wiki-ft.vim"] = { enabled = true },
    ["zen-mode.nvim"] = { enabled = false },
  },

  -- ------------------------------------------------------------------------- }}}
  -- {{{ Debug Adapter Protocol (DAP) debuggers

  debuggers = {
    ["bash"] = { enabled = false },
    ["dart"] = { enabled = false },
    ["go"] = { enabled = false },
    ["haskell"] = { enabled = false },
    ["java"] = { enabled = false },
    ["lua"] = { enabled = false },
    ["python"] = { enabled = false },
    ["ruby"] = { enabled = false },
    ["rust"] = { enabled = false },
  },

  -- ------------------------------------------------------------------------- }}}
}
-- {{{ Toggle terminals

Customize.toggleterm = {

  float = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ direction = "float" })
    return t:toggle()
  end,

  lazygit = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "lazygit", direction = "float" })
    return t:toggle()
  end,

  neomutt = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "neomutt", direction = "float" })
    return t:toggle()
  end,

  node = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t= Terminal:new({ cmd = "node", direction = "horizontal" })
    return t:toggle()
  end,

  ncdu = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "ncdu", direction = "horizontal" })
    return t:toggle()
  end,

  htop = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "htop", direction = "float" })
    return t:toggle()
  end,

  python = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "python", direction = "horizontal" })
    return t:toggle()
  end,

  ranger = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "ranger", direction = "float" })
    return t:toggle()
  end,

  xplr = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "xplr", direction = "float" })
    return t:toggle()
  end,

  vifmrun = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local t = Terminal:new({ cmd = "vifmrun", direction = "float" })
    return t:toggle()
  end,

}

-- ------------------------------------------------------------------------- }}}

return Customize
