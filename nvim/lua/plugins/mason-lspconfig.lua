--[[
Author: love-yuri yuri2078170658@gmail.com
Date: 2025-07-19 11:44:07
LastEditTime: 2025-07-19 11:44:12
Description:
--]]
return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "lua_ls", "rust_analyzer" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
