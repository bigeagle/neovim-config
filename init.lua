require('user.options')

vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

if not vim.g.vscode then
  -- do not load plugins in vscode-neovim

  -- lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)


  require("lazy").setup("user.plugins", {
    checker = {
      -- automatically check for plugin updates
      enabled = true,
      -- get a notification when new updates are found
      notify = false,
    },
    change_detection = {
      -- automatically check for config file changes and reload the ui
      enabled = true,
      -- get a notification when changes are found
      notify = false,
    },
  })
end
