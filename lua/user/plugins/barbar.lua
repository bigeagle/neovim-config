return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function ()
    vim.g.barbar_auto_setup = false
  end,
  config = function()

    require('barbar').setup({
      highlight_inactive_file_icons = false,
      hide = {extensions = false, inactive = false},

      icons = {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = 'superscript',
        buffer_number = false,
        button = '',
        filetype = {
          -- Sets the icon's highlight group.
          -- If false, will use nvim-web-devicons colors
          custom_colors = false,

          -- Requires `nvim-web-devicons` if `true`
          enabled = true,
        },
        separator = {left = '▎', right = ''},

        -- If true, add an additional separator at the end of the buffer list
        separator_at_end = true,

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = {button = '●'},
        pinned = {button = '', filename = true},

        -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
        preset = 'default',

        -- Configure the icons on the bufferline based on the visibility of a buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        -- alternate = {filetype = {enabled = false}},
        -- current = {buffer_index = false},
        -- inactive = {},
        -- visible = {modified = {buffer_number = false}},
      },

      sidebar_filetypes = { NvimTree = true },
    })

    -- Close buffer when window is closed
    vim.api.nvim_create_autocmd('WinClosed', {
      callback = function(tbl)
        if tbl.args ~= nil then
          vim.api.nvim_command('BufferClose ' .. tbl.args)
        end
      end,
      group = vim.api.nvim_create_augroup('barbar_close_buf', {})
    })
  end,
}

-- vim: ts=2 sts=2 sw=2 expandtab
