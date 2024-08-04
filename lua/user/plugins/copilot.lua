local opts = {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = true,
    debounce = 100,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
}


return {
  "zbirenbaum/copilot.lua",
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require("copilot").setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 expandtab
