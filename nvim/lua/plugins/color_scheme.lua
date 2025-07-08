--return {
-- add onedark
--  { "navarasu/onedark.nvim" }, -- Versión mantenida de onedark

-- Configure LazyVim to load gruvbox
--  {
--  "LazyVim/LazyVim",
--opts = {
--colorscheme = "onedark",
--},
--},
--}
--

return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        options = {
          transparency = true, -- Fondo totalmente transparente
          bold = true, -- Texto en negrita para más contraste
          italic = true, -- Texto en cursiva
          underline = true, -- Subrayados visibles
        },
        colors = {
          -- Colores más vibrantes (puedes ajustar estos valores)
          bright_orange = "#FFA500",
          bright_red = "#FF0000",
          bright_yellow = "#FFFF00",
          bright_green = "#5FCF7F",
          bright_cyan = "#00FFFF",
          bright_blue = "#0000FF",
          bright_purple = "#FF00FF",
        },
        highlights = {
          -- Ejemplos de highlights más llamativos
          ["@variable"] = { fg = "${bright_orange}" },
          ["@function"] = { fg = "${bright_yellow}", bold = true },
          ["@string"] = { fg = "${bright_green}" },
          ["@keyword"] = { fg = "${bright_purple}", italic = true },
        },
        styles = {
          comments = "italic",
          functions = "bold",
          keywords = "italic,bold",
          variables = "bold",
        },
      })
      vim.cmd("colorscheme onedark")

      -- Asegurar que la transparencia se aplique correctamente
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
