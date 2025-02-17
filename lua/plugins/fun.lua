if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

return {
  {
    "ActionScripted/tetris.nvim",
    cmd = { "Tetris" },
    keys = { { "<leader>T", "<cmd>Tetris<cr>", desc = "Tetris" } },
    opts = {
      -- your awesome configuration here
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
  },
}
