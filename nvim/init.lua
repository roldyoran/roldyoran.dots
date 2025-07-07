-- Esto cargará ~/.config/nvim/lua/configs/configs.lua
require('configs.configs')



-- ~/.config/nvim/init.lua
-- Carga Lazy.nvim (si aún no lo tienes)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- versión estable
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configuración básica de Lazy
require("lazy").setup("plugins") -- ¡Aquí le dices que busque en la carpeta "plugins"!






