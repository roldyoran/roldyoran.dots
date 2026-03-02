return {
  -- Configurar snacks.nvim
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                  position = "right",
              },
            },
          },
        },
      },
    },
  },
}
