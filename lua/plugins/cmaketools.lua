return {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    },
    opts = {
        cmake_command = "cmake",
        cmake_build_directory = "build",
        cmake_build_type = "Debug",
        cmake_generate_options = {},
        cmake_build_options = {},
        cmake_console_size = 10,
        cmake_show_console = "always",
    },
}
