local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init


local options = {
  server = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities
  }
}
return options
