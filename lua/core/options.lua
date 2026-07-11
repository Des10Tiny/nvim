-- Sync Neovim clipboard with the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Force OSC 52 clipboard if running over SSH
if vim.env.SSH_TTY then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end

-- Base quality-of-life settings
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers (useful for jumping)
vim.opt.mouse = "a"           -- Enable mouse support
vim.opt.ignorecase = true     -- Case-insensitive searching...
vim.opt.smartcase = true      -- ...unless the query contains a capital letter
vim.opt.termguicolors = true  -- Enable 24-bit RGB color support

-- Disable automatic code folding when opening a file
vim.opt.foldenable = false

-- Tab navigation
local keymap = vim.keymap
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
