-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local m = vim.keymap

local function open_folder()
  if vim.fn.has("win32") == 1 then
    local path = vim.fn.expand("%:p")
    path = path:gsub("/", "\\")
    vim.cmd('silent !explorer /select,"' .. path .. '"')
  elseif vim.fn.has("macunix") == 1 then
    local path = vim.fn.expand("%:p:h")
    vim.cmd('silent !open "' .. path .. '"')
  else
    vim.notify("Unsupported OS", vim.log.levels.WARN)
  end
end

local function sendkeys(str)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), 'm', true)
end

local function smart_close()
  local win_count = vim.fn.tabpagewinnr(vim.fn.tabpagenr(), '$')
  if win_count > 1 then
    vim.cmd('close')
  else
    vim.cmd('bd')
  end
end

local function adjust_font_size(amount)
  if amount == 0 then
    vim.g.neovide_scale_factor = 1
  else
    local current_size = vim.g.neovide_scale_factor or 1
    vim.g.neovide_scale_factor = current_size + amount
  end
end

-- m.set("i", "jj", "<esc>")
-- m.set({ "n", "x" }, "j", "v:count?'j':'gj'", { noremap = true, expr = true, desc = "Jump Up" })
-- m.set({ "n", "x" }, "k", "v:count?'k':'gk'", { noremap = true, expr = true, desc = "Jump Down" })

m.set({ "n", "v" }, "<C-=>", function() adjust_font_size(0.1) end, { desc = "Increase Font Size" })
m.set({ "n", "v" }, "<C-->", function() adjust_font_size(-0.1) end, { desc = "Decrease Font Size" })
m.set({ "n", "v" }, "<C-0>", function() adjust_font_size(0) end, { desc = "Reset Font Size" })
m.set({ "n", "v" }, "<C-.>", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })
m.set({ "n", "v" }, "<A-CR>", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })
m.set("v", "+", "<plug>(expand_region_expand)", { desc = "Expand Region" })
m.set("v", "_", "<plug>(expand_region_shrink)", { desc = "Shrink Region" })

m.set({ "n", "v", "i" }, "<C-a>", "<cmd>norm ggVG<CR>", { noremap = true, desc = "Select All" })
m.set("n", "<C-x>", '"0dd', { noremap = true, desc = 'Cut Line to "0' })
m.set("i", "<C-x>", '<esc>"0ddI', { noremap = true, desc = 'Cut Line to "0' })
m.set("v", "<C-x>", '"0d', { noremap = true, desc = 'Cut Selected' })

m.set("n", "zk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
m.set("n", "==", function() LazyVim.format({ force = true }) end, { desc = "Format" })
m.set("v", "==", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format Selection" })
m.set({ "n", "v" }, "<space>=", "==", { noremap = true, desc = "Foramt Indent" })
m.set("n", "<space><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
m.set("n", "<space>,", function() Snacks.picker.recent() end, { desc = "Recent" })
m.set("n", "<space>.", function() Snacks.picker.jumps() end, { desc = "Jumps" })
m.set("n", "<space>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
m.set("n", "<space>`", function() Snacks.picker.marks() end, { desc = "Marks" })
m.set("n", "<space>'", function() Snacks.picker.undo() end, { desc = "Undo History" })
m.set("n", '<space>"', function() Snacks.picker.registers() end, { desc = "Registers" })
m.set("n", "<space>;", "A;<esc>", { desc = "Append Semicolons" })
m.set("n", "<space>|", "<C-w>v", { desc = "Split Window Vertically" })
m.set("n", "<space>-", "<C-w>s", { desc = "Split Window" })
m.set("n", "<space>/", function() vim.wo.wrap = not vim.wo.wrap end, { desc = "Toggle Wrap" })
m.set("n", "<space>\\", function() Snacks.git.blame_line() end, { desc = "Git Blame" })

m.set("n", "<space>q", function() smart_close() end, { desc = "Smart Close" })
m.set({ "n", "v" }, "<space>Q", "<cmd>qa<CR>", { desc = "Quit All" })
m.set("n", "<space>w", "<cmd>w!<CR>", { desc = "Write File" })
m.set("n", "<space>W", "<cmd>w !sudo tee %<CR>", { desc = "Write File with Super User" })

---@diagnostic disable-next-line: missing-fields
m.set("n", "<space>e", function() Snacks.explorer({ cwd = LazyVim.root() }) end, { desc = "File Explorer" })
m.set("n", "<space>E", function() Snacks.explorer.reveal() end, { desc = "File Explorer (Reveal)" })
m.set("n", "<space>r", function() return ":IncRename " .. vim.fn.expand("<cword>") end,
  { expr = true, desc = "IncRename" })
m.set({ "n", "v" }, "<space>R",
  function() require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } }) end,
  { desc = "Search and Replace" })
m.set("n", "<space>t", function() Snacks.picker.grep({ cwd = LazyVim.root() }) end, { desc = "Grep" })

---@diagnostic disable-next-line: undefined-field
m.set("n", "<space>T", function() Snacks.picker.todo_comments() end, { desc = "Todo" })
-- m.set("n", "<space>T", "<cmd>TodoLocList<CR>", { desc = "Todo" })

vim.g.switch_mapping = ""
m.set({ "n", "v" }, "<space>y", "<cmd>Switch<CR>", { desc = "Switch" })
m.set({ "n", "v" }, "<space>Y", "<cmd>SwitchReverse<CR>", { desc = "Switch Reverse" })
---@diagnostic disable-next-line: missing-fields
m.set("n", "<space>u", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end,
  { desc = "Test Run (Neotest)" })
m.set("n", "<space>U", function() require("neotest").summary.toggle() end, { desc = "Test Summary (Neotest)" })
m.set("n", "<space>i", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
m.set("n", "<space>o", function() open_folder() end, { desc = "Open Folder" })
m.set("n", "<space>O", function() Snacks.picker.projects() end, { desc = "Projects" })
m.set("n", "<space>p", '<cmd>norm "0p<CR>', { desc = 'Paste "0' })
m.set("n", "<space>P", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })

m.set({ "n", "v" }, "<space>a", "<C-a>", { noremap = true, desc = "Increase" })
m.set({ "n", "v" }, "<space>A", "<C-x>", { noremap = true, desc = "Decrease" })
m.set("n", "<space>s", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
m.set("n", "<space>S", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
m.set("n", "<space>d", function() Snacks.picker.diagnostics() end, { desc = "Diagnostic" })
m.set("n", "<space>D", function() Snacks.picker.diagnostics_buffer() end, { desc = "Diagnostic Buffer" })
m.set("n", "<space>f", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
m.set("n", "<space>F", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
m.set("n", "<space>g", function() Snacks.lazygit() end, { desc = "Lazygit" })
m.set("n", "<space>G", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
m.set("n", "<space>h", "^", { desc = "Line Begin" })
m.set("n", "<space>l", "$", { desc = "Line End" })
m.set("n", "<space>j", function() sendkeys("<leader>cd") end, { desc = "Line Diagnostic" })
m.set("n", "<space>k", function() vim.lsp.buf.hover() end, { desc = "Hover" })

m.set("n", "<space>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
m.set("n", "<space>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
m.set("n", "<space>x", "<cmd>:x<CR>", { desc = "Save and Quit" })
m.set("n", "<space>X", "<cmd>:xa<CR>", { desc = "Save and Quit All" })
m.set({ "n", "v" }, "<space>c", function() sendkeys("gsr") end, { desc = "Replace Surrounding" })
m.set({ "n", "v" }, "<space>C", function() sendkeys("gsd") end, { desc = "Delete Surrounding" })
m.set("n", "<space>v", function() require("refactoring").refactor("Extract Variable") end, { desc = "Extract Variable" })
m.set("n", "<space>V", function() require("refactoring").refactor("Inline Variable") end, { desc = "Inline Variable" })
m.set("n", "<space>b", "<cmd>OverseerBuild<CR>", { desc = "Build" })
m.set("v", "<space>n", ":norm ", { desc = "Cmd Normal..." })
m.set("n", "<space>n", function() sendkeys("<leader>n") end, { desc = "Notice History" })
m.set("n", "<space>N", function() require("noice").cmd("all") end, { desc = "Notice All" })
m.set("n", "<space>m", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
