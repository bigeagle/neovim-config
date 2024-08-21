-- Lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

	local wk = require("which-key")

	local telescope = require('telescope.builtin')
	wk.add({
	  -- NvimTree
    { "<leader>e", group = "NvimTree" },
    -- { "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle File Explorer on current file" },
    { "<leader>et", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle File Explorer" },
	  -- Telescope
    { "<leader>f", group = "fuzzy finder" },
    { "<leader>fb", telescope.buffers, desc = "Buffers" },
    { "<leader>ff", telescope.find_files, desc = "Find Files" },
    { "<leader>fg", telescope.live_grep, desc = "Grep Text" },
    { "<leader>fh", telescope.help_tags, desc = "Help tags" },
	  -- Others
    { "<leader>nh", "<cmd>nohl<cr>", desc = "Clear search highlights" },
    { "T", "<cmd>tabnew<cr>", desc = "New Tab" },
  })

  end,
  opts = {}
}

-- vim: ts=2 sts=2 sw=2 expandtab
