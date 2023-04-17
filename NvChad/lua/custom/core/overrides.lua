local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "r",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    "pyright",
    "r-languageserver",
    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",
    -- "prettier"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.whichkey = {
  opts = {
    prefix = {"<leader>", "<Bslash>"},
    nowait = true, -- use `nowait` when creating keymaps
  },
  mappings = {
    ["e"] = { "<cmd>NvimTreeToggle<CR>"  , "explorer" },
    ["u"] = { "<cmd>UndotreeToggle<CR>"  , "undo" },
    ["d"] = { "<cmd>bdelete!<CR>"        , "delete buffer" },
    ["x"] = { ""                         , "checkmark" },
  },
}

return M

