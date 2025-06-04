-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- opt.guifont = "JetBrainsMonoNL Nerd Font Mono:h12"
-- opt.guifont = "CaskaydiaCove Nerd Font:h12"
opt.guifont = "FiraCode Nerd Font:h12"
-- opt.guifont = "Hack Nerd Font:h12"

opt.spelllang = opt.spelllang + "cjk"
-- opt.spelllang = { "en" }

vim.g.autoformat = false
