---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "cpptools",
        "lua-language-server",
        "cpplint",
        "stylua",
        "tree-sitter-cli",
        "codelldb",
      },
    },
  },
}
