return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    terminal_cmd = "klaude", -- Point to local installation
  },
  keys = {
    { "<leader>c", nil, desc = "AI/Claude Code" },
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>cb",
      function()
        vim.cmd("ClaudeCodeAdd %")
        vim.defer_fn(function() vim.cmd("ClaudeCodeFocus") end, 50)
      end,
      desc = "Add current buffer" },
    { "<leader>cs",
      function()
        vim.cmd("ClaudeCodeSend")
        vim.defer_fn(function() vim.cmd("ClaudeCodeFocus") end, 50)
      end,
      mode = "v", desc = "Send to Claude" },
    {
      "<leader>cs",
      function()
        vim.cmd("ClaudeCodeSend")
        vim.defer_fn(function() vim.cmd("ClaudeCodeFocus") end, 50)
      end,
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
    },
    -- Diff management
    { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
