return {
  "aserowy/tmux.nvim",
  dependencies = {
    "folke/which-key.nvim"
  },
  config = function()

    require("tmux").setup({
      copy_sync = {
        enable = false, -- nvim has built-in support
      },
      navigation = {
        enable_default_keybindings = false,
      },
      resize = {
        enable_default_keybindings = true,
      },
    })

    local wk = require('which-key')
    local tmux = require("tmux")
    local tmux_prefix=os.getenv('TMUX_PREFIX')
    -- if tmux_prefix is nil, set it to a default value
    if tmux_prefix == nil then
      tmux_prefix = '<c-b>'
    end

    wk.add({
      -- Tmux
      { tmux_prefix .. "h", tmux.move_left, desc = "select left pane" },
      { tmux_prefix .. "j", tmux.move_bottom, desc = "select lower pane" },
      { tmux_prefix .. "k", tmux.move_top, desc = "select upper pane" },
      { tmux_prefix .. "l", tmux.move_right, desc = "select right pane" },
      -- Terminal
      { tmux_prefix .. "h", tmux.move_left, desc = "select left pane", mode="t" },
      { tmux_prefix .. "j", tmux.move_bottom, desc = "select lower pane", mode="t" },
      { tmux_prefix .. "k", tmux.move_top, desc = "select upper pane", mode="t" },
      { tmux_prefix .. "l", tmux.move_right, desc = "select right pane", mode="t" },
    })
  end
}

-- vim: ts=2 sts=2 sw=2 expandtab
