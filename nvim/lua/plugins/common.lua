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

  ---@module "neominimap.config.meta"
  {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    lazy = false, -- NOTE: NO NEED to Lazy load
    -- Optional. You can alse set your own keybindings
    keys = {
      -- Global Minimap Controls
      { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
      { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
      { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
      { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

      -- Window-Specific Minimap Controls
      { "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
      { "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
      { "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
      { "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },

      -- Tab-Specific Minimap Controls
      { "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
      { "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
      { "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
      { "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },

      -- Buffer-Specific Minimap Controls
      { "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
      { "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
      { "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
      { "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },

      ---Focus Controls
      { "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
      { "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
      { "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
    },
    init = function()
      -- The following options are recommended when layout == "float"
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36 -- Set a large value

      --- Put your configuration here
      ---@type Neominimap.UserConfig
      vim.g.neominimap = {
        auto_enable = true,
        click = {
          enabled = true,
        },
        mini_diff = {
          enabled = true,
        },
        search = {
          enabled = true,
        },
        mark = {
          enabled = true,
        },
      }
    end,
  },
}
