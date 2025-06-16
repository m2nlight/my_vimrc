-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guifont = "FiraCode Nerd Font,LXGW WenKai Mono:h11"
-- vim.opt.guifont = "JetBrainsMonoNL Nerd Font Mono:h11"
-- vim.opt.guifont = "CaskaydiaCove Nerd Font:h11"
-- vim.opt.guifont = "Hack Nerd Font:h11"

vim.opt.spelllang = vim.opt.spelllang + "cjk"
-- vim.opt.spelllang = { "en" }

vim.g.autoformat = false
vim.g.mapleader = ","

vim.g.im_select_command = "D:/Tools/mini/im-select.exe"
vim.g.im_select_default = "1033"
vim.g.im_select_enable_focus_events = 0
