-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


local function open_tab_silent(node)
  local api = require("nvim-tree.api")

  api.node.open.tab(node)
  vim.cmd.tabprev()

end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'T', open_tab_silent, opts('Open Tab Silent'))

end

local opts = {
  auto_reload_on_write = true,
  disable_netrw = false,
  sync_root_with_cwd = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  reload_on_bufenter = true,
  respect_buf_cwd = false,
  on_attach = my_on_attach,
  select_prompts = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  view = {
    preserve_window_proportions = true,
    width = {},
    float = {
      enable = false,
    },
  },
  renderer = {
    symlink_destination = false,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  filters = {
    dotfiles = true,
    git_clean = false,
    no_buffer = false,
    custom = { "^.git$" }, -- hide .git dir
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  actions = {
    open_file = {
      resize_window = true,
      window_picker = {
        enable = true,
      }
    }
  },
  tab = {
    sync = {
      open = true,
      close = true
    }
  }
}


return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 expandtab
