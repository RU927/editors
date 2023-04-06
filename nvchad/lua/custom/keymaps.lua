-- {{{ Global definitions

Customize = require("config.customize")
Functions = require("config.functions")
Keymap = Functions.keymap
Is_Enabled = Functions.is_enabled
-- ------------------------------------------------------------------------- }}}
-- {{{ b 


-- ------------------------------------------------------------------------- }}}
-- {{{ c - Copy & Paste & tmux
--[[
["<leader>cc"] = { 'ggVGg_"+y', '' },
["<leader>cv"] = { '"+p', '' },

if Is_Enabled("vim-tmux-runner") then
  ["<leader>cr"] = { "<cmd>VtrClearRunner<cr>", "" },
end
--]]
-- ------------------------------------------------------------------------- }}}
-- {{{ r - Runners
--[[
-- if Is_Enabled("vim-tmux-runner") then
--   ["<leader>ra"] = { "<cmd>VtrReattachRunner<cr>", "" },
--   ["<leader>rr"] = { "<cmd>VtrResizeRunner<cr>", "" },
--   ["<leader>rR"] = { "<cmd>VtrReorientRunner<cr>", "" },
-- end
--]]
-- ------------------------------------------------------------------------- }}}
-- {{{ s - Split & Sorts
--[[
-- if Is_Enabled("vim-tmux-runner") then
  ["<leader>sc"] = { "<cmd>VtrSendCommandToRunner<cr>", "" },
  ["<leader>sf"] = { "<cmd>VtrSendFile<cr>", "" },
  ["<leader>sl"] = { "<cmd>VtrSendLinesToRunner<cr>", "" },
  ["<leader>sl"] = { "<cmd>VtrSendLinesToRunner<cr>", "" },
-- end

["<leader>sh"] = { "<cmd>split<cr>", "" },
["<leader>sv"] = { "<cmd>vsplit<cr>", "" },
["<leader>ss"] = { "0v)k$:sort<cr>", "" },
--]]
-- ------------------------------------------------------------------------- }}}
-- {{{ k - kill runner
--[[
-- if Is_Enabled("vim-tmux-runner") then
  ["<leader>kr"] = { "<cmd>VtrKillRunner<cr>", "" },
-- end
--]]
-- ------------------------------------------------------------------------- }}}
-- {{{ o - Options
--[[
["<leader>oh"] = { "<cmd>checkhealth<cr>", "" },
["<leader>oo"] = { "<cmd>only<cr>", "" },

if Is_Enabled("vim-tmux-runner") then
  ["<leader>or"] = { "<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>" },
end

if Is_Enabled("zen-mode.nvim") then
  ["<leader>oz"] = { "<cmd>lua require("zen-mode").toggle()<cr>", "" },
end
--]]
-- ------------------------------------------------------------------------- }}}


M.= {
  plugin = true,
  n = {
		name = "",
  },
}

M.= {
  plugin = true,
  n = {

  }
}



