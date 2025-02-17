if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

return {
  {
    "alec-gibson/nvim-tetris",
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- smooth scroll misbehaves in neovide
      scroll = { enabled = not vim.g.neovide },
    },
  },
}
