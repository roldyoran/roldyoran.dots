return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function()
      local logo = [[
██████╗  ██████╗ ██╗     ██████╗ ██╗   ██╗ ██████╗ ██████╗  █████╗ ███╗   ██╗
██╔══██╗██╔═══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔═══██╗██╔══██╗██╔══██╗████╗  ██║
██████╔╝██║   ██║██║     ██║  ██║ ╚████╔╝ ██║   ██║██████╔╝███████║██╔██╗ ██║
██╔══██╗██║   ██║██║     ██║  ██║  ╚██╔╝  ██║   ██║██╔══██╗██╔══██║██║╚██╗██║
██║  ██║╚██████╔╝███████╗██████╔╝   ██║   ╚██████╔╝██║  ██║██║  ██║██║ ╚████║
╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
]]

      logo = string.rep("\n", 4) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          statusline = false,
          tabline = true,
          winbar = true,
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = "lua LazyVim.pick()()", desc = " Find File", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
            {
              action = 'lua LazyVim.pick("oldfiles")()',
              desc = " Recent Files",
              icon = " ",
              key = "r",
            },
            {
              action = 'lua LazyVim.pick("live_grep")()',
              desc = " Find Text",
              icon = " ",
              key = "g",
            },
            {
              action = "lua LazyVim.pick.config_files()()",
              desc = " Config",
              icon = " ",
              key = "c",
            },
            {
              action = 'lua require("persistence").load()',
              desc = " Restore Session",
              icon = " ",
              key = "s",
            },
            { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            {
              action = function()
                vim.api.nvim_input("<cmd>qa<cr>")
              end,
              desc = " Quit",
              icon = " ",
              key = "q",
            },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "⚡ Neovim loaded "
                .. stats.loaded
                .. "/"
                .. stats.count
                .. " plugins in "
                .. ms
                .. "ms",
            }
          end,
        },
      }

      -- Ajustar formato de los botones
      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- Configuración de colores usando onedarkpro
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dashboard",
        callback = function()
          local colors = require("onedarkpro.helpers").get_colors()

          -- Grupos principales
          vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#FF7400" })
          vim.api.nvim_set_hl(0, "DashboardDesc", { fg = colors.green })
          vim.api.nvim_set_hl(0, "DashboardIcon", { fg = colors.cyan })
          vim.api.nvim_set_hl(0, "DashboardKey", { fg = colors.cyan })
          vim.api.nvim_set_hl(0, "DashboardFooter", { fg = colors.cyan, italic = true })

          -- Fondo transparente
          vim.api.nvim_set_hl(0, "DashboardCenter", { bg = "none" })
          vim.api.nvim_set_hl(0, "DashboardShortcut", { bg = "none" })
          vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        end,
      })

      -- Manejo especial cuando se abre desde Lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
  { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },
}
