local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = require("custom.core.constants").ensure_installed.lsp_config --{ "lua_ls", "pyright", "r_language_server" }

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

for _, lsp in ipairs(servers) do
  if lsp == "rust_analyzer" then
    local rust_opts = {
      tools = {
        autoSetHints = true,
        executor = require("rust-tools/executors").termopen,
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = "=> ",
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
        },
        hover_actions = {
          border = "single",
          auto_focus = false,
        },
      },

      server = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }

    require("rust-tools").setup(rust_opts)
  else
    lspconfig[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
end
-- 
-- lspconfig.pyright.setup { blabla}
