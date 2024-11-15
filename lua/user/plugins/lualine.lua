return {
  'nvim-lualine/lualine.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    local utils = require("lualine.utils.utils")
    local highlight = require("lualine.highlight")

    local diagnostics_message = require("lualine.component"):extend()

    diagnostics_message.default = {
      colors = {
        error = utils.extract_color_from_hllist(
          { "fg", "sp" },
          { "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
          "#e32636"
        ),
        warning = utils.extract_color_from_hllist(
          { "fg", "sp" },
          { "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
          "#ffa500"
        ),
        info = utils.extract_color_from_hllist(
          { "fg", "sp" },
          { "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
          "#ffffff"
        ),
        hint = utils.extract_color_from_hllist(
          { "fg", "sp" },
          { "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
          "#273faf"
        ),
      },
    }
    function diagnostics_message:init(options)
      diagnostics_message.super:init(options)
      self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
      self.highlights = { error = "", warn = "", info = "", hint = "" }
      self.highlights.error = highlight.create_component_highlight_group(
        { fg = self.options.colors.error },
        "diagnostics_message_error",
        self.options
      )
      self.highlights.warn = highlight.create_component_highlight_group(
        { fg = self.options.colors.warn },
        "diagnostics_message_warn",
        self.options
      )
      self.highlights.info = highlight.create_component_highlight_group(
        { fg = self.options.colors.info },
        "diagnostics_message_info",
        self.options
      )
      self.highlights.hint = highlight.create_component_highlight_group(
        { fg = self.options.colors.hint },
        "diagnostics_message_hint",
        self.options
      )
    end

    function diagnostics_message:update_status(is_focused)
      local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
      local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
      if #diagnostics > 0 then
        local diag = diagnostics[1]
        for _, d in ipairs(diagnostics) do
          if d.severity < diag.severity then
            diagnostics = d
          end
        end
        local icons = { "", " ", " ", " " }
        local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
        return highlight.component_format_highlight(hl[diag.severity]) .. icons[diag.severity] .. " " .. diag.message
      else
        return ""
      end
    end


    local opts = {
      options = {
        theme = "monokai-nightasty",
        icons_enabled = true,
      },

      sections = {
        lualine_c = {
          {
            diagnostics_message,
            colors = {
              error = "#fc6688",
              warn = "#ff9700",
              info = "#62d8f1",
              hint = "#888888"
            }
          }
        },
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
                  sleep = "#707080",
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

    require("lualine").setup(opts)
  end
}

-- vim: ts=2 sts=2 sw=2 expandtab
