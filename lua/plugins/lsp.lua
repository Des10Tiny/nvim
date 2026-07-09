-- lua/plugins/lsp.lua

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    -- Bring back mason-lspconfig strictly for package management, NOT for setup
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- 1. Initialize Mason
    require("mason").setup({
      ui = {
        icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" }
      }
    })

    -- 2. Let mason-lspconfig handle the automatic installation mapping safely
    local servers = {
      "clangd",
      "pyright",
      "lua_ls",
      "bashls",
    }
    
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    -- 3. Set up capabilities for autocompletion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = cmp_nvim_lsp.default_capabilities()
    end

    -- 4. Use the NEW Neovim 0.12+ API to configure and enable servers
    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
    end

    -- 5. Setup keymaps when LSP attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })
  end,
}
