-- init.lua

-- Назначаем Space как leader-клавишу (обязательно ДО загрузки lazy!)
vim.g.mapleader = " "

-- Load base options
require("core.options")

-- ==============================================================================
-- 1. Bootstrapping lazy.nvim
-- This code automatically downloads the plugin manager if it's missing.
-- ==============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ==============================================================================
-- 2. Setup lazy.nvim
-- We tell lazy to load all plugin specs from the "lua/plugins" directory.
-- ==============================================================================
require("lazy").setup({
  spec = {
    -- Import all plugin configurations from the "lua/plugins" directory
    { import = "plugins" },
  },
  -- Optional: Configure lazy UI (the window that opens when you run :Lazy)
  ui = {
    border = "rounded", -- Make the popup window look nicer
  },
})
