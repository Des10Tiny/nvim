-- lua/plugins/theme.lua

return {
  "folke/tokyonight.nvim",
  lazy = false,    -- Make sure we load this during startup
  priority = 1000, -- Load this before all the other start plugins
  config = function()
    -- Set the background style: "storm" (dark gray), "moon" (darker), "night" (deep black), or "day"
    require("tokyonight").setup({
      style = "moon", 
      transparent = true, -- Set to true if you want your terminal background to show through
      styles = {
        -- Style to be applied to different syntax groups
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
    })

    -- Apply the theme
    vim.cmd[[colorscheme tokyonight]]
  end,
}
