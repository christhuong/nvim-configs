# 🚀 Key Mappings Cheatsheet

---

## 🔧 Basic Configuration

| Setting        | Value     |
| -------------- | --------- |
| **Leader Key** | `<Space>` |

---

## 🏃 Quick Actions

### Mode Switching

| Key  | Mode              | Action                | Description                   |
| ---- | ----------------- | --------------------- | ----------------------------- |
| `jj` | Insert → Normal   | Escape to normal mode | Quick escape                  |
| `jk` | Insert → Normal   | Escape to normal mode | Alternative quick escape      |
| `jj` | Terminal → Normal | Escape terminal mode  | Exit terminal insert mode     |
| `jk` | Terminal → Normal | Escape terminal mode  | Alt exit terminal insert mode |

### Search & Highlighting

| Key     | Mode   | Action     | Description               |
| ------- | ------ | ---------- | ------------------------- |
| `<Esc>` | Normal | `:noh<CR>` | Clear search highlighting |

---

## 💾 File Operations

### Save & Quit

| Key          | Mode   | Action    | Description               |
| ------------ | ------ | --------- | ------------------------- |
| `<leader>ww` | Normal | `:w<CR>`  | Save current file         |
| `<leader>wq` | Normal | `:wq<CR>` | Save and quit             |
| `<leader>qq` | Normal | `:q!<CR>` | Force quit without saving |

### File Path Copying

| Key  | Mode   | Action             | Description                                  |
| ---- | ------ | ------------------ | -------------------------------------------- |
| `cp` | Normal | Copy relative path | Copy current file relative path to clipboard |
| `cP` | Normal | Copy absolute path | Copy current file absolute path to clipboard |

---

## 📁 File Management & Search

### NvimTree (Floating File Explorer)

| Key         | Mode   | Action               | Description                             |
| ----------- | ------ | -------------------- | --------------------------------------- |
| `<C-n>`     | Normal | Toggle floating tree | Show/hide floating file tree            |
| `<leader>e` | Normal | Find file in tree    | Find and highlight current file in tree |
| `<leader>m` | Normal | Toggle tree          | Alternative tree toggle                 |
| `<leader>r` | Normal | Find file            | Find current file in tree               |

### FZF Fuzzy Finding

| Key          | Mode   | Action           | Description                  |
| ------------ | ------ | ---------------- | ---------------------------- |
| `<leader>ff` | Normal | `:GFiles<CR>`    | Find Git-tracked files       |
| `<leader>fa` | Normal | `:Files<CR>`     | Find all files               |
| `<leader>fs` | Normal | `:GFiles?<CR>`   | Find Git changed files       |
| `<leader>fw` | Normal | `:Rg<CR>`        | Find text in files (ripgrep) |
| `<leader>fc` | Normal | `:Rg <word><CR>` | Find word under cursor       |
| `<leader>fl` | Normal | `:Lines<CR>`     | Find lines in all buffers    |
| `<leader>fh` | Normal | `:History<CR>`   | Find recent files            |
| `<leader>o`  | Normal | `:Buffers<CR>`   | Switch between open buffers  |

### FZF Actions (Within FZF Window)

| Key      | Action           | Description                            |
| -------- | ---------------- | -------------------------------------- |
| `Ctrl-t` | Open in new tab  | Open selected file in new tab          |
| `Ctrl-v` | Vertical split   | Open selected file in vertical split   |
| `Ctrl-s` | Horizontal split | Open selected file in horizontal split |
| `Ctrl-/` | Toggle preview   | Show/hide file preview                 |

---

## ✂️ Text Editing & Movement

### Line Movement

| Key     | Mode   | Action              | Description                          |
| ------- | ------ | ------------------- | ------------------------------------ |
| `<C-j>` | Normal | Move line down      | Move current line down               |
| `<C-k>` | Normal | Move line up        | Move current line up                 |
| `<C-j>` | Insert | Move line down      | Move current line down (from insert) |
| `<C-k>` | Insert | Move line up        | Move current line up (from insert)   |
| `<C-j>` | Visual | Move selection down | Move selected lines down             |
| `<C-k>` | Visual | Move selection up   | Move selected lines up               |

### Quick Navigation

| Key         | Mode                   | Action            | Description                  |
| ----------- | ---------------------- | ----------------- | ---------------------------- |
| `<leader>j` | Normal                 | `:HopWordMW<CR>`  | Jump to any word on screen   |
| `f`         | Normal/Visual/Operator | Hop forward       | Quick jump forward           |
| `F`         | Normal/Visual/Operator | Hop backward      | Quick jump backward          |
| `t`         | Normal/Visual/Operator | Hop till          | Jump till character          |
| `T`         | Normal/Visual/Operator | Hop till backward | Jump till character backward |

### Commenting

| Key     | Mode          | Action              | Description                        |
| ------- | ------------- | ------------------- | ---------------------------------- |
| `gcc`   | Normal        | Toggle line comment | Comment/uncomment current line     |
| `gc`    | Normal/Visual | Toggle comment      | Comment/uncomment motion/selection |
| `<C-_>` | Normal/Visual | Toggle comment      | Alternative comment toggle         |

### Text Objects (vim-surround)

| Key           | Mode   | Action          | Description                 |
| ------------- | ------ | --------------- | --------------------------- |
| `cs'"`        | Normal | Change surround | Change surrounding ' to "   |
| `cs"'`        | Normal | Change surround | Change surrounding " to '   |
| `cs({`        | Normal | Change surround | Change ( to { with spaces   |
| `ds"`         | Normal | Delete surround | Remove surrounding "        |
| `ys<motion>"` | Normal | Add surround    | Surround motion with "      |
| `yss"`        | Normal | Surround line   | Surround entire line with " |

---

## 🪟 Window & Split Management

### Creating Splits

| Key         | Mode   | Action        | Description             |
| ----------- | ------ | ------------- | ----------------------- |
| `<leader>v` | Normal | `:vsplit<CR>` | Create vertical split   |
| `<leader>s` | Normal | `:split<CR>`  | Create horizontal split |

### Resizing Splits

| Key | Mode   | Action         | Description                         |
| --- | ------ | -------------- | ----------------------------------- |
| `=` | Normal | Increase width | Increase vertical split width by 10 |
| `-` | Normal | Decrease width | Decrease vertical split width by 10 |

### Tab Management

| Key         | Mode   | Action          | Description                   |
| ----------- | ------ | --------------- | ----------------------------- |
| `<leader>t` | Normal | `:tabnew<CR>`   | Create new tab                |
| `<C-t>`     | Normal | Move to new tab | Move current split to new tab |
| `J`         | Normal | Previous tab    | Go to previous tab            |
| `K`         | Normal | Next tab        | Go to next tab                |
| `<leader>1` | Normal | Go to tab 1     | Switch to tab 1               |
| `<leader>2` | Normal | Go to tab 2     | Switch to tab 2               |
| `<leader>3` | Normal | Go to tab 3     | Switch to tab 3               |
| `<leader>4` | Normal | Go to tab 4     | Switch to tab 4               |
| `<leader>5` | Normal | Go to tab 5     | Switch to tab 5               |
| `<leader>6` | Normal | Go to tab 6     | Switch to tab 6               |
| `<leader>7` | Normal | Go to tab 7     | Switch to tab 7               |
| `<leader>8` | Normal | Go to tab 8     | Switch to tab 8               |
| `<leader>9` | Normal | Go to tab 9     | Switch to tab 9               |

---

## 🧠 LSP (Language Server Protocol)

### Navigation

| Key         | Mode   | Action               | Description                |
| ----------- | ------ | -------------------- | -------------------------- |
| `gd`        | Normal | Go to definition     | Jump to symbol definition  |
| `gD`        | Normal | Go to declaration    | Jump to symbol declaration |
| `gi`        | Normal | Go to implementation | Jump to implementation     |
| `gr`        | Normal | Show references      | List all references        |
| `<space>D`  | Normal | Type definition      | Go to type definition      |
| `<leader>k` | Normal | Hover documentation  | Show documentation popup   |

### Diagnostics

| Key        | Mode   | Action              | Description                  |
| ---------- | ------ | ------------------- | ---------------------------- |
| `<space>e` | Normal | Next diagnostic     | Go to next error/warning     |
| `<space>d` | Normal | Previous diagnostic | Go to previous error/warning |

### Code Actions

| Key        | Mode   | Action        | Description                 |
| ---------- | ------ | ------------- | --------------------------- |
| `<space>i` | Normal | Code actions  | Show available code actions |
| `<space>R` | Normal | Rename symbol | Rename symbol under cursor  |

---

## 🎯 Auto-Completion

### nvim-cmp Navigation

| Key         | Mode   | Action             | Description                           |
| ----------- | ------ | ------------------ | ------------------------------------- |
| `<C-j>`     | Insert | Next item          | Select next completion item           |
| `<C-k>`     | Insert | Previous item      | Select previous completion item       |
| `<C-n>`     | Insert | Next item          | Select next completion item (alt)     |
| `<C-p>`     | Insert | Previous item      | Select previous completion item (alt) |
| `<C-Space>` | Insert | Trigger completion | Manually trigger completion           |
| `<CR>`      | Insert | Accept             | Accept selected completion            |
| `<S-Tab>`   | Insert | Smart tab          | Tab with snippet/completion logic     |

### GitHub Copilot

| Key          | Mode   | Action              | Description                 |
| ------------ | ------ | ------------------- | --------------------------- |
| `<C-Y>`      | Insert | Accept suggestion   | Accept Copilot suggestion   |
| `<C-H>`      | Insert | Previous suggestion | Previous Copilot suggestion |
| `<C-L>`      | Insert | Next suggestion     | Next Copilot suggestion     |
| `<leader>cs` | Normal | Copilot status      | Check Copilot status        |
| `<leader>ce` | Normal | Enable Copilot      | Enable Copilot              |
| `<leader>cd` | Normal | Disable Copilot     | Disable Copilot             |
| `<leader>cp` | Normal | Copilot panel       | Open Copilot panel          |

---

## 📚 Git Integration

### Git Commands

| Key           | Mode   | Action            | Description                    |
| ------------- | ------ | ----------------- | ------------------------------ |
| `<leader>gs`  | Normal | `:Git<CR>`        | Open Git status (fugitive)     |
| `<leader>gd`  | Normal | Git diff          | Show Git diff for current file |
| `<leader>glb` | Normal | Toggle line blame | Toggle Git blame for lines     |

### Git Hunks Navigation

| Key  | Mode   | Action        | Description                    |
| ---- | ------ | ------------- | ------------------------------ |
| `gj` | Normal | Next hunk     | Go to next Git change hunk     |
| `gk` | Normal | Previous hunk | Go to previous Git change hunk |

### GitHub Integration

| Key          | Mode          | Action               | Description                           |
| ------------ | ------------- | -------------------- | ------------------------------------- |
| `<leader>gh` | Normal/Visual | Open on GitHub       | Open current line/selection on GitHub |
| `<leader>gb` | Normal/Visual | Open blame on GitHub | Open Git blame on GitHub              |

---

## 🛠️ Formatting & Development

### Code Formatting

| Key         | Mode   | Action             | Description                  |
| ----------- | ------ | ------------------ | ---------------------------- |
| `<leader>p` | Normal | `:FormatWrite<CR>` | Format current file and save |

---

## 🖥️ Terminal

### Terminal Management

| Key         | Mode   | Action           | Description                     |
| ----------- | ------ | ---------------- | ------------------------------- |
| `<leader>.` | Normal | `:vs +term<CR>i` | Open terminal in vertical split |
|             | Normal | `:term`          | Open a terminal                 |

---

## 🔧 Custom Commands

### User Commands

| Command                            | Description                         |
| ---------------------------------- | ----------------------------------- |
| `:Cdnvim`                          | Change to Neovim config directory   |
| `:Cdzshrc`                         | Open .zshrc file                    |
| `:CommitAndPushAllFiles [message]` | Git add, commit, and push all files |

---

## 📝 Notes System

### vim-notes Commands

| Command                 | Description                |
| ----------------------- | -------------------------- |
| `:Note`                 | Create/open notes          |
| `:NoteFromSelectedText` | Create note from selection |
| `:DeleteNote`           | Delete notes               |
| `:SearchNotes`          | Search through notes       |

---

## 🎨 Language-Specific Features

### Supported Languages

- **TypeScript/JavaScript**: `ts_ls` + `eslint` + `prettier`
- **Python**: `pyright` + `ruff` + `black`
- **Ruby**: `ruby-lsp` + `rubocop`
- **Lua**: Built-in LSP + `stylua`

### Auto-formatting on Save

Files automatically formatted on save:

- `*.js`, `*.jsx`, `*.ts`, `*.tsx` (Prettier)
- `*.json` (Prettier)
- `*.py` (Black)
- `*.rb` (RuboCop)

---

## 💡 Pro Tips

1. **FZF is your friend**: Use `<leader>ff` for files, `<leader>fs` for recently modified files, `<leader>fw` for text search
2. **Quick escape**: `jj` or `jk` from insert mode is faster than reaching for Escape
3. **Line movement**: `<C-j>` and `<C-k>` work in all modes for moving lines
4. **Git workflow**: `<leader>gs` → `:Gdiff <branch>` to compare changes → `gj`/`gk` to navigate changes → `<leader>gh` to open on GitHub
5. **LSP features**: `gd` for definition, `<leader>k` for docs, `<space>i` for actions
6. **Completion**: Let `<C-j>`/`<C-k>` navigate, `<CR>` to accept
7. **Terminal**: Use `:file <name>` to rename the terminal buffer
