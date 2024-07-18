local plugins = {
  {
    "NvChad/NvChad",
    lazy = false
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff-lsp",
        "pyright"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end
  },
  {
    "mfussenegger/nvim-dap"
  },
  {
    "rcarriga/nvim-dap-ui"
  }
}
return plugins
