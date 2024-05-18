-- local status_ok, configs = pcall(require, "nvim-treesitter.configs")
-- if not status_ok then
--   return
-- end

local options = {}
  options = {
  ensure_installed = Constants.ensure_installed.treesitter,
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true,
  ignore_install = { "latex" }, --{ "javascript" },-- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "css","latex" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "python", "css", "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o', -- Переключает редактор запросов, когда игровая площадка сфокусирована.
      toggle_hl_groups = 'i', -- Переключает видимость групп подсветки.
      toggle_injected_languages = 't', -- Переключает видимость вводимых языков.
      toggle_anonymous_nodes = 'a', -- Переключает видимость анонимных узлов.
      toggle_language_display = 'I', -- Переключает видимость языка, к которому принадлежит узел.
      focus_language = 'f', -- Фокусирует дерево языка под курсором на игровой площадке. Редактор запросов теперь будет использовать специализированный язык.
      unfocus_language = 'F', -- Расфокусирует текущий язык.
      update = 'R', -- Обновляет представление игровой площадки при фокусировке или перезагружает запрос при фокусировке редактора запросов.
      goto_node = '<cr>', -- Перейти к текущему узлу в буфере кода
      show_help = '?',
    }
  },
  query_linter = {
    enable = false,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  }
}

return options
