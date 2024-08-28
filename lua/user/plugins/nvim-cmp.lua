return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "zbirenbaum/copilot-cmp",  -- copilot
  },
  config = function()
    local cmp = require("cmp")

    local lspkind = require("lspkind")

    cmp.setup({
      performance = {
        debounce = 200,
      },
      completion = {
        completeopt = "menu,menuone,preview,noinsert,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- next suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-o>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<TAB>"] = cmp.mapping.confirm({ select = false }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),

      sources = cmp.config.sources(
        {
          { name = "copilot" },  -- copilot
          { name = "nvim_lsp" }, -- LSP
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
        },
        {
          { name = "nvim_lsp_signature_help" }, -- LSP Signature Help
        }
      ),

      -- Add borders around the popup window
      window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
      },

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = { Copilot = "" }
        }),
      },
    })
  end,
}

-- vim: ts=2 sts=2 sw=2 expandtab
