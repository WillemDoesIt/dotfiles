return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazygit" },
    },
  },

  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      require("nvim-dap-virtual-text").setup()
      dapui.setup()
      require("configs.dap")

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua require'dap'.repl.open()<CR>", opts)
      vim.api.nvim_set_keymap("n", "<F11>", "<cmd>lua require'dap'.run_last()<CR>", opts)
    end,
  },
}
