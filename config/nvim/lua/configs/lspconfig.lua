local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local neodev = require "neodev"
local coq = require "coq"

-- if you just want default config for the servers then put them in a table
local servers = require("core.constants").ensure_installed.lsp_config --{ "lua_ls", "pyright", "r_language_server" }

for _, lsp in ipairs(servers) do
  neodev.setup()
  lspconfig[lsp].setup({
  -- lspconfig[lsp].setup(coq.lsp_ensure_capabilities {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        workspace = {
          library = {
            ["$XDG_DATA_HOME/awesome-code-doc/"] = true,
          },
        },
      },
    },
  })
end

lspconfig.pyright.setup {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        -- stubPath = "./typings",
        -- reportMissingTypeStubs = true,
        -- reportMissingSuperCall = true,
        -- reportMissingImports = true,
        diagnosticMode = "workspace",
        -- diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportPrivateImportUsage = false,
        },
        -- packageIndexDepths = {
        --   name = "gi.repository",
        --   depth = 5,
        --   includeAllSymbols = false,
        -- },
        -- extraPaths = {
        --   "/usr/lib/python3/dist-packages/gi"
        -- }
        -- autoImportCompletions = true,
        -- importFormat = "relative",
      },
    },
  },
  single_file_support = true,
}

-- lspconfig.clangd.setup {
--   on_attach = on_attach,
--   capabilities = function()
--     local caps = capabilities
--     caps.offsetEncoding = "utf-8"
--     return caps
--   end,
-- }
