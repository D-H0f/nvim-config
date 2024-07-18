local plugins = {
  {
    "NvChad/NvChad",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "nvcad",
        "black",
        "debugpy",
        "mypy",
        "ruff",
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
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "configs.null-ls"
    end
  }
}
return plugins
