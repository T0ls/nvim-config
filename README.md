# <img src="logo.svg" align="bottom" width="40"> Neovim Configuration

This is my custom Neovim configuration, focused on software development with support for various languages.

## Main Features

* **Plugin Manager**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and modern package management.
* **LSP (Language Server Protocol)**: Integrated configuration for Go, HTML, CSS, TypeScript/JavaScript, Python, C/C++, and SQL.
* **Autocompletion**: Intelligent completion with `nvim-cmp` and snippets via `LuaSnip`.
* **UI**:
    * **Gruvbox Material** theme.
    * Custom statusline with `lualine.nvim`.
    * Sidebar file explorer with `nvim-tree`.
* **Highlighting**: Advanced syntax highlighting managed by `nvim-treesitter` with Rainbow Delimiters support.
* **Terminal**: Integrated floating terminal with `toggleterm.nvim`.

## Prerequisites

Make sure you have installed:
* **Neovim** (version >= 0.9.0 recommended)
* **Git**
* **Ripgrep** (required for Telescope searches)
* **Nerd Font** (to display icons correctly)
* **Language Servers**: Ensure servers for your languages are in your PATH (e.g., `gopls`, `clangd`, `pylsp`, `ts_ls`), as this config does not use Mason for automatic installation.

## Installation

1.  Backup your existing configuration.
2.  Clone this repository into your configuration folder:

```bash
git clone <your-repo-url> ~/.config/nvim
