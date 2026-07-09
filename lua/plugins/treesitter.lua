-- lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- The new rewrite does not support lazy-loading
  build = ":TSUpdate",
  
  config = function()
    -- 1. Setup default directories
    require("nvim-treesitter").setup {}

    -- 2. Install parsers asynchronously
    require("nvim-treesitter").install({
      "c", "cpp", "python", "lua", "vim", "vimdoc", "query",
      "bash", "json", "yaml", "markdown", "markdown_inline", "dockerfile"
    })

    -- 3. Enable highlighting, indentation, and folding for all filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        local buf = args.buf
        -- Try to start treesitter gracefully
        local ok = pcall(vim.treesitter.start, buf)
        
        -- If treesitter started successfully (parser exists), enable features
        if ok then
          -- Enable treesitter-based indentation
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          
          -- Enable treesitter-based folding
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldmethod = "expr"
        end
      end,
    })
  end,
}
