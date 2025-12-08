#  Neovim Configuration

Questa è la mia configurazione personalizzata per Neovim, scritta interamente in Lua. È progettata per essere veloce, estensibile e focalizzata sullo sviluppo software con supporto per diversi linguaggi.

## Caratteristiche Principali

* **Gestore dei Plugin**: Utilizza [lazy.nvim](https://github.com/folke/lazy.nvim) per una gestione dei pacchetti rapida e moderna.
* **LSP (Language Server Protocol)**: Configurazione integrata per Go, HTML, CSS, TypeScript/JavaScript, Python, C/C++ e SQL.
* **Autocompletamento**: Completamento intelligente con `nvim-cmp` e snippet tramite `LuaSnip`.
* **Interfaccia**:
    * Tema **Gruvbox Material**.
    * Statusline personalizzata con `lualine.nvim`.
    * File explorer laterale con `nvim-tree`.
* **Highlighting**: Sintassi avanzata gestita da `nvim-treesitter` con supporto Rainbow Delimiters.
* **Terminale**: Terminale fluttuante integrato con `toggleterm.nvim`.

## Prerequisiti

Assicurati di avere installato:
* **Neovim** (versione >= 0.9.0 raccomandata)
* **Git**
* **Ripgrep** (richiesto per le ricerche con Telescope)
* **Nerd Font** (per visualizzare correttamente le icone)
* **Language Servers**: Assicurati che i server per i tuoi linguaggi siano nel PATH (es. `gopls`, `clangd`, `pylsp`, `ts_ls`), poiché questa config non usa Mason per l'installazione automatica.

## Installazione

1.  Fai il backup della tua configurazione esistente.
2.  Clona questa repository nella tua cartella di configurazione:

```bash
git clone <url-tua-repo> ~/.config/nvim
