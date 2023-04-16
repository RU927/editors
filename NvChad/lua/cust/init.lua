-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.g.mapleader = " "

-- vim.g.maplocalleader = " "
-- vim.g.maplocalleader = ","
--for R
vim.g.maplocalleader = vim.api.nvim_replace_termcodes('<Bslash>', false, false, true)
--[[

-- vim.g.snippets = "luasnip"

local options = {
--  spell = true,
--  spelllang = { 'ru_ru' },
  backup = false,                            -- создает резервный файл
  clipboard = "unnamedplus",                 -- позволяет neovim получить доступ к системному буферу обмена
  cmdheight = 0,                             -- больше места в командной строке neovim для отображения сообщений
  completeopt = { "menuone", "noselect" },   -- в основном только для cmp
  conceallevel = 0,                          -- чтобы `` был виден в файлах уценки
  fileencoding = "utf-8",                    -- кодировка, записываемая в файл
  hlsearch = true,                           -- выделять все совпадения с предыдущим шаблоном поиска
  foldmethod = "marker",
  mouse = "a",                               -- разрешить использование мыши в neovim
  pumheight = 10,                            -- высота всплывающего меню
  -- showmode = false,                          -- нам больше не нужно видеть такие вещи как -- INSERT --
  -- showtabline = 2,                           -- всегда показывать вкладки
  autoindent = false,                        -- снова сделать отступы умнее
  -- splitbelow = true,                         -- заставить все горизонтальные разделы опускаться ниже текущего окна
  -- splitright = true,                         -- заставляет все вертикальные разрывы располагаться справа от текущего окна
  swapfile = false,                          -- создать файл подкачки
  termguicolors = true,                      -- установить цвета интерфейса терминала (большинство терминалов поддерживают это)
  -- timeoutlen = 300,                          -- время ожидания завершения последовательности отображения (в миллисекундах)
  undofile = false,                           -- включить постоянную отмену
  -- updatetime = 300,                          -- более быстрое завершение (по умолчанию 4000 мс)
  writebackup = false,                       -- если файл редактируется или был записан во время редактирования другой программой, то его редактирование запрещено
  -- number = true,                             -- установить нумерованные строки
  -- relativenumber = false,                     -- установить относительные нумерованные строки
  -- numberwidth = 2,                           -- установить ширину колонки чисел равной 2 {по умолчанию 4}
  cursorline = true,                         -- выделить текущую строку
  cursorcolumn = false,

  -- tabs
  -- expandtab = true,                          -- преобразование табуляции в пробелы
  -- shiftwidth = 2,                            -- количество пробелов, вставляемых для каждого отступа
  -- tabstop = 2,                               -- вставлять 2 пробела для табуляции
  -- smartindent = false,                       -- снова сделать отступы умнее (подстраивать новые строки под предыдущий отступ)
  -- softtabstop = 2,

  -- search
  ignorecase = true,                         -- игнорировать регистр в шаблонах поиска
  smartcase = true,                          -- умный регистр (не игнорировать регистр, если есть символы в верхнем регистре)
  showmatch = true,                          -- подсвечивать найденные текстовые объекты

  fixeol = false,                            -- Отключаем дополнение файлов в конце
  wildmenu = true,
  confirm = true,
  incsearch = true,
  title = true,
  -- guicursor = true,

  hidden = true,
  helplang = "ru",

  signcolumn = "yes",                        -- всегда показывать колонку со знаком, иначе текст будет смещаться каждый раз
  -- wrap = true,                               -- отображать строки как одну длинную строку
  -- breakindent = true,                        -- табуляция обернутых строк
  -- linebreak = true,                          -- компаньон для обертывания, не разделять слова
  -- showbreak = "  ",                          -- установка отступа обернутых строк
  scrolloff = 10,                             -- минимальное количество экранных строк над и под курсором
  sidescrolloff = 7,                         -- минимальное количество столбцов экрана по обе стороны от курсора, если обернуть `false`.
  -- guifont = "monospace:h17",                 -- шрифт, используемый в графических приложениях neovim
}

-- vim.wo.wrap = false
-- vim.wo.number = true

-- vim.bo.tabstop = 2
-- vim.bo.expandtab = true

-- INDENT -- (see also vimtex.lua)
vim.g['tex_flavor'] = 'latex'
vim.g['tex_indent_items'] = 0              --- выключить перечислительный отступ
vim.g['tex_indent_brace'] = 0              --- выключить brace indent
-- vim.g['tex_indent_and'] = 0             --- выравнивать ли по &
-- vim.g['latex_indent_enabled'] = 0
-- vim.g['vimtex_indent_enabled'] = 0
-- vim.g['did_indent'] = 1

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]            -- unites dashed words

-- CLIPBOARD -- (for yanky)
-- to avoid "target string not available" error
vim.g.clipboard = {
  name = "xsel_override",
  copy = {
    ["+"] = "xsel --input --clipboard",
    ["*"] = "xsel --input --primary",
  },
  paste = {
    ["+"] = "xsel --output --clipboard",
    ["*"] = "xsel --output --primary",
  },
  cache_enabled = 1,
}
--]]

