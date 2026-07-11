-- lua/plugins/gitsigns.lua

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      
      -- Options for how the signs look and behave
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      
      -- Setup keymaps for Git actions
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation between hunks (changes)
        map("n", "]h", gs.next_hunk, { desc = "Next Git hunk" })
        map("n", "[h", gs.prev_hunk, { desc = "Previous Git hunk" })

        -- Actions
        map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
        map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
        map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
      end,
    })

    -- Add the Git group to Which-Key
    local has_wk, wk = pcall(require, "which-key")
    if has_wk then
      wk.add({
        { "<leader>g", group = "Git Actions", icon = "🐙" },
      })
    end
  end,
}
