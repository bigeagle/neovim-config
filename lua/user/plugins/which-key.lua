-- Lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

	local wk = require("which-key")

	-- local telescope = require('telescope.builtin')
	wk.add({
	  -- NvimTree
    { "<leader>e", group = "NvimTree" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle File Explorer on current file" },
    { "<leader>et", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle File Explorer" },

	  -- Telescope
    -- { "<leader>f", group = "fuzzy finder" },
    -- { "<leader>fb", telescope.buffers, desc = "Buffers" },
    -- { "<leader>ff", telescope.find_files, desc = "Find Files" },
    -- { "<C-p>", telescope.find_files, desc = "Find Files" },
    -- { "<leader>fg", telescope.live_grep, desc = "Grep Text" },
    -- { "<leader>fh", telescope.help_tags, desc = "Help tags" },
    -- ToggleTerm
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Open Toggle Term" },

    -- esc to close terminal
    { "<esc><esc>", "<c-\\><c-n>", desc = "Terminal to normal mode", mode='t' },

    -- Barbar
    { "<leader>b", group = "Barbar" },
    { "<leader>bn", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
    { "<leader>bp", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
    { "<leader>bd", "<cmd>BufferClose<cr>", desc = "Close Buffer" },
    { "bn", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
    { "bp", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
    { "bN", "<cmd>BufferMoveNext<cr>", desc = "Move to Next Buffer" },
    { "bP", "<cmd>BufferMovePrevious<cr>", desc = "Move to Previous Buffer" },
    { "bd", "<cmd>BufferClose<cr>", desc = "Close Buffer" },
    { "gt", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
    { "gT", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
    { "<leader>1", "<cmd>BufferGoto 1<cr>", desc = "Goto Buffer 1" },
    { "<leader>2", "<cmd>BufferGoto 2<cr>", desc = "Goto Buffer 2" },
    { "<leader>3", "<cmd>BufferGoto 3<cr>", desc = "Goto Buffer 3" },
    { "<leader>4", "<cmd>BufferGoto 4<cr>", desc = "Goto Buffer 4" },
    { "<leader>5", "<cmd>BufferGoto 5<cr>", desc = "Goto Buffer 5" },
    { "<leader>6", "<cmd>BufferGoto 6<cr>", desc = "Goto Buffer 6" },
    { "<leader>7", "<cmd>BufferGoto 7<cr>", desc = "Goto Buffer 7" },
    { "<leader>8", "<cmd>BufferGoto 8<cr>", desc = "Goto Buffer 8" },
    { "<leader>9", "<cmd>BufferGoto 9<cr>", desc = "Goto Buffer 9" },
    { "<M-1>", "<cmd>BufferGoto 1<cr>", desc = "Goto Buffer 1" },
    { "<M-2>", "<cmd>BufferGoto 2<cr>", desc = "Goto Buffer 2" },
    { "<M-3>", "<cmd>BufferGoto 3<cr>", desc = "Goto Buffer 3" },
    { "<M-4>", "<cmd>BufferGoto 4<cr>", desc = "Goto Buffer 4" },
    { "<M-5>", "<cmd>BufferGoto 5<cr>", desc = "Goto Buffer 5" },
    { "<M-6>", "<cmd>BufferGoto 6<cr>", desc = "Goto Buffer 6" },
    { "<M-7>", "<cmd>BufferGoto 7<cr>", desc = "Goto Buffer 7" },
    { "<M-8>", "<cmd>BufferGoto 8<cr>", desc = "Goto Buffer 8" },
    { "<M-9>", "<cmd>BufferGoto 9<cr>", desc = "Goto Buffer 9" },

	  -- Others
    { "<leader>nh", "<cmd>nohl<cr>", desc = "Clear search highlights" },
    -- { "T", "<cmd>tabnew<cr>", desc = "New Tab" },
  })

  end,
  opts = {}
}

-- vim: ts=2 sts=2 sw=2 expandtab
