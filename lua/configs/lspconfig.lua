-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "gopls", "eslint" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.eslint.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          maxLineLength = 88,
          ignore = { "W391" },
        },
        pylint = { enabled = true },
        autopep8 = { enabled = false }, -- лучше использовать null-ls для форматирования
        yapf = { enabled = false },
        flake8 = {
          enabled = true,
          maxLineLength = 88,
          ignore = { "E203", "W503" },
        },
        pyflakes = { enabled = true },
        jedi_completion = { enabled = true },
        pylsp_mypy = { enabled = true },
      },
    },
  },
}
