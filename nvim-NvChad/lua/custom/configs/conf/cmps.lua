return function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	Constants = require("custom.core.constants")
	local check_backspace = function() --for Tab
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	return {
		completion = {
			completeopt = "menuone,noinsert,noselect",
			keyword_length = 1,
		},
		sources = Constants.completion.sources,
		formatting = {
			fields = { "menu", "abbr", "kind" },
			format = function(entry, vim_item)
				vim_item.kind = string.format("%s", Constants.icons.lsp_kinds[vim_item.kind])
				vim_item.menu = (Constants.completion.source_mapping)[entry.source.name]
				return vim_item
			end,
		},

		mapping = {
			-- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			-- ['<CR>'] = cmp.config.disable,                      -- Я не люблю, когда вещи автодополняются на <Enter>
			-- ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок
			["<Return>"] = cmp.mapping.confirm({ select = true }),
			-- ['<C-e>'] = cmp.mapping({
			--   i = cmp.mapping.abort(), -- Прерываем автодополнение
			--   c = cmp.mapping.close(), -- Закрываем автодополнение
			-- }),
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-d>"] = cmp.mapping.scroll_docs(-1),
			["<C-f>"] = cmp.mapping.scroll_docs(1),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		view = {
			entries = "custom",
		},
		window = {
			completion = cmp.config.window.bordered({
				side_padding = 0,
				col_offset = -1,
				border = Constants.display_border.border,
			}),
			documentation = {
				border = Constants.display_border.border,
			},
		},
	}
end

-- cmp.setup.filetype("gitcommit", {
-- 	sources = cmp.config.sources({
-- 		{ name = "cmp_git" },
-- 	}, {
-- 		{ name = "buffer" },
-- 	}),
-- })
-- cmp.setup.cmdline("/", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = { { name = "buffer" } },
-- })
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	-- sources = cmp.config.sources({
-- 	sources = {
-- 		{ name = "path" },
-- 		{ name = "cmdline" },
-- 	},
-- })
--
-- -- Toggle cmp entrirely
-- vim.g.cmptoggle = true -- nvim-cmp off by default if false
--
-- local cmp = require("cmp")
-- cmp.setup({
-- 	enabled = function()
-- 		return vim.g.cmptoggle
-- 	end,
-- })
