return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup(
      {
        hide_number = true,
        start_in_insert = true,
        direction = 'float', -- vertical | float | tab
      }
    )
  end
}
