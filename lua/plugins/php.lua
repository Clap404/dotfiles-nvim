return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              environment = {
                includePaths = {
                  vim.fn.expand("~/Work/PrestaShop"),
                },
              },
            },
          },
        },
      },
    },
  },
}
