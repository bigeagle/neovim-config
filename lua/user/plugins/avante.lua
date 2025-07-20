return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  -- version = "0.0.23", -- set this to "*" if you want to always pull the latest change, false to update on release
  version = "*", -- set this to "*" if you want to always pull the latest change, false to update on release
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "folke/snacks.nvim",
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function()
    local opts = {
      provider = "moonshot",
      providers = {
        moonshot = {
          __inherited_from = "openai",
          endpoint = "https://api.moonshot.cn/v1",
          model = "kimi-k2-0711-preview",
          api_key_name = 'MOONSHOT_API_KEY',
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.6,
            max_tokens = 32768,
          },
        },
      },
      file_selector = {
        -- file_selector = "fzf",
        provider = "telescope",
        file_selector_opts = {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.5,
          },
        },
      },
      input = {
        provider = "snacks",
        provider_opts = {
          -- Additional snacks.input options
          title = "Avante Input",
          icon = " ",
        },
      }
    }

    require("avante").setup(opts)
  end,
}
