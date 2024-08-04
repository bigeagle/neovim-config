local opts = {
  options = {
    theme = "one_monokai",
    icons_enabled = true,
  },

  sections = {
    lualine_x = {
      {
        'copilot',
        -- Default values
        symbols = {
          status = {
            icons = {
              enabled = " ",
              sleep = " ",   -- auto-trigger disabled
              disabled = " ",
              warning = " ",
              unknown = " "
            },
            hl = {
              enabled = "#50FA7B",
              sleep = "#AEB7D0",
              disabled = "#6272A4",
              warning = "#FFB86C",
              unknown = "#FF5555"
            }
          },
          spinners = require("copilot-lualine.spinners").dots,
          spinner_color = "#6272A4"
        },
        show_colors = true,
        show_loading = true
      },
      'encoding',
      'fileformat',
      'filetype'
    }
  }
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require("lualine").setup(opts)
  end
}

-- vim: ts=2 sts=2 sw=2 expandtab
