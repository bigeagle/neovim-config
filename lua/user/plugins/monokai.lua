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
      end,
      on_highlights = function(hl, c)
        hl["BufferCurrentIndex"] = { fg = c.purple, bg = c.bg_highlight }
        hl["BufferInactiveIndex"] = { fg = c.grey_light, bg = c.bg_float }
        hl["BufferVisibleIndex"] = { fg = c.grey_light, bg = c.bg_status_alt }
        hl["BufferAlternativeIndex"] = { fg = c.grey_light, bg = c.bg_status_alt }
      end,
    }
    require("monokai-nightasty").load(opts)

  end
}
-- vim: ts=2 sts=2 sw=2 expandtab
