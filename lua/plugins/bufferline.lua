-- lua/plugins/bufferline.lua

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- "tabs" or "buffers"
        diagnostics = "nvim_lsp", -- Show LSP errors in tabs
        separator_style = "slant", -- NvChad-like angled separators
        always_show_bufferline = true,
        -- This makes sure the top bar doesn't overlap with Neo-tree on the left
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true
          }
        },
      }
    })
    
    -- Quick shortcuts to switch buffers (tabs)
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
  end,
}
