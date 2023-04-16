local options = {
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    width = 30,
    hide_root_folder = true,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

return options
--[[
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {

  -- auto_reload_on_write = true,
  -- hijack_unnamed_buffer_when_opening = false,
  -- ignore_buffer_on_setup = false,
  -- open_on_setup = false,
  -- open_on_setup_file = false,
  -- sort_by = "case_sensitive", --"name",
  -- root_dirs = {},
  -- prefer_startup_root = false,
  -- reload_on_bufenter = false,
  -- on_attach = "disable",
  -- remove_keymaps = false,
  -- select_prompts = false,

  -- sync_root_with_cwd = true,
  -- respect_buf_cwd = true,
  -- disable_netrw = true,
  -- hijack_netrw = true,
  -- hijack_cursor = true,
  -- respect_buf_cwd = false,
  -- update_cwd = false,
  -- actions = {
  --   open_file = {
  --     quit_on_open = true,
  --   },
  --   change_dir = {
  --     enable = false,
  --     global = false,
  --     restrict_above_cwd = false,
  --   },
  --   use_system_clipboard = true,
  --   expand_all = {
  --     max_folder_discovery = 300,
  --     exclude = {},
  --   },
  --   file_popup = {
  --     open_win_config = {
  --       col = 1,
  --       row = 1,
  --       relative = "cursor",
  --       border = "shadow",
  --       style = "minimal",
  --     },
  --   },
  --   remove_file = {
  --     close_window = true,
  --   },
  -- },
  -- git = {
  --     enable = true,
  --     ignore = false,
  --     show_on_dirs = true,
  --     show_on_open_dirs = true,
  --     timeout = 500,
  --   },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    -- ignore_list = {},
    -- update_root = true,
  },
  renderer = {
    -- add_trailing = false,
    -- group_empty = false,
    -- highlight_git = false,
    -- full_name = false,
    -- highlight_opened_files = "none",
    -- --highlight_modified = "none",
    -- root_folder_label = ":~:s?$?/..?",
    -- indent_width = 2,
    -- indent_markers = {
    --   enable = true,
    --   inline_arrows = true,
    --   icons = {
    --     corner = "└",
    --     edge = "│",
    --     item = "│",
    --     bottom = "─",
    --     none = " ",
    --   },
    -- },
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    -- special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    -- symlink_destination = true,
  },
  -- hijack_directories = {
  --   enable = true,
  --   auto_open = true,
  -- },
  -- update_focused_file = {
  --   enable = true,
  --   update_root = false,
  --   ignore_list = {},
  -- },
  -- ignore_ft_on_setup = {},
  -- system_open = {
  --   cmd = "",
  --   args = {},
  -- },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    -- show_on_open_dirs = true,
    -- debounce_delay = 50,
    -- severity = {
    --   min = vim.diagnostic.severity.HINT,
    --   max = vim.diagnostic.severity.ERROR,
    -- },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "u", action = "dir_up" },
      },
    },
    -- centralize_selection = false,
    -- --cursorline = true,
    -- hide_root_folder = false,
    -- preserve_window_proportions = false,
    -- number = false,
    -- relativenumber = false,
    -- signcolumn = "yes",
    -- float = {
    --   enable = false,
    --   quit_on_focus_loss = true,
    --   open_win_config = {
    --     relative = "editor",
    --     border = "rounded",
    --     width = 30,
    --     height = 30,
    --     row = 1,
    --     col = 1,
    --   },
    -- },
  },
  -- filesystem_watchers = {
  --   enable = true,
  --   debounce_delay = 50,
  --   ignore_dirs = {},
  -- },

  -- trash = {
  --   cmd = "gio trash",
  -- },
  -- live_filter = {
  --   prefix = "[FILTER]: ",
  --   always_show_folders = true,
  -- },
  -- tab = {
  --   sync = {
  --     open = false,
  --     close = false,
  --     ignore = {},
  --   },
  -- },
  -- notify = {
  --   threshold = vim.log.levels.INFO,
  -- },
  -- log = {
  --   enable = false,
  --   truncate = false,
  --   types = {
  --     all = false,
  --     config = false,
  --     copy_paste = false,
  --     dev = false,
  --     diagnostics = false,
  --     git = false,
  --     profile = false,
  --     watcher = false,
  --   },
  -- },
}
--]]
