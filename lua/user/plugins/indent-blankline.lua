return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = { char = "┊" },
    exclude = { filetypes = {'dashboard'} },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
	}
}

