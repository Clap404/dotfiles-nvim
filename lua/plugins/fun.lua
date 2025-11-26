if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- smooth scroll
      scroll = { enabled = false },
    },
  },
}
