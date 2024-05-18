local options = {
	-- Сопоставление типа файла с форматерами
	formatters_by_ft = {
		lua = { { "stylua", "luaformatter" } },
		-- Conform будет последовательно запускать несколько форматеров
		-- python = { "isort", "black" },
		go = { "goimports", "gofmt" },
		-- Используйте вложенный список для запуска только первого доступного форматировщика
		javascript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		sh = { "shfmt" },
		-- Здесь можно использовать функцию для динамического определения форматтеров
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,
		-- Используйте тип файла "*" для запуска форматеров на всех типах файлов.
		-- ["*"] = { "codespell" },
		-- Используйте тип файла "_" для запуска форматировщиков на тех типах файлов, для которых не
		-- не настроены другие форматтеры.
		-- ["_"] = { "trim_whitespace" }
	},
	-- Если это значение установлено, Conform будет запускать форматтер при сохранении.
	-- Он будет передавать таблицу в conform.format().
	-- Это также может быть функция, возвращающая таблицу.
	format_on_save = {
		-- Я рекомендую использовать эти опции. Подробности см. в :help conform.format.
		lsp_fallback = true,
		timeout_ms = 500,
	},
	-- Если это значение установлено, Conform будет запускать форматтер асинхронно после сохранения.
	-- Он будет передавать таблицу в conform.format().
	-- Это также может быть функция, возвращающая таблицу.
	format_after_save = {
		lsp_fallback = false,
	},
	-- Установка уровня журнала. Используйте `:ConformInfo`, чтобы увидеть расположение файла журнала.
	log_level = vim.log.levels.ERROR,
	-- Conform будет уведомлять вас об ошибках форматера
	notify_on_error = true,
}

require("conform").setup(options)
