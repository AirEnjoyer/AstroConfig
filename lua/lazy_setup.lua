require("lazy").setup({
  require "plugins.debug",
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  {
    "AstroNvim/AstroNvim",
    import = "astronvim.plugins",
    opts = {
      mapleader = " ",
      maplocalleader = ",",
      icons_enabled = true,
      pin_plugins = {
        ["neovim/nvim-lspconfig"] = "0.10.0",
      },
      update_notifications = true,
    },
  },
  { import = "community" },
  { import = "plugins" },
}, {
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
})
