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
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup({
        org_hide_emphasis_markers = true,  -- hides * / _ markers
        org_hide_leading_stars = true,     -- optional: hides outline stars unless cursor on line
        org_hide_links = true,             -- hides [[link]] markup, keeps link text
        org_agenda_files = {
          '/home/willemvz/Documents/orgs/**/*.org',
          '/home/willemvz/Programs/**/*.org',
        },
        org_default_notes_file = '/home/willemvz/Documents/refile.org',
        org_agenda_skip_tags = { 'local' }, -- meaning you can add tag :local: to have a todo not add to agenda
        org_todo_keywords = {'STARTED', 'WAITING', 'TODO', '|', 'DONE', 'CANCELLED'},
      })

      -- Experimental LSP support
      vim.lsp.enable('org')
      vim.opt.conceallevel = 2
      vim.api.nvim_set_hl(0, "orgLink", { underline = true, fg = "#88c0d0" })
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    ft = "org",
    config = function()
      require("headlines").setup({
        org = {
          fat_headlines = false,
          headline_highlights = {
            "Headline1", "Headline2", "Headline3",
            "Headline4", "Headline5", "Headline6",
          },
        },
      })

      -- vim.cmd [[highlight Headline1 guibg=#1e2718]]
      -- vim.cmd [[highlight Headline2 guibg=#21262d]]
      -- vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
      -- vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]
    end,
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
