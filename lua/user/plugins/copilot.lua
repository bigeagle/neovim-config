local opts = {
  suggestion = {
    enabled = false,
    auto_trigger = false,
    hide_during_completion = true,
    debounce = 100,
    keymap = {
      accept = false,
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


-- vim.keymap.set("i", '<Tab>', function()
--   if require("copilot.suggestion").is_visible() then
--     require("copilot.suggestion").accept()
--   else
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
--   end
-- end, {
--   silent = true,
-- })


return {
  "zbirenbaum/copilot.lua",
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require("copilot").setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 expandtab
