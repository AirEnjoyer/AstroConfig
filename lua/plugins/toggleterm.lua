return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function(_, opts) require("toggleterm").setup(opts) end,
    opts = {

        open_mapping = [[<F2>]],
        insert_mappings = true,
        terminal_mappings = true,
        direction = "float",
        start_in_insert = true,
        float_opts = {
            border = "curved",
        },
    },
}
