# 🚀 VSCode/Cursor Neovim Keybinding Setup

## ⚠️ **BACKUP FIRST!**

```bash
# Backup your current settings
cp '~/Library/Application Support/Cursor/User/settings.json' '~/Library/Application Support/Cursor/User/settings_backup.json'

# Apply the new settings
cp ~/.config/nvim/vscodevim/settings.json '~/Library/Application Support/Cursor/User/settings.json'
```

## **Keybindings**

### 🔍 File Navigation & Search

| Keybinding   | Action                         |
| ------------ | ------------------------------ |
| `<leader>ff` | Quick Open                     |
| `<leader>fa` | Show All Symbols               |
| `<leader>fw` | Open Search View               |
| `<leader>fc` | Find in Files                  |
| `<leader>fl` | Go to Line                     |
| `<leader>fh` | Open Recent                    |
| `<leader>o`  | Switch Window/Editor           |
| `<leader>r`  | Reveal Active File in Explorer |
| `<leader>m`  | Toggle Sidebar Visibility      |
| `<leader>fs` | Git/SCM View                   |

### 📝 Text Manipulation

| Keybinding | Action                   | Modes                  |
| ---------- | ------------------------ | ---------------------- |
| `<C-j>`    | Move line/selection down | Normal, Insert, Visual |
| `<C-k>`    | Move line/selection up   | Normal, Insert, Visual |
| `<Esc>`    | Clear search highlight   | Normal                 |

### 🪟 Window & Split Management

| Keybinding  | Action              |
| ----------- | ------------------- |
| `<leader>v` | Vertical split      |
| `<leader>s` | Horizontal split    |
| `=`         | Increase view width |
| `-`         | Decrease view width |

### 📑 Editor/Tab Navigation

| Keybinding    | Action                    |
| ------------- | ------------------------- |
| `<leader>1-9` | Open editor at index 1-9  |
| `<leader>t`   | New untitled file         |
| `<C-t>`       | Move editor to new window |
| `J`           | Previous editor           |
| `K`           | Next editor               |

### 🔧 File Operations

| Keybinding   | Action                  |
| ------------ | ----------------------- |
| `cp`         | Copy relative file path |
| `cP`         | Copy full file path     |
| `<leader>q`  | Quit editor             |
| `<leader>qq` | Close active editor     |
| `<leader>w`  | Save file               |
| `<leader>wq` | Save and close          |

### 📚 Git Integration (with GitLens)

| Keybinding    | Action                     |
| ------------- | -------------------------- |
| `<leader>gs`  | Git/SCM view               |
| `<leader>gd`  | Open Git file              |
| `<leader>glb` | Toggle line blame          |
| `<leader>gh`  | Open file on remote (link) |
| `<leader>gb`  | Toggle file blame (inline) |
| `<leader>gB`  | Copy remote file URL       |
| `gk`          | Previous change            |
| `gj`          | Next change                |

### 🚦 Diagnostics & LSP-like Actions

| Keybinding  | Action                 |
| ----------- | ---------------------- |
| `<leader>e` | Next error/warning     |
| `<leader>d` | Previous error/warning |
| `<leader>k` | Show hover             |
| `<leader>p` | Format document        |

### 🤖 Tools

| Keybinding  | Action          |
| ----------- | --------------- |
| `<leader>.` | Toggle terminal |

### ⌨️ Insert Mode

| Keybinding | Action                 |
| ---------- | ---------------------- |
| `jj`       | Exit insert mode (Esc) |
| `jk`       | Exit insert mode (Esc) |
| `<C-j>`    | Move line down         |
| `<C-k>`    | Move line up           |

### ✂️ Visual Mode

| Keybinding   | Action                   |
| ------------ | ------------------------ |
| `>`          | Indent selection         |
| `<`          | Outdent selection        |
| `<C-j>`      | Move selection down      |
| `<C-k>`      | Move selection up        |
| `<leader>gh` | Open selection on remote |
| `<leader>gb` | Toggle file blame        |
| `<leader>gB` | Copy remote URL          |
| `<leader>e`  | Next error/warning       |
| `<leader>d`  | Previous error/warning   |

## 🐛 **If Something Breaks:**

```bash
# Restore your backup
cp '~/Library/Application Support/Cursor/User/settings_backup.json' '~/Library/Application Support/Cursor/User/settings.json'
```
