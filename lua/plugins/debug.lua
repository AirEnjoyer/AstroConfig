return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp

      -- Keymaps
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
      map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
      map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
      map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
      map("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
      map("n", "<Leader>B>", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
      map("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
      map("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end

      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end

      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
}
