[English](./README.md) | Русский

Молниеносная, современная и модульная сборка Neovim, заточенная под системное программирование (C/C++), Python и общую разработку. Оптимизирована специально под **Neovim 0.12+ (Nightly)**.

## ✨ Фичи

- **Менеджер плагинов:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Тема:** [Tokyonight](https://github.com/folke/tokyonight.nvim) (Стиль Moon, прозрачный фон)
- **LSP и Автодополнение:** Нативная интеграция `vim.lsp.config` через Mason и аккуратный UI в `nvim-cmp`.
- **Подсветка синтаксиса:** `nvim-treesitter` (настроен под новый асинхронный движок Neovim 0.12).
- **UI/UX:** Командная строка в стиле Spotlight (`noice.nvim`), кастомный стартовый экран 10T (`alpha-nvim`) и подсказки клавиш (`which-key.nvim`).
- **Навигация:** `neo-tree` (с отображением скрытых файлов и поддержкой вкладок) и `telescope`.
- **Интеграция с Git:** `gitsigns.nvim`.

## ⚠️ Требования к системе

Перед установкой убедитесь, что в системе установлены следующие зависимости.

1. **Neovim 0.12+ (Nightly):** Конфиг строго завязан на новый API `vim.lsp.config` и переписанный движок Treesitter.
2. **Nerd Font:** Нужен для отображения иконок (например, JetBrains Mono Nerd Font). Настройте ваш терминал на его использование.
3. **Системные зависимости:**
   - Git, Curl, Unzip
   - Компилятор C (`gcc` или `clang`)
   - `tree-sitter-cli` (Критически важен для Neovim 0.12+ при сборке парсеров)

   **macOS:**

   ```bash
   brew install tree-sitter gcc ripgrep fd
   ```

   **Linux (Ubuntu/Debian):**

   ```bash
   sudo apt install tree-sitter-cli gcc ripgrep fd-find
   ```

## 🧹 Подготовка (Полная очистка)

Если вы ранее использовали Neovim на этой машине, вы **обязаны** полностью удалить все кэшированные файлы, состояния и старые плагины. Простого удаления папки `~/.config/nvim` недостаточно.

Выполните эти команды:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## 🚀 Установка

1. Склонируйте репозиторий в папку конфигов Neovim:

```bash
git clone git@github.com:Des10Tiny/nvim.git ~/.config/nvim
```

2. Запустите Neovim:

```bash
nvim
```

3. `lazy.nvim` автоматически установит себя и скачает все плагины.
4. `nvim-treesitter` асинхронно скомпилирует парсеры для C, C++, Python, Lua, Bash и т.д.
5. Подождите, пока Mason установит языковые сервера (`clangd`, `pyright`, `lua_ls`, `bashls`).

## ⌨️ Горячие клавиши

`<leader>` клавиша назначена на `Space` (Пробел). Нажмите `Space` и подождите 300мс — снизу появится меню `which-key` с доступными шорткатами.

| Клавиша             | Описание                                 |
| ------------------- | ---------------------------------------- |
| `<leader>ff`        | Telescope: Поиск файлов                  |
| `<leader>fg`        | Telescope: Поиск текста по проекту       |
| `<leader>e`         | Открыть/закрыть дерево файлов (Neo-tree) |
| `t` (в neo-tree)    | Открыть выбранный файл в новой вкладке   |
| `<leader>tn` / `tp` | Следующая / Предыдущая вкладка           |
| `gd`                | LSP: Перейти к определению               |
| `K`                 | LSP: Показать документацию               |
| `<leader>rn`        | LSP: Переименовать переменную            |

## 🛠 Решение проблем

- **Ошибка:** `ENOENT: no such file or directory (cmd): 'tree-sitter'`
- **Причина:** Новому `nvim-treesitter` для NVIM 0.12+ нужна системная утилита `tree-sitter` для компиляции парсеров.
- **Решение:** Установите её через пакетный менеджер (`brew install tree-sitter` или `apt install tree-sitter-cli`).

- **Предупреждение:** `require('lspconfig') is deprecated`
- **Причина:** В Neovim 0.11+ добавили нативный API `vim.lsp.config`.
- **Решение:** Этот конфиг уже использует новый API! Мы обошли старый хендлер `mason-lspconfig` и используем `vim.lsp.config(server, {...})` напрямую.

- **Меню автодополнения перекрывает весь экран**
- **Решение:** В файле `lua/plugins/cmp.lua` мы жестко ограничили размеры окна `nvim-cmp` (`max_height = 10` и `max_width = 50`). Окно документации показывается только при ручном нажатии `<C-d>`.
