-- ~/.config/nvim/lua/plugins/file-explorer.lua

return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        view = {
          side = 'right',
          width = 35,
        },
      })

      -- Función para toggle que funciona en cualquier contexto
      local function toggle_nvim_tree()
        local api = require('nvim-tree.api')
        -- Intenta encontrar el árbol, si no está abierto lo abre
        api.tree.toggle({ focus = false })
      end

      -- Mapeo que funciona en modo normal y también dentro del nvim-tree
      vim.keymap.set('n', '<C-e>', toggle_nvim_tree, { noremap = true, silent = true })
    end,
  }
}
