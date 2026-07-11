English | [Русский](./README_ru.md)

A blazingly fast, modern, and modular Neovim configuration built for systems programming (C/C++), Python, and general development. Optimized specifically for **Neovim 0.12+ (Nightly)**.

## ✨ Features

- **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Theme:** [Tokyonight](https://github.com/folke/tokyonight.nvim) (Moon style, transparent background)
- **LSP & Autocompletion:** Native `vim.lsp.config` integration via Mason, with a clean `nvim-cmp` UI.
- **Syntax Highlighting:** `nvim-treesitter` (configured for the new asynchronous Neovim 0.12 engine).
- **UI/UX:** Spotlight-like command line with `noice.nvim`, custom 10T dashboard (`alpha-nvim`), and `which-key.nvim` for discovering shortcuts.
- **Navigation:** `neo-tree` (with hidden files visible and tab support) and `telescope`.
- **Git Integration:** `gitsigns.nvim`.

## ⚠️ Prerequisites

Before installing, ensure your system has the required dependencies.

1. **Neovim 0.12+ (Nightly):** This config strictly relies on the new `vim.lsp.config` API and the rewritten Treesitter engine.
2. **Nerd Font:** Required for icons (e.g., JetBrains Mono Nerd Font). Configure your terminal (Kitty/macOS or Linux) to use it.
3. **System Dependencies:**
   - Git, Curl, Unzip
   - C Compiler (`gcc` or `clang`)
   - `tree-sitter-cli` (Crucial for Neovim 0.12+ to build parsers)

   **macOS:**

   ```bash
   brew install tree-sitter gcc ripgrep fd
   ```

   **Linux (Ubuntu/Debian):**

   ```bash
   sudo apt install tree-sitter-cli gcc ripgrep fd-find
   ```

## 🧹 Pre-installation (The Purge)

If you have used Neovim on this machine before, you **must** completely wipe all cached files, state, and old plugins. Removing just the config folder is not enough.

Run the following commands:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## 🚀 Installation

1. Clone this repository into your Neovim config directory:

```bash
git clone git@github.com:Des10Tiny/nvim.git ~/.config/nvim
```

2. Start Neovim:

```bash
nvim
```

3. `lazy.nvim` will automatically bootstrap itself and install all plugins.
4. `nvim-treesitter` will asynchronously compile parsers for C, C++, Python, Lua, Bash, etc.
5. Wait for Mason to install language servers (`clangd`, `pyright`, `lua_ls`, `bashls`).

## ⌨️ Keybindings

`<leader>` is mapped to `Space`. Press `Space` and wait 300ms to see the `which-key` menu with available shortcuts.

| Key                 | Description                        |
| ------------------- | ---------------------------------- |
| `<leader>ff`        | Telescope: Find files              |
| `<leader>fg`        | Telescope: Live grep (search text) |
| `<leader>e`         | Toggle Neo-tree explorer           |
| `t` (in neo-tree)   | Open selected file in a new tab    |
| `<leader>tn` / `tp` | Go to Next / Previous tab          |
| `gd`                | LSP: Go to definition              |
| `K`                 | LSP: Show hover documentation      |
| `<leader>rn`        | LSP: Rename symbol                 |

## 🛠 Troubleshooting & Known Solutions

- **Error:** `ENOENT: no such file or directory (cmd): 'tree-sitter'`
- **Cause:** The new `nvim-treesitter` for NVIM 0.12+ requires the system `tree-sitter` CLI to compile parsers.
- **Fix:** Install it via your package manager (`brew install tree-sitter` or `apt install tree-sitter-cli`).
- **Warning:** `require('lspconfig') is deprecated`
- **Cause:** Neovim 0.11+ introduced native `vim.lsp.config`.
- **Fix:** This config already uses the new API! We bypass the legacy `mason-lspconfig` handler and use `vim.lsp.config(server, {...})` and `vim.lsp.enable(server)`.
- **Completion menu covers the whole screen**
- **Fix:** The `nvim-cmp` window is explicitly limited to `max_height = 10` and `max_width = 50` in `lua/plugins/cmp.lua`. Documentation only shows when pressing `<C-d>`.
