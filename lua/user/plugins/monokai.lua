return {
  "polirritmico/monokai-nightasty.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("monokai-nightasty")

    local opts = {
      on_colors = function(colors)
        colors.fg = "#f8f8f2"
        colors.bg_visual = "#666666"
      end
    }
    require("monokai-nightasty").load(opts)

  end
}
-- vim: ts=2 sts=2 sw=2 expandtab
