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

    -- terminal color scheme
    vim.g.terminal_color_0 = "#151515"
    vim.g.terminal_color_8 = "#505050"
    vim.g.terminal_color_1 = "#ac4142"
    vim.g.terminal_color_9 = "#ac4142"
    vim.g.terminal_color_2 = "#7e8d50"
    vim.g.terminal_color_10 = "#7e8d50"
    vim.g.terminal_color_3 = "#e5b566"
    vim.g.terminal_color_11 = "#e5b566"
    vim.g.terminal_color_4 = "#6c99ba"
    vim.g.terminal_color_12 = "#6c99ba"
    vim.g.terminal_color_5 = "#9e4e85"
    vim.g.terminal_color_13 = "#9e4e85"
    vim.g.terminal_color_6 = "#7dd5cf"
    vim.g.terminal_color_14 = "#7dd5cf"
    vim.g.terminal_color_7 = "#d0d0d0"
    vim.g.terminal_color_15 = "#f5f5f5"

  end
}
-- vim: ts=2 sts=2 sw=2 expandtab
