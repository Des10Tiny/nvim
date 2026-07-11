-- lua/plugins/lualine.lua

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight", -- Use our global theme
        -- Modern rounded separators (NvChad style)
        component_separators = { left = '│', right = '│'},
        section_separators = { left = '', right = ''},
        globalstatus = true, -- One statusline for all splits
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { { 'location', separator = { left = '', right = '' }, left_padding = 2 } },
      },
    })
  end,
}
