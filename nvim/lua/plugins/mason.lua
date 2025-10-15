-- if true then return {} end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = { mason = false },
    },
  },
}