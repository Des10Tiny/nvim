-- lua/plugins/telescope.lua

return {
  -- Plugin GitHub repository
  "nvim-telescope/telescope.nvim",
  
  -- Version tag (good practice for stability)
  branch = "0.1.x",
  
  -- Dependencies required by telescope
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  
  -- Configuration function that runs after plugin is loaded
  config = function()
    local telescope = require("telescope")
    
    -- Basic setup (can be expanded later)
    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
      },
    })
    
    -- Setup keymaps for Telescope
    local keymap = vim.keymap -- for conciseness
    
    -- <leader> is usually the spacebar (we'll set this up next!)
    -- Find files by name
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    -- Find text inside files
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    -- Show recently opened files
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
  end,
}
