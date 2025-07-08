return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle position=right<cr>", desc = "Explorer (Right)" },
      { "<leader>E", "<cmd>Neotree toggle position=right cwd=<cwd><cr>", desc = "Explorer (CWD, Right)" },
    },
    opts = {
      window = {
        position = "right", -- Fuerza la posición derecha
        width = 35, -- Ancho fijo
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Archivos ocultos visibles
          hide_dotfiles = false,
        },
      },
    },
  },
}
