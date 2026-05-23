local parsers = {
  "json",
  "javascript",
  "typescript",
  "yaml",
  "html",
  "css",
  "bash",
  "lua",
  "vim",
  "python",
  "vue",
  "vimdoc",
  "luadoc",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = function()
    require("nvim-treesitter").install(parsers):wait(300000)
    vim.cmd("TSUpdate")
  end,
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    require("nvim-ts-autotag").setup()
  end,
}

-- vim: ts=2 sts=2 sw=2 expandtab
