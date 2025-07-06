-- ~/.config/nvim/init.lua
-- git clone https://github.com/navarasu/onedark.nvim ~/.local/share/nvim/site/pack/themes/start/onedark.nvim
-- 1. Configuración básica de Neovim (siempre al inicio)
vim.opt.number = true  			-- Numeros de linea
vim.opt.termguicolors = true		-- Colores de terminal	
vim.cmd("syntax on")			-- Sintaxis de color encendida
vim.opt.fillchars = { eob = " " }	-- Quitar virgurillas 	
vim.opt.background = "dark"  -- Fuerza modo oscuro
vim.opt.clipboard = 'unnamedplus'  -- Comparte el portapapeles con el sistema
-- Quitar scroll demas al final del doc
-- Configuración de scroll
vim.opt.scrolloff = 5          -- Líneas de margen vertical
vim.opt.sidescrolloff = 5      -- Líneas de margen horizontal
vim.opt.mousescroll = "ver:1"  -- Scroll suave con mouse (1 línea a la vez)

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




-- 6. Atajos de teclado para copiar/pegar (opcional pero recomendado)
local keymap = vim.keymap.set

-- Copiar al portapapeles del sistema
keymap('v', '<C-c>', '"+y', { desc = 'Copiar al portapapeles del sistema' })
keymap('n', '<leader>y', '"+y', { desc = 'Copiar al portapeles del sistema' })

-- Pegar desde el portapapeles del sistema
keymap('n', '<C-v>', '"+p', { desc = 'Pegar desde el portapapeles del sistema' })
keymap('v', '<C-v>', '"+p', { desc = 'Pegar desde el portapapeles del sistema' })

-- Cortar al portapapeles del sistema
keymap('v', '<C-x>', '"+d', { desc = 'Cortar al portapapeles del sistema' })
