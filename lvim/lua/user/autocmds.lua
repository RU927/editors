vim.api.nvim_create_autocmd("FileType", {
  pattern = { "zsh" },
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { ".config/lvim/config.lua" },
  command = "PackerCompile",
})

-- Setup cmp.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("LaTeXGroup", { clear = true }),
  pattern = "tex",
  callback = function()
    require("user.cmp")
  end,
})
