return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    vim.opt.termguicolors = true
    local opts = {

    }
    require('nvim-highlight-colors').setup(opts)
  end
}

-- vim: ts=2 sts=2 sw=2 expandtab
