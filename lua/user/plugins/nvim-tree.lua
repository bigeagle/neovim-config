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

local function change_global_cwd_to_node()
  local api = require("nvim-tree.api")
  local notify = require("notify")

  local ok, node = pcall(api.tree.get_node_under_cursor)
  local abspath = node.absolute_path

  -- if abspath is not directry, get parent directory
  if vim.fn.isdirectory(abspath) == 0 then
    abspath = vim.fs.dirname(abspath)
  end
  vim.api.nvim_set_current_dir(abspath)
  notify("Changed global cwd to " .. abspath, "info", { title = "nvim-tree" })

  -- nvim-tree change cwd to node
  local global_cwd = vim.fn.getcwd(-1, -1)
  api.tree.change_root(global_cwd)
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
  vim.keymap.set('n', '>', change_global_cwd_to_node, opts('Change Global CWD to Node'))

  -- vim.keymap.set('n', 'T', open_tab_silent, opts('Open Tab Silent'))
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local preview = require('nvim-tree-preview')

  vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
  vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')
  vim.keymap.set('n', '<C-f>', function() return preview.scroll(4) end, opts 'Scroll Down')
  vim.keymap.set('n', '<C-b>', function() return preview.scroll(-4) end, opts 'Scroll Up')

  -- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
  vim.keymap.set('n', '<Tab>', function()
    local ok, node = pcall(api.tree.get_node_under_cursor)
    if ok and node then
      if node.type == 'directory' then
        api.node.open.edit()
      else
        preview.node(node, { toggle_focus = true })
      end
    end
  end, opts 'Preview')

end

local opts = {
  auto_reload_on_write = true,
  disable_netrw = true,
  sync_root_with_cwd = false,
  hijack_cursor = false,
  hijack_netrw = false,
  hijack_unnamed_buffer_when_opening = false,
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  reload_on_bufenter = true,
  respect_buf_cwd = false,
  on_attach = my_on_attach,
  select_prompts = false,
  hijack_directories = {
    enable = false,
    auto_open = false,
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
    enable = true,
    update_root = true,
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
    'b0o/nvim-tree-preview.lua', -- previewer
    'nvim-lua/plenary.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require("nvim-tree").setup(opts)

    -- -- auto close nvim-tree when quitting nvim
    -- vim.api.nvim_create_autocmd("QuitPre", {
    --   callback = function()
    --     local tree_wins = {}
    --     local floating_wins = {}
    --     local wins = vim.api.nvim_list_wins()
    --     for _, w in ipairs(wins) do
    --       local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
    --       if bufname:match("NvimTree_") ~= nil then
    --         table.insert(tree_wins, w)
    --       end
    --       if vim.api.nvim_win_get_config(w).relative ~= '' then
    --         table.insert(floating_wins, w)
    --       end
    --     end
    --     if 1 == #wins - #floating_wins - #tree_wins then
    --       -- Should quit, so we close all invalid windows.
    --       for _, w in ipairs(tree_wins) do
    --         vim.api.nvim_win_close(w, true)
    --       end
    --     end
    --   end
    -- })
  end,
}

-- vim: ts=2 sts=2 sw=2 expandtab
