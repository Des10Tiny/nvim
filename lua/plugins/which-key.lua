-- lua/plugins/which-key.lua

return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Load after startup to not slow down boot time
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300 -- Wait 300ms after pressing a key to show the popup
  end,
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      preset = "modern", -- Clean UI design
    })

    -- Here we register the group names for the menu
    -- We already set up some keymaps in telescope and lsp, let's label their groups
    wk.add({
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>c", group = "Code (LSP)" },
      { "<leader>r", group = "Rename", icon = "✏️" },
    })
  end,
}
