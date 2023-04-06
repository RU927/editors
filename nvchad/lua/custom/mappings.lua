local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		-- Personal normal keybindings
		-- ['<C-h>'] = { "<C-w>h", "", opts = {nowait = true} },
		-- ['<C-j>'] = { "<C-w>j", "", opts = {nowait = true} },
		-- ['<C-k>'] = { "<C-w>k", "", opts = {nowait = true} },
		-- ['<C-l>'] = { "<C-w>l", "", opts = {nowait = true} },
		["ww"] = { ":w<cr>", "write" },
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
		-- ["<leader>j"] = { ":cnext<CR>zz", "", opts = {nowait = true} },
		-- ["<leader>k"] = { ":cprev<CR>zz", "", opts = {nowait = true} },
		-- ["<leader>i"] = { ":lnext<CR>zz", "", opts = {nowait = true} },
		-- ["<leader>o"] = { ":lprev<CR>zz", "", opts = {nowait = true} },
		-- ["<leader>cc"] = { ":cclose<CR>", "", opts = {nowait = true} },
		-- quick split
		-- ["<leader>wsv"] = { ":vsp<CR>", "", opts = {nowait = true} },
		-- search result focus
		["n"] = { "nzzzv", "replace search result" },
		["N"] = { "Nzzzv", "replace srarch result" },
		-- join lines focus
		["J"] = { "mzJ`z", "concatenate string" },
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
		-- ------------------------------------------------------------------------- }}}
	},
	-- Insert --
	i = {
		-- Press jk fast to enter
		["jk"] = { "<escape>", "quit insert mode" },
		["kj"] = { "<escape>", "quit insert mode" },

		["ww"] = { "<escape>:ww<cr>", "write" },
		["wq"] = { "<escape>:wq<cr>", "write and quit" },
		["qq"] = { "<escape>:q<cr>", "quite" },
	},
	-- Visual --
	v = {
		-- tabulation
		["<"] = { "<gv", "tab del" },
		[">"] = { ">gv", "tab add" },
		-- Move text up and down
		["<A-j>"] = { ":m .+1<CR>==", "move down string" },
		["<A-k>"] = { ":m .-2<CR>==", "move up string" },

		["P"] = { '"_dP', "" },
		["p"] = { '"_dp', "" },
	},
	-- Terminal --
	t = {
		["<Esc><Esc>"] = { "<C-\\><C-n>", "" },
		["<C-h>"] = { "<c-\\><c-n><c-w>h", "" },
		["<C-j>"] = { "<c-\\><c-n><c-w>j", "" },
		["<C-k>"] = { "<c-\\><c-n><c-w>k", "" },
		["<C-l>"] = { "<c-\\><c-n><c-w>l", "" },
	},
	--Visual Block --
	x = {
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
		-- ["<leader>ag"] = { "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary" },
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
		["<leader>as"] = { "<cmd>e ~/.config/nvim/snippets/tex.snippets<CR>", "edit snippets" },
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
M.explorers = {
	-- plugin = true,
	n = {
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
		["<leader>r"] = { "<cmd> RnvimrToggle <CR>", "ranger" },
		["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "toggle undotree" },
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
-- ------------------------------------------------------------------------- }}}
-- {{{ f - Find &zo tmux
M.find = {
	-- plugin = true,
	n = {
		["<leader>fc"] = { "<cmd>Telescope bibtex<CR>", "citations" },
		["<leader>ff"] = { "<cmd>Telescope live_grep theme=ivy<CR>", "project" },
		["<leader>fg"] = { "<cmd>Telescope git_branches<CR>", "branches" },
		["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "help" },
		["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", "keymaps" },
		["<leader>fm"] = { "<cmd>Telescope man_pages<CR>", "man pages" },
		["<leader>fr"] = { "<cmd>Telescope registers<CR>", "registers" },
		["<leader>ft"] = { "<cmd>Telescope colorscheme<CR>", "theme" },
		["<leader>fy"] = { "<cmd>YankyRingHistory<CR>", "yanks" },
		-- ["<leader>fc"] = { "<cmd>Telescope commands<CR>", "commands" },
		-- ["<leader>fr"] = { "<cmd>Telescope oldfiles<CR>", "recent" },
		--[[
  -- if Is_Enabled("telescope.nvim") then
    ["<leader>fC"] = { "<cmd>Telescope commands<cr>", "" },
    ["<leader>fF"] = { "<cmd>Telescope media_files<cr>", "" },
    ["<leader>fM"] = { "<cmd>Telescope man_pages<cr>", "" },
    ["<leader>fO"] = { "<cmd>Telescope oldfiles<cr>", "" },
    ["<leader>fR"] = { "<cmd>Telescope registers<cr>", "" },
    ["<leader>fS"] = { "<cmd>Telescope colorscheme<cr>", "" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "" },
    ["<leader>fd"] = { "<cmd>Telescope diagnostics<cr>", "" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "" },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "" },
    Keymap(
      "n",
      "<leader>fi",
      "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>"
    )
    ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "" },
    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "" },
    ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "" },
    ["<leader>fw"] = { "<cmd>Telescope grep_string<cr>", "" },
  -- end

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
  --]]
	},
}
-- ------------------------------------------------------------------------- }}}
-- {{{ g - git
M.git = {
	-- plugin = true,
	n = {
		["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "lazygit" },
		["<leader>gj"] = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "next hunk" },
		["<leader>gk"] = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "prev hunk" },
		["<leader>gl"] = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "blame" },
		["<leader>gp"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "preview hunk" },
		["<leader>gr"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "reset hunk" },
		["<leader>gs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "stage hunk" },
		["<leader>gu"] = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"unstage hunk",
		},
		-- if Is_Enabled("telescope.nvim") then
		["<leader>go"] = { "<cmd>Telescope git_status<CR>", "open changed file" },
		["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "checkout branch" },
		["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "checkout commit" },
		-- end
		-- if Is_Enabled("gitsigns.nvim") then
		["<leader>gd"] = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },
		["<leader>gz"] = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "" },
		-- end
		--[[
  -- if Is_Enabled("vim-fugitive") then
    ["<leader>gP"] = { "<cmd>G pull<cr>", "" },
    ["<leader>gc"] = { "<cmd>G commmit<cr>", "" },
    ["<leader>gd"] = { "<cmd>G diff<cr>", "" },
    ["<leader>gl"] = { "<cmd>G log<cr>", "" },
    ["<leader>gh"] = { "<cmd>vert bo help fugitive<cr>", "" },
    ["<leader>gp"] = { "<cmd>G push<cr>", "" },
    ["<leader>gs"] = { "<cmd>G<cr>", "" },
  -- end
  --]]
	},
}
-- ------------------------------------------------------------------------- }}}
-- {{{ i - LSP
-- TODO: Finish implementing LSP keybindings.  Some plugins are not installed.
---[[
M.lsp = {
	-- plugin = true,
	n = {
		-- name = "",
		["<leader>ii"] = { "<cmd>LspInfo<cr>", "" },
		-- LuaSnipUnlinkCurrent
		["<leader>iu"] = { "<cmd>LuaSnipUnlinkCurrent<cr>", "" },
		-- SymoblsOutline
		["<leader>io"] = { "<cmd>SymbolsOutline<cr>", "" },
		--Telescope
		["<leader>iS"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "" },
		["<leader>is"] = { "<cmd>Telescope lsp_document_symbols<cr>", "" },
		-- Trouble
		["<leader>iR"] = { "<cmd>TroubleToggle lsp_references<cr>", "" },
		["<leader>id"] = { "<cmd>TroubleToggle<cr>", "" },
		-- vim.diagnostic
		-- ["<leader>ij"] = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>, "" },
		-- ["<leader>ik"] = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>, "" },
		-- vim.lsp
		["<leader>il"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "" },
		["<leader>iq"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "" },
		-- vim.lsp.buf
		["<leader>ia"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "" },
		["<leader>if"] = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "" },
		["<leader>ir"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "" },
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
		["<leader>ph"] = { "<cmd>Lazy home<cr>", "home" },
		["<leader>pl"] = { "<cmd>Lazy log<cr>", "log" },
		["<leader>pp"] = { "<cmd>Lazy profile<cr>", "profile" },
		["<leader>ps"] = { "<cmd>Lazy sync<cr>", "sync" },
		["<leader>pu"] = { "<cmd>Lazy update<cr>", "update" },
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
-- ------------------------------------------------------------------------- }}}
-- {{{ w - Wiki &  Whitespace
---[[
M.wiki_whitespase = {
	plugin = true,
	n = {
		name = "wiki",
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
-- ------------------------------------------------------------------------- }}}
-- {{{ y - Templates
M.Templates = {
	plugin = true,
	n = {
		name = "TEMPLATES",
		["<leader>yp"] = {
			"<cmd>read ~/.config/nvim/lua/custom/templates/PhilPaper.tex<CR>",
			"PhilPaper.tex",
		},
		["<leader>yl"] = {
			"<cmd>read ~/.config/nvim/lua/custom/templates/Letter.tex<CR>",
			"Letter.tex",
		},
		["<leader>yg"] = {
			"<cmd>read ~/.config/nvim/lua/custom/templates/Glossary.tex<CR>",
			"Glossary.tex",
		},
		["<leader>yh"] = {
			"<cmd>read ~/.config/nvim/lua/custom/templates/HandOut.tex<CR>",
			"HandOut.tex",
		},
		["<leader>yb"] = {
			"<cmd>read ~/.config/nvim/lua/custom/templates/PhilBeamer.tex<CR>",
			"PhilBeamer.tex",
		},
		["<leader>ys"] = {
			"<cmd>read ~/.config/nvim/lua/custom/templates/SubFile.tex<CR>",
			"SubFile.tex",
		},
		["<leader>yr"] = {
			"<cmd>read ~/.config/nvim/lua/custom/templates/Root.tex<CR>",
			"Root.tex",
		},
		["<leader>ym"] = {
			"<cmd>read ~/.config/nvim/lua/custom/templates/MultipleAnswer.tex<CR>",
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

-- M.nvimtree = {
-- 	plugin = true,
-- 	n = {},
-- }
--
-- M.nvimtree = {
-- 	plugin = true,
-- 	n = {},
-- }

-- more keybinds!

return M
