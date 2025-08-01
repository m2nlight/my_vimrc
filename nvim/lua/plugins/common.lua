-- if true then return {} end

return {
  -- colorscheme
  { "sainnhe/everforest" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "everforest",
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin-latte",
      -- colorscheme = "tokyonight-day",
    },
  },

  -- disabled
  -- { "neotest-golang", enabled = false },

  -- plugins
  { "AndrewRadev/switch.vim" },
  { "brglng/vim-im-select" },
  { "chaoren/vim-wordmotion" },
  { "terryma/vim-expand-region" },
  { "HiPhish/rainbow-delimiters.nvim" },

  -- override gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  -- override blink.cmp plugin
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
    },
  },

  -- override Snack plugin
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          db = {
            sqlite3_path = vim.fn.stdpath("config") .. "\\bin\\sqlite3.dll",
          },
        },
        dashboard = {
          preset = {
            header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          },
        },
      })
    end,
  },

}
