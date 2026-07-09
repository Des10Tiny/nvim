-- lua/plugins/alpha.lua

return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons" -- This provides icons for the menu (needs a Nerd Font)
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- You can set a custom ASCII art header here
    dashboard.section.header.val = {
      "                                 ",
      "    ██╗ ██████╗ ████████╗        ",
      "  ████║██╔═══██╗╚══██╔══╝        ",
      "  ╚═██║██║   ██║   ██║           ",
      "    ██║██║   ██║   ██║           ",
      "    ██║╚██████╔╝   ██║           ",
      "    ╚═╝ ╚═════╝    ╚═╝           ",
      "                                 ",
    }

    -- Set up the buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
      dashboard.button("l", "  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    -- Configure layout
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)
  end,
}
