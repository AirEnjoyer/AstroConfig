-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        "clangd",
        "clang-format",

        "cpptools",
        -- install language servers
        "lua-language-server",

        -- install formatters
        "cpplint",
        "stylua",

        -- install debuggers

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
