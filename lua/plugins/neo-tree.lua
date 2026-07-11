-- lua/plugins/neo-tree.lua

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      
      -- NEW: Filesystem settings to handle hidden files
      filesystem = {
        filtered_items = {
          visible = true, -- Always show hidden files (like .gitignore)
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      
      default_component_configs = {
        indent = {
          with_expanders = true,
        },
      },
      
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = { "toggle_node", nowait = false },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          -- NEW: Open file in a new tab instead of the current window
          ["t"] = "open_tabnew", 
          ["P"] = { "toggle_preview", config = { use_float = true } },
        }
      }
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
    
    local has_wk, wk = pcall(require, "which-key")
    if has_wk then
      wk.add({
        { "<leader>e", desc = "Toggle Explorer (Neo-tree)", icon = "🌲" },
      })
    end
  end,
}
