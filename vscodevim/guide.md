# 🚀 VSCode/Cursor Neovim Keybinding Setup

## ⚠️ **BACKUP FIRST!**

```bash
# Backup your current settings
cp '~/Library/Application Support/Cursor/User/settings.json' '~/Library/Application Support/Cursor/User/settings_backup.json'

# Apply the new settings
cp ~/.config/nvim/vscodevim/settings.json '~/Library/Application Support/Cursor/User/settings.json'
```

## **Keybindings**

### **🔍 File Navigation (FZF-style)**

| Keybinding   | Action               | Neovim Equivalent |
| ------------ | -------------------- | ----------------- |
| `<leader>fa` | All symbols search   | `:Files`          |
| `<leader>fc` | Find in files        | `:Rg <C-R><C-W>`  |
| `<leader>fl` | Go to line           | `:Lines`          |
| `<leader>fh` | Recent files         | `:History`        |
| `<leader>fs` | Git changes          | `:GFiles?`        |
| `<leader>o`  | Switch window/buffer | `:Buffers`        |

### **📝 Text Manipulation**

| Keybinding | Action                   | Notes                           |
| ---------- | ------------------------ | ------------------------------- |
| `<C-j>`    | Move line/selection down | Works in normal, insert, visual |
| `<C-k>`    | Move line/selection up   | Works in normal, insert, visual |
| `<Esc>`    | Clear search highlight   | Just like `:nohl` in Neovim     |

### **🪟 Window & Split Management**

| Keybinding  | Action           | Neovim Equivalent     |
| ----------- | ---------------- | --------------------- |
| `<leader>s` | Horizontal split | `:split`              |
| `<leader>v` | Vertical split   | `:vsplit`             |
| `=`         | Increase width   | `vertical resize +10` |
| `-`         | Decrease width   | `vertical resize -10` |

### **📑 Tab Navigation**

| Keybinding    | Action             | Neovim Equivalent  |
| ------------- | ------------------ | ------------------ |
| `<leader>1-9` | Go to tab 1-9      | `1gt`, `2gt`, etc. |
| `<leader>t`   | New file           | `:tabnew`          |
| `<C-t>`       | Move to new window | `<C-w>T`           |
| `J`           | Previous editor    | `gT`               |
| `K`           | Next editor        | `gt`               |

### **🔧 File Operations**

| Keybinding   | Action             | Neovim Equivalent         |
| ------------ | ------------------ | ------------------------- |
| `cp`         | Copy relative path | `:let @* = expand("%")`   |
| `cP`         | Copy full path     | `:let @* = expand("%:p")` |
| `<leader>qq` | Force close editor | `:q!`                     |
| `<leader>wq` | Save and close     | `:wq`                     |

### **📚 Git Integration**

| Keybinding    | Action            | Neovim Equivalent                     |
| ------------- | ----------------- | ------------------------------------- |
| `<leader>gs`  | Git/SCM view      | `:Git`                                |
| `<leader>glb` | Toggle line blame | `:Gitsigns toggle_current_line_blame` |
| `<leader>gd`  | Show diff         | `:Gitsigns diffthis`                  |
| `gk`          | Previous change   | `:Gitsigns prev_hunk`                 |
| `gj`          | Next change       | `:Gitsigns next_hunk`                 |

### **🤖 Tools**

| Keybinding | Action | Notes |
| ------------ |kk ---------------- | --------------------------------- |
| `<leader>.` | Toggle terminal | Like `:vs +term` |

## 🐛 **If Something Breaks:**

```bash
# Restore your backup
cp '~/Library/Application Support/Cursor/User/settings_backup.json' '~/Library/Application Support/Cursor/User/settings.json'
```
