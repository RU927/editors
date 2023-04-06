local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
-- luasnip setup
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local check_backspace = function() --for Tab
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local compare = require('cmp.config.compare')

Constants = require("config.constants")

cmp.setup {
  	-- preselect = cmp.PreselectMode.None,
  completion = {
    -- autocomplete = {
    --   cmp.TriggerEvent.TextChanged,
    --   cmp.TriggerEvent.InsertEnter,
    -- },
    -- completeopt = "menu,noselect",
    completeopt = "menuone,noinsert,noselect",
    keyword_length = 1,
  },
  sources = Constants.completion.sources,
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,
      -- compare.offset,
      -- compare.exact,
      -- compare.scopes,
      -- compare.score,
      compare.recently_used,
      compare.locality,
      -- compare.kind,
      compare.sort_text,
      compare.length,
      -- compare.order,
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind =
        string.format("%s", Constants.icons.lsp_kinds[vim_item.kind])
      vim_item.menu = (Constants.completion.source_mapping)[entry.source.name]
      return vim_item
    end,
  },

  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
    end,
  },
  mapping = {
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- ['<CR>'] = cmp.config.disable,                      -- Я не люблю, когда вещи автодополняются на <Enter>
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок
    ['<Return>'] = cmp.mapping.confirm({ select = true }),
    -- ['<C-e>'] = cmp.mapping({
    --   i = cmp.mapping.abort(), -- Прерываем автодополнение
    --   c = cmp.mapping.close(), -- Закрываем автодополнение
    -- }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping.scroll_docs( -1),
    ['<C-f>'] = cmp.mapping.scroll_docs(1),
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
    end, { "i", "s", }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable( -1) then
        luasnip.jump( -1)
      else
        fallback()
      end
    end, { "i", "s", }),
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  view = {
    entries = 'custom',
  },
  window = {
    completion = cmp.config.window.bordered({
      side_padding = 0,
      col_offset = -1,
      border = Constants.display_border.border,
    }),
    documentation = {
      border = Constants.display_border.border,
    }
  },
}

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" },
  }, {
    { name = "buffer" },
  }),
})
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } }
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  -- sources = cmp.config.sources({
  sources = ({
    { name = "path" },
    { name = "cmdline" },
  }),
})

-- Toggle cmp entrirely
vim.g.cmptoggle = true -- nvim-cmp off by default if false

local cmp = require('cmp')
cmp.setup {
  enabled = function()
    return vim.g.cmptoggle
  end
}
