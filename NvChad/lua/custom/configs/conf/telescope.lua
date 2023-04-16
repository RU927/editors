local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- local job_opts = {
--   entry_maker = function(entry)
--     local _, _, filename, lnum, col, text = string.find(entry, "([^:]+):(%d+):(.*)")
--     local table = {
--       ordinal = text,
--       display = filename .. ":" .. text
--     }
--     return table
--   end
-- }
--
-- local opts = {
--   finder = finders.new_oneshot_job(rg, job_opts),
--   sorter = sorters.get_generic_fuzzy_sorter(),
-- }

telescope.setup {
  defaults = {
    layout_config = { prompt_position = "top" },
    layout_strategy = "horizontal",
    prompt_prefix = " ",
    selection_caret = " ",
    sorting_strategy = "ascending",
    winblend = 0,
    path_display = { "smart" },
  },
  pickers = {
    colorscheme = { enable_preview = true },
  },
  load_extensions = { "yank_history", "bibtex" },
  extensions = {
    bibtex = {
      depth = 1,
      -- Depth for the *.bib file
      custom_formats = {},
      -- Custom format for citation label
      format = '',
      -- Format to use for citation label.
      -- Try to match the filetype by default, or use 'plain'
      global_files = {'~/texmf/bibtex/bib/Zotero.bib'},
      -- Path to global bibliographies (placed outside of the project)
      search_keys = { 'author', 'year', 'title' },
      -- Define the search keys to use in the picker
      citation_format = '{{author}} ({{year}}), {{title}}.',
      -- Template for the formatted citation
      citation_trim_firstname = true,
      -- Only use initials for the authors first name
      citation_max_auth = 2,
      -- Max number of authors to write in the formatted citation
      -- following authors will be replaced by "et al."
      context = false,
      -- Context awareness disabled by default
      context_fallback = true,
      -- Fallback to global/directory .bib files if context not found
      -- This setting has no effect if context = false
      wrap = false,
      -- Wrapping in the preview window is disabled by default
    },
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
