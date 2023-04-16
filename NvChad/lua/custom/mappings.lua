-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    ["<C-a>"] = { "<End>", "end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "move left" },
    ["<C-l>"] = { "<Right>", "move right" },
    ["<C-j>"] = { "<Down>", "move down" },
    ["<C-k>"] = { "<Up>", "move up" },

    -- Press jk fast to enter
    ["jk"] = { "<escape>", "quit insert mode" },
    ["kj"] = { "<escape>", "quit insert mode" },

    ["ww"] = { "<escape>:ww<cr>", "write" },
    ["wq"] = { "<escape>:wq<cr>", "write and quit" },
    ["qq"] = { "<escape>:q<cr>", "quite" },
  },

  n = {
    ["<Esc>"] = { ":noh <CR>", "clear highlights" },
    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "window left" },
    ["<C-l>"] = { "<C-w>l", "window right" },
    ["<C-j>"] = { "<C-w>j", "window down" },
    ["<C-k>"] = { "<C-w>k", "window up" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },

    -- Copy all
    ["<C-y>"] = { "<cmd> %y+ <CR>", "copy whole file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "toggle line number" },
    -- ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },

    -- new buffer
    ["bn"] = { "<cmd> enew <CR>", "new buffer" },
    ["ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["wq"] = { ":wq<cr>", "write and quit" },
    ["qq"] = { ":q<cr>", "quit" },
    -- Bdelete
    ["<leader>d"] = { ":bd!<CR>", "close buffer" },
    -- Navigate buffers
    ["<S-l>"] = { ":bnext<CR>", "buffer next" },
    ["<S-h>"] = { ":bprevious<CR>", "buffer prev" },
    -- Move text up and down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "change with down string" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "change with up string" },
    -- Resize with arrows
    ["<C-Up>"] = { ":resize -2<CR>", "resize up" },
    ["<C-Down>"] = { ":resize +2<CR>", "resize down" },
    ["<C-Left>"] = { ":vertical resize +2<CR>", "resize left" },
    ["<C-Right>"] = { ":vertical resize -2<CR>", "resize right" },
    -- lists navigation
    -- ["<leader>j"] = { ":cnext<CR>zz", "", },
    -- ["<leader>k"] = { ":cprev<CR>zz", "", },
    -- ["<leader>i"] = { ":lnext<CR>zz", "", },
    -- ["<leader>o"] = { ":lprev<CR>zz", "", },
    -- ["<leader>cc"] = { ":cclose<CR>", "", },
    -- quick split
    -- ["<leader>wsv"] = { ":vsp<CR>", "", opts = {nowait = true} },
    -- search result focus
    ["n"] = { "nzzzv", "replace search result" },
    ["N"] = { "Nzzzv", "replace srarch result" },
    -- join lines focus
    -- ["J"] = { "mzJ`z", "concatenate string" },
    --- quick env file edit
    -- ["<leader>ee"] = { ":vsp .env<CR>", "", opts = {nowait = true} },
    -- {{{ Folding commands.

    -- Author: Karl Yngve Lervåg
    --    See: https://github.com/lervag/dotnvim

    -- Close all fold except the current one.

    ["zv"] = { "zMzvzz", "" },
    -- Close current fold when open. Always open next fold.
    ["zj"] = { "zcjzOzz", "" },
    -- Close current fold when open. Always open previous fold.
    ["zk"] = { "zckzOzz", "" },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "escape terminal mode" },

    ["<Esc><Esc>"] = { "<C-\\><C-n>", "" },
    ["<C-h>"] = { "<c-\\><c-n><c-w>h", "" },
    ["<C-j>"] = { "<c-\\><c-n><c-w>j", "" },
    ["<C-k>"] = { "<c-\\><c-n><c-w>k", "" },
    ["<C-l>"] = { "<c-\\><c-n><c-w>l", "" },
  },

  v = {
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
    -- tabulation
    ["<"] = { "<gv", "tab del" },
    [">"] = { ">gv", "tab add" },
    -- Move text up and down
    ["<A-j>"] = { ":m .+1<CR>==", "move down string" },
    ["<A-k>"] = { ":m .-2<CR>==", "move up string" },

    ["P"] = { '"_dP', "" },
    ["p"] = { '"_dp', "" },
  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "dont copy replaced text", opts = { silent = true } },
    --Move text up and down
    ["J"] = { ":move '>+1<CR>gv-gv", "" },
    ["K"] = { ":move '<-2<CR>gv-gv", "" },
    ["<A-j>"] = { ":move '>+1<CR>gv-gv", "move down" },
    ["<A-k>"] = { ":move '<-2<CR>gv-gv", "move up" },
  },
}

-- {{{ a - Actions
M.Actions = {
  -- plugin = true,
  n = {
    ["<leader>aa"] = { "<cmd>lua PdfAnnots()<CR>", "annotate" },
    ["<leader>ab"] = { "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export" },
    ["<leader>ac"] = { "<cmd>VimtexClean<CR>", "clean aux" },
    -- ["<leader>ag"] = { "<cmd>e ~/.config/nvim/lua/custom/LaTeX/templates/Glossary.tex<CR>", "edit glossary" },
    ["<leader>ah"] = { "<cmd>lua _HTOP_TOGGLE()<CR>", "htop" },
    ["<leader>ai"] = { "<cmd>IlluminateToggle<CR>", "illuminate" },
    ["<leader>ak"] = {
      "<cmd>lua require('cmp').setup.buffer { enabled = false }<CR>",
      "kill LSP",
    },
    ["<leader>al"] = {
      "<cmd>lua require('cmp').setup.buffer { enabled = true }<CR>",
      "load LSP",
    },
    -- ["<leader>al"] = { '<cmd>lua toggle_cmp()<CR>', "LSP"},
    ["<leader>ap"] = { '<cmd>lua require("nabla").popup()<CR>', "preview symbols" },
    ["<leader>ar"] = { "<cmd>VimtexErrors<CR>", "report errors" },
    ["<leader>as"] = { "<cmd>e ~/.config/nvim/lua/custom/LaTeX/snippets/tex.snippets<CR>", "edit snippets" },
    ["<leader>av"] = { "<plug>(vimtex-context-menu)", "vimtex menu" },
  },
}
-- ------------------------------------------------------------------------- }}}
-- {{{ d - panDoc
M.panDoc = {
  -- plugin = true,
  n = {
    ["<leader>dw"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>", "word" },
    ["<leader>dm"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.md'<CR>", "markdown" },
    ["<leader>dh"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.html'<CR>", "html" },
    ["<leader>dl"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.tex'<CR>", "latex" },
    ["<leader>dp"] = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.pdf'<CR>", "pdf" },
    -- x = { "<cmd>echo "run: unoconv -f pdf path-to.docx""  , "word to pdf"},
  },
}
-- ------------------------------------------------------------------------- }}}
-- {{{ e - file Explorers

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
    --[[
-- if Is_Enabled("neo-tree.nvim") or Is_Enabled("nvim-tree") then
  -- nvim_tree takes precedence when both are true.
  -- if Is_Enabled("nvim-tree") then
    -- ["<c-e>"] = { "<cmd>NvimTreeToggle<cr>", "" },
    ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "" },
    ["<leader>ef"] = { "<cmd>NvimTreeFindFile<cr>", "" },
    ["<leader>er"] = { "<cmd>NvimTreeRefresh<cr>", "" },
  -- else
    -- ["<c-e>"] = { "<cmd>Neotree toggle<cr>", "" },
    ["<leader>e"] = { "<cmd>Neotree toggle<cr>", "" },
    ["<leader>ef"] = { "<cmd>Neotree focus<cr>", "" },
    ["<leader>er"] = { "<cmd>Neotree show<cr>", "" },
  -- end
-- end

-- if Is_Enabled("noice.nvim") then
  ["<leader>eh"] = { "<cmd>NoiceHistory<cr>", "" },
-- end
--]]
  },
}

-- M.explorers = {
--   -- plugin = true,
--   n = {
--     ["<leader>r"] = { "<cmd> RnvimrToggle <CR>", "ranger" },
--     ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "toggle undotree" },
--   },
-- }
M.ranger = {
  -- plugin = true,
  n = {
    ["<leader>r"] = { "<cmd> RnvimrToggle <CR>", "ranger" },
  },
}
M.undotree = {
  -- plugin = true,
  n = {
    ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "toggle undotree" },
  },
}
-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find & tmux

--[[
M.find  = {
  plugin = true,
  n = {
  -- if Is_Enabled("todo-comments.nvim") then
    ["<leader>fy"] = { "<cmd>TodoTelescope keywords=Youtube,URL<cr>", "" },
  -- end
  -- if Is_Enabled("vim-tmux-runner") then
    ["<leader>fc"] = { "<cmd>VtrFlushCommand<cr>", "" },
    ["<leader>fr"] = { "<cmd>VtrFocusRunner<cr>", "" },
  -- end
  -- TODO: Write the implementations.
    ["<leader>f"] = { "<cmd>lua Functions.surround_selected_text()<cr>", "" },
    ["<leader>t"] = { "<cmd>lua Functions.hello_world()<cr>", "" },
  },
}
--]]

M.telescope = {
  plugin = true,

  n = {
    --ben
		["<leader>fc"] = { "<cmd>Telescope bibtex<CR>", "citations" },
		["<leader>fp"] = { "<cmd>Telescope live_grep theme=ivy<CR>", "project" },
		["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", "keymaps" },
		["<leader>fm"] = { "<cmd>Telescope man_pages<CR>", "man pages" },
		["<leader>fr"] = { "<cmd>Telescope registers<CR>", "registers" },
		["<leader>ft"] = { "<cmd>Telescope colorscheme<CR>", "theme" },
		["<leader>fy"] = { "<cmd>YankyRingHistory<CR>", "yanks" },
		["<leader>fC"] = { "<cmd>Telescope commands<CR>", "commands" },
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },

    ["<leader>fF"] = { "<cmd>Telescope media_files<cr>", "" },
    ["<leader>fd"] = { "<cmd>Telescope diagnostics<cr>", "" },
    ["<leader>fi"] = {
      "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "media files"},

    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "resume" },
    ["<leader>fw"] = { "<cmd>Telescope grep_string<cr>", "grep string" },

    -- pick a hidden term
    -- ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
    -- git
    ["<leader>gs"] = { "<cmd>Telescope git_status<CR>", "open changed file" },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "checkout branch" },
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "checkout commit" },
  },
}
--]]
-- ------------------------------------------------------------------------- }}}
---[[
M.gitsigns = {
  plugin = true,

  n = {
    ["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "lazygit" },
    ["<leader>gd"] = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },
    ["<leader>gz"] = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "reset buffer" },
    --[[
  -- if Is_Enabled("vim-fugitive") then
    ["<leader>gP"] = { "<cmd>G pull<cr>", "Git pull" },
    ["<leader>gc"] = { "<cmd>G commmit<cr>", "Git commit" },
    ["<leader>gd"] = { "<cmd>G diff<cr>", "Git diff" },
    ["<leader>gl"] = { "<cmd>G log<cr>", "Git log" },
    ["<leader>gh"] = { "<cmd>vert bo help fugitive<cr>", "" },
    ["<leader>gp"] = { "<cmd>G push<cr>", "Git push" },
    ["<leader>gs"] = { "<cmd>G<cr>", "" },
  -- end
  --]]
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    -- ["<leader>ghs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "stage hunk" },
    -- ["<leader>ghu"] = {
      -- "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
      -- "unstage hunk",
    ["<leader>ghr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>ghp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>gt"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

--]]

-- ------------------------------------------------------------------------- }}}
-- {{{ i - LSP
-- TODO: Finish implementing LSP keybindings.  Some plugins are not installed.
---[[

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>ii"] = { "<cmd>LspInfo<cr>", "lsp info" },
    -- LuaSnipUnlinkCurrent
    ["<leader>iu"] = { "<cmd>LuaSnipUnlinkCurrent<cr>", "snip unlink" },
    -- SymoblsOutline
    -- ["<leader>io"] = { "<cmd>SymbolsOutline<cr>", "" },
    -- -- Trouble
    -- ["<leader>iR"] = { "<cmd>TroubleToggle lsp_references<cr>", "" },
    -- ["<leader>id"] = { "<cmd>TroubleToggle<cr>", "" },
    -- vim.diagnostic
    -- vim.lsp
    ["<leader>il"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "lsp codelens" },

    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>is"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>iD"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<leader>ir"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>ia"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>id"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<leader>iq"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>if"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },

    ["<leader>iwa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },

    ["<leader>iwr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },

    ["<leader>iwl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
    },
  },
}
--]]
-- ------------------------------------------------------------------------- }}}
-- {{{ l - latex
M.latex = {
  -- plugin = true,
  n = {
    ["<leader>lb"] = { "<cmd>VimtexCompile<CR>", "build" },
    ["<leader>lc"] = { "<cmd>VimtexCountWords!<CR>", "count" },
    ["<leader>li"] = { "<cmd>VimtexTocOpen<CR>", "index" },
    ["<leader>lv"] = { "<cmd>VimtexView<CR>", "view" },
    --[[
  if Is_Enabled("vimtex") then
    ["<leader>lC"] = { "<Plug>(vimtex-clean-full)", "" },
    ["<leader>lG"] = { "<Plug>(vimtex-status-all)", "" },
    ["<leader>lI"] = { "<Plug>(vimtex-info-full)", "" },
    ["<leader>lK"] = { "<Plug>(vimtex-stop-all)", "" },
    ["<leader>lL"] = { "<Plug>(vimtex-compile-selected)", "" },
    ["<leader>lT"] = { "<Plug>(vimtex-toc-toggle)", "" },
    ["<leader>lX"] = { "<Plug>(vimtex-reload-state)", "" },
    ["<leader>la"] = { "<Plug>(vimtex-context-menu)", "" },
    ["<leader>lc"] = { "<Plug>(vimtex-clean-full)", "" },
    ["<leader>le"] = { "<Plug>(vimtex-error)", "" },
    ["<leader>lg"] = { "<Plug>(vimtex-status)", "" },
    ["<leader>li"] = { "<Plug>(vimtex-info)", "" },
    ["<leader>lk"] = { "<Plug>(vimtex-stop)", "" },
    ["<leader>ll"] = { "<Plug>(vimtex-compile)", "" },
    ["<leader>lm"] = { "<Plug>(vimtex-impas-list)", "" },
    ["<leader>lo"] = { "<Plug>(vimtex-compile-output)", "" },
    ["<leader>lq"] = { "<Plug>(vimtex-log)", "" },
    ["<leader>ls"] = { "<Plug>(vimtex-toggle-main)", "" },
    ["<leader>lt"] = { "<Plug>(vimtex-toc_open)", "" },
    ["<leader>lv"] = { "<Plug>(vimtex-view)", "" },
    ["<leader>lx"] = { "<Plug>(vimtex-reload)", "" },
  end
  --]]
  },
}

-- ------------------------------------------------------------------------- }}}
-- {{{ m - sessionManager
M.sessionManager = {
  -- plugin = true,
  n = {
    ["<leader>ms"] = { "<cmd>SessionManager save_current_session<CR>", "save" },
    ["<leader>md"] = { "<cmd>SessionManager delete_session<CR>", "delete" },
    ["<leader>ml"] = { "<cmd>SessionManager load_session<CR>", "load" },
  },
}
-- ------------------------------------------------------------------------- }}}
-- {{{ p -
--[[
M.= {
	n = {
		["<leader>p"] = { "<cmd>    <cr>", "" },
		["<leader>p"] = { "<cmd>    <cr>", "" },
		["<leader>p"] = { "<cmd>    <cr>", "" },
		["<leader>p"] = { "<cmd>    <cr>", "" },
		["<leader>p"] = { "<cmd>    <cr>", "" },
	},
}
--]]
-- ------------------------------------------------------------------------- }}}
-- {{{ t - Terminals
---[[
-- TODO:  Decide whether or not to keep these duplicate commands.
-- if Is_Enabled("vim-tmux-runner") then
M.terminals = {
  -- plugin = true,
  n = {
    -- name = "",
    ["<leader>tC"] = { "<cmd>VtrClearRunner<cr>", "" },
    ["<leader>tF"] = { "<cmd>VtrFocusRunner<cr>", "" },
    ["<leader>tR"] = { "<cmd>VtrReorientRunner<cr>", "" },
    ["<leader>tr"] = { "<cmd>VtrResizeRunner<cr>", "" },
    ["<leader>ta"] = { "<cmd>VtrReattachRunner<cr>", "" },
    ["<leader>tc"] = { "<cmd>VtrFlushCommand<cr>", "" },
    ["<leader>tf"] = { "<cmd>VtrSendFile!<cr>", "" },
    ["<leader>tk"] = { "<cmd>VtrKillRunner<cr>", "" },
    ["<leader>tl"] = { "<cmd>VtrSendLinesToRunner<cr>", "" },
    ["<leader>to"] = { "<cmd>VtrOpenRunner<cr>", "" },
    ["<leader>ts"] = { "<cmd>VtrSendCommandToRunner<cr>", "" },
    -- end

    -- if Is_Enabled("toggleterm.nvim") then
    ["<Bslash><Bslash>"] = { "<cmd>lua Customize.toggleterm.float()<cr>", "New terminal" },
    ["<leader>Tf"] = { "<cmd>lua Customize.toggleterm.float()<cr>", "" },
    ["<leader>Tl"] = { "<cmd>lua Customize.toggleterm.lazygit()<cr>", "" },
    ["<leader>Tm"] = { "<cmd>lua Customize.toggleterm.neomutt()<cr>", "" },
    -- ["<leader>r"] = { "<cmd>lua Customize.toggleterm.ranger()<cr>", "ranger" },
    -- ["<leader>r"] = { "<cmd>RnvimrToggle<CR>", "ranger" },
    -- ["<A-r>"] = { "<cmd>RnvimrToggle<CR>", "ranger" },
    -- end
  },
}
--]]
---[[
M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}
--]]

-- ------------------------------------------------------------------------- }}}
-- {{{ w - Wiki &  Whitespace | WhichKey
---[[
M.wiki_whitespase = {
  n = {
    ["<leader>wa"] = { "<cmd>edit $HOME/git/wiki/journal/A.md<cr>", "" },
    ["<leader>wb"] = { "<cmd>edit $HOME/git/wiki/journal/B.md<cr>", "" },

    ["<leader>we"] = { "<cmd>WikiExport<cr>", "" },
    ["<leader>wi"] = { "<cmd>WikiIndex<cr>", "" },
    ["<leader>wp"] = { "<cmd>WikiFzfPages<cr>", "" },
    ["<leader>wr"] = { "<cmd>%s/\r//g<cr>", "" },
    ["<leader>wt"] = { "mz<cmd>%s/\t/  /g<cr><cmd>let @/=''<cr>`z", "" },
    ["<leader>ww"] = { "mz<cmd>%s//\\s\\+$////<cr><cmd>let @/=''<cr>`z", "" },
    ["<leader>wZ"] = { "<cmd>WikiFzfTags<cr>", "" },
  },
}
--]]
---[[
M.whichkey = {
  plugin = true,

  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}
--]]
-- ------------------------------------------------------------------------- }}}
-- {{{ y - Templates
M.Templates = {
  plugin = true,
  n = {
    name = "TEMPLATES",
    ["<leader>yp"] = {
      "<cmd>read ~/.config/nvim/lua/custom/LaTeX/templates/PhilPaper.tex<CR>",
      "PhilPaper.tex",
    },
    ["<leader>yl"] = {
      "<cmd>read ~/.config/nvim/lua/custom/LaTeX/templates/Letter.tex<CR>",
      "Letter.tex",
    },
    ["<leader>yg"] = {
      "<cmd>read ~/.config/nvim/lua/custom/LaTeX/templates/Glossary.tex<CR>",
      "Glossary.tex",
    },
    ["<leader>yh"] = {
      "<cmd>read ~/.config/nvim/lua/custom/LaTeX/templates/HandOut.tex<CR>",
      "HandOut.tex",
    },
    ["<leader>yb"] = {
      "<cmd>read ~/.config/nvim/lua/custom/LaTeX/templates/PhilBeamer.tex<CR>",
      "PhilBeamer.tex",
    },
    ["<leader>ys"] = {
      "<cmd>read ~/.config/nvim/lua/custom/LaTeX/templates/SubFile.tex<CR>",
      "SubFile.tex",
    },
    ["<leader>yr"] = {
      "<cmd>read ~/.config/nvim/lua/custom/LaTeX/templates/Root.tex<CR>",
      "Root.tex",
    },
    ["<leader>ym"] = {
      "<cmd>read ~/.config/nvim/lua/custom/LaTeX/templates/MultipleAnswer.tex<CR>",
      "MultipleAnswer.tex",
    },
  },
}
-- ------------------------------------------------------------------------- }}}
-- {{{ z - Surround
M.Surround = {
  plugin = true,
  n = {
    ["<leader>zs"] = { "<Plug>(nvim-surround-normal)", "surround" },
    ["<leader>zd"] = { "<Plug>(nvim-surround-delete)", "delete" },
    ["<leader>zc"] = { "<Plug>(nvim-surround-change)", "change" },
  },
}
-- ------------------------------------------------------------------------- }}}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    -- ["<leader>x"] = {
    --   function()
    --     require("nvchad_ui.tabufline").close_buffer()
    --   end,
    --   "close buffer",
    -- },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    -- ["<leader>/"] = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    -- ["<leader>/"] = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current_context",
    },
  },
}

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

return M
