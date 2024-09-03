local plugins = {
  {
    "NvChad/NvChad",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        ""
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("nvchad.configs.lspconfig")
      require("configs.lspconfig")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "configs.null-ls"
    end
  },
  {
    "saecki/crates.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp"
    },
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      require("cmp").setup.buffer({
        sources = { { name = "crates" }},
      })
      crates.show()
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true
      }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      local M = require("nvchad.configs.cmp")
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = false
      })
      table.insert(M.sources, { name = "crates" })
      return M
    end
  },
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp"
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false
        })
      end)
      require("lazy-lsp").setup {}
    end
  }
}
return plugins
