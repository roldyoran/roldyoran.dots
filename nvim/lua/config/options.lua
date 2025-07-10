-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- ~/.config/nvim/lua/config/options.lua
vim.opt.relativenumber = false -- Desactiva números relativos

vim.opt.guicursor = table.concat({
  "v-c-i:ver25-Cursor", -- Línea vertical en Normal, Visual y Comando
  --- "i-ci-ve:block-Cursor", -- Bloque en Insertar (opcional, cámbialo si prefieres otra forma)
  "r-cr:hor20-Cursor", -- Línea horizontal en Replace
}, ",")
