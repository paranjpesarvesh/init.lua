# 📝 Neovim Cheatsheet

## Table of Contents

1. [General Vim/Neovim](#general-vimneovim)
2. [Normal Mode Keymaps](#normal-mode-keymaps)
3. [Visual/Select Mode Keymaps](#visualselect-mode-keymaps)
4. [Plugins & Custom Mappings](#plugins--custom-mappings)

   * [Harpoon](#harpoon)
   * [Telescope](#telescope)
   * [Neotest & DAP](#neotest--dap)
   * [LuaSnip](#luasnip)
   * [NvimTree](#nvimtree)
   * [Vimtex](#vimtex)
   * [Trouble](#trouble)
   * [Fugitive & Git](#fugitive--git)
   * [LazyGit](#lazygit)
5. [Terminal & System Commands](#terminal--system-commands)

---

## General Vim/Neovim

| Action                  | Keymap            |
| ----------------------- | ----------------- |
| Move to next match      | `n`               |
| Move to previous match  | `N`               |
| Join lines              | `J`               |
| Yank line               | `Y`               |
| Delete without yanking  | `"_d`             |
| Paste                   | `p`               |
| Replace                 | `r`               |
| Undo                    | `u`               |
| Redo                    | `<C-r>`           |
| Search                  | `/`               |
| Search backward         | `?`               |
| Repeat last command     | `.`               |
| Go to beginning of line | `0`               |
| Go to end of line       | `$`               |
| Scroll half page        | `<C-d>` / `<C-u>` |
| Center after movement   | `zzzv`            |

---

## Normal Mode Keymaps

| Key                 | Action                               | Notes                          |
| ------------------- | ------------------------------------ | ------------------------------ |
| `<Space>tt`         | Open Trouble                         | Custom Lua                     |
| `<Space>lt`         | Vimtex Table of Contents             | `:VimtexTocOpen`               |
| `<Space>lv`         | Vimtex View PDF                      | `:VimtexView`                  |
| `<Space>lc`         | Compile LaTeX                        | `:VimtexCompile`               |
| `<Space>u`          | Custom Lua command                   | `vim/_editor.lua`              |
| `<Space>nt`         | Toggle NvimTree focus                | `nvim-tree.lua`                |
| `<Space>nq`         | Close NvimTree                       | `nvim-tree.lua`                |
| `<Space>nf`         | Focus NvimTree                       | `nvim-tree.lua`                |
| `<Space>zZ`         | ZenMode toggle                       | `zenmode.lua`                  |
| `<Space>zz`         | ZenMode toggle                       | `zenmode.lua`                  |
| `<Space>vh`         | Telescope help                       | `telescope.builtin`            |
| `<Space>ps`         | Telescope search                     | `telescope.lua`                |
| `<Space>pWs`        | Telescope search                     | `telescope.lua`                |
| `<Space>pf`         | Telescope find files in NvimTree dir | `nvim-tree.lua`                |
| `<Space>ta`         | Debug: Open test output              | `neotest.lua`                  |
| `<Space>to`         | Debug: Open test output              | `neotest.lua`                  |
| `<Space>td`         | Debug: Debug nearest test            | `neotest.lua`                  |
| `<Space>ts`         | Debug: Run test suite                | `neotest.lua`                  |
| `<Space>tv`         | Debug: Summary toggle                | `neotest.lua`                  |
| `<Space>tr`         | Debug: Run nearest test              | `neotest.lua`                  |
| `<Space>dc`         | Debug: toggle console UI             | `dap.lua`                      |
| `<Space>dS`         | Debug: toggle scopes UI              | `dap.lua`                      |
| `<Space>db`         | Debug: toggle breakpoints UI         | `dap.lua`                      |
| `<Space>dw`         | Debug: toggle watches UI             | `dap.lua`                      |
| `<Space>ds`         | Debug: toggle stacks UI              | `dap.lua`                      |
| `<Space>dr`         | Debug: toggle REPL UI                | `dap.lua`                      |
| `<Space>B`          | Conditional breakpoint               | `dap.lua`                      |
| `<Space>b`          | Toggle breakpoint                    | `dap.lua`                      |
| `<Space>pdf`        | Open PDF                             | Evince                         |
| `<Space>t`          | Run custom terminal command          | Lua                            |
| `<Space>lg`         | Open LazyGit                         | `:LazyGit`                     |
| `<Space><Space>1-4` | Harpoon replace files                | `remap.lua`                    |
| `<Space>1-4`        | Harpoon select files                 | `remap.lua`                    |
| `<Space>A`          | Prepend file to Harpoon              | `remap.lua`                    |
| `<Space>a`          | Add file to Harpoon                  | `remap.lua`                    |
| `<Space>wv`         | Split window vertically              | `:vsplit`                      |
| `<Space>ws`         | Split window horizontally            | `:split`                       |
| `<Space>gol`        | Go: run last command                 | Lua                            |
| `<Space>mir`        | Custom Lua                           | Lua                            |
| `<Space>el`         | Error logging snippet                | Lua                            |
| `<Space>ef`         | Error logging snippet                | Lua                            |
| `<Space>ee`         | Error logging snippet                | Lua                            |
| `<Space>x`          | Make file executable                 | `:!chmod +x %`                 |
| `<Space>s`          | Search & replace word under cursor   | `:%s/<C-R><C-W>/<C-R><C-W>/gI` |
| `<Space>j`          | Jump to previous location            | `:lprev`                       |
| `<Space>k`          | Jump to next location                | `:lnext`                       |
| `<Space>f`          | Custom Lua                           | `nvim-tree.lua`                |
| `<Space>d`          | Delete without yanking               | `"_d`                          |
| `<Space>y`          | Yank to system clipboard             | `"+y`                          |
| `<Space>Y`          | Yank line to system clipboard        | `"+Y`                          |
| `<Space>gs`         | Custom Lua                           | `vim/_editor.lua`              |
| `<Space>gb`         | Telescope git branches               | Lua                            |
| `<Space>gc`         | Telescope git commits                | Lua                            |
| `<Space>gf`         | Telescope git files                  | Lua                            |
| `<Space>svwm`       | Custom Lua                           | Lua                            |
| `<Space>vwm`        | Custom Lua                           | Lua                            |
| `<Space>zig`        | Restart LSP                          | `:LspRestart`                  |
| `<Space>tf`         | Plenary test file                    | Lua                            |
| `<Space>pv`         | Toggle NvimTree                      | Lua                            |

---

## Visual/Select Mode Keymaps

| Key                            | Action                             | Notes   |
| ------------------------------ | ---------------------------------- | ------- |
| `<Space>d`                     | Delete without yanking             | Visual  |
| `<Space>y`                     | Yank to system clipboard           | Visual  |
| `<Space>p`                     | Paste without overwriting register | Visual  |
| `J/K`                          | Move selected lines                | Visual  |
| `<Plug>luasnip-jump-prev/next` | Snippet navigation                 | LuaSnip |
| `gc`                           | Toggle comment                     | Visual  |

---

## Plugins & Custom Mappings

### Harpoon

* `<Space><Space>1-4`: Replace files
* `<Space>1-4`: Select files
* `<Space>a`: Add file
* `<Space>A`: Prepend file

### Telescope

* `<Space>vh`: Help
* `<Space>ps`: Search
* `<Space>pWs/pws`: Search in workspace
* `<Space>pf`: Find files in NvimTree

### Neotest & DAP

* `<Space>ta/to/td/tr/ts/tv`: Test & debug suite
* `<Space>dc/dS/db/dw/ds/dr`: Toggle debug UI panels
* `<Space>B/b`: Breakpoints

### LuaSnip

* Expand snippet: `<Plug>luasnip-expand-snippet`
* Jump next: `<Plug>luasnip-jump-next`
* Jump previous: `<Plug>luasnip-jump-prev`
* Choice change: `<Plug>luasnip-next-choice/prev-choice`

### NvimTree

* `<Space>nt/pf/nq/nf/pv`: Tree navigation and toggle

### Vimtex

* `<Space>lt/lv/lc`: LaTeX commands

### Trouble

* `<Space>tt/[t/ ]t`: Toggle diagnostics and jump

### Fugitive & Git

* `<Space>y<C-G>`: Copy Git object
* `<Space>gb/gc/gf`: Telescope git commands

### LazyGit

* `<Space>lg`: Open LazyGit

---

## Terminal & System Commands

| Key          | Action                                  |
| ------------ | --------------------------------------- |
| `<Space>t`   | Run custom terminal commands            |
| `<C-F>`      | Open tmux-sessionizer                   |
| `<C-Bslash>` | Toggle between terminal and file buffer |
| `<Space>pdf` | Open PDF in Evince                      |
| `<Space>x`   | Make file executable                    |

---
