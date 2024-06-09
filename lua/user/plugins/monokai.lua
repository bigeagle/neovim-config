return {
	"cpea2506/one_monokai.nvim",
    config = function ()
		require("one_monokai").setup({
			transparent = true,
			italics = true,
			themes = function()
				local colors = require "one_monokai.colors"
				return {
					Pmenu = { bg = colors.bg },
					-- NormalFloat = { fg = colors.pink },
					-- FloatBorder = { fg = colors.pink },
				}
			end
		})
    end
}
