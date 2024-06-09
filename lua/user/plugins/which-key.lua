-- Lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

	local wk = require("which-key")
	
	local telescope = require('telescope.builtin')
	wk.register({
		-- Telescope
		["<leader>f"] = {
			name = "+fuzzy finder",
			f = {telescope.find_files, "Find Files"},
			g = {telescope.live_grep, "Grep Text"},
			b = {telescope.buffers, "Buffers"},
			h = {telescope.help_tags, "Help tags"},
		},
		
		-- NvimTree
		["<leader>e"] = {
			name = "+NvimTree",
			t = {"<cmd>NvimTreeToggle<cr>", "Toggle File Explorer"},
			f = {"<cmd>NvimTreeFindFileToggle<cr>", "Toggle File Explorer on current file"},
		},
		
		-- Others
		["<leader>nh"] = {"<cmd>nohl<cr>", "Clear search highlights"},
	})

  end,
  opts = {}
}

