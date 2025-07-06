-- ~/.config/nvim/init.lua
-- 1. Configuración básica de Neovim (siempre al inicio)
vim.opt.number = true
vim.opt.termguicolors = true
vim.cmd("syntax on")
vim.opt.fillchars = { eob = " " }
vim.opt.background = "dark"  -- Fuerza modo oscuro

-- 2. Configuración del tema onedark.nvim (ANTES de cargar el colorscheme)
require('onedark').setup({
    style = 'darker',          -- Estilo principal
    transparent = true,      -- ¡Fondo transparente!
    term_colors = true,      -- Colores en terminal integrado
    ending_tildes = false,   -- Oculta ~ al final del buffer
})

-- 3. Cargar el tema (esto aplica la configuración)
require('onedark').load()  -- Alternativa: vim.cmd.colorscheme("onedark")

-- 4. Fondo transparente FORZADO (sobrescribe cualquier configuración del tema)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- 5. Treesitter (configuración de plugins va al final)
require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "javascript", "go", "lua", "rust", "bash" },
  highlight = { enable = true },
})
