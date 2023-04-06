local overrides = require("plugins.configs.overrides")

local options = {
  -- ensure_installed = { "lua" },
  ensure_installed = overrides.treesitter.ensure_installed,

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
