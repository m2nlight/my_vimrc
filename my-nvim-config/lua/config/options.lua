-- vim.options are automatically loaded before lazy.nvim startup
-- Default vim.options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/vim.options.lua
-- Add any additional vim.options here

vim.opt.guifont = "FiraCode Nerd Font,LXGW WenKai Mono:h11"
-- vim.opt.guifont = "Hack Nerd Font Mono,LXGW WenKai Mono:h11"
-- vim.opt.guifont = "JetBrainsMono Nerd Font,LXGW WenKai Mono:h11"

vim.opt.spelllang = vim.opt.spelllang + "cjk"
-- vim.opt.spelllang = { "en" }

vim.g.autoformat = false
vim.g.mapleader = "\\"
vim.g.wordmotion_prefix=","

vim.g.im_select_command = "D:/Tools/mini/im-select.exe"
vim.g.im_select_default = "1033"
vim.g.im_select_enable_focus_events = 0

-- neovide https://neovide.dev/configuration.html
-- vim.g.neovide_cursor_smooth_blink = false
-- vim.g.neovide_hide_mouse_when_typing = true
-- vim.g.neovide_scroll_animation_length = 0.2
-- vim.g.neovide_scroll_animation_far_lines = 1
-- vim.g.neovide_refresh_rate = 240
-- vim.g.neovide_cursor_animation_length = 0
-- vim.g.neovide_cursor_animate_in_insert_mode = false
-- vim.g.neovide_scale_factor = 1
-- vim.opt.guicursor = 'a:block-blinkwait500-blinkon500-blinkoff500'

