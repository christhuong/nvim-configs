# 🚀 Neovim Configuration

⚡️ My nvim configs as a simple editor ⚡️

## 📦 Installation

### 1. Prerequisites

**Install Neovim**

```bash
brew install neovim
```

**Install fzf and ripgrep**

```bash
brew install fzf ripgrep
```

### 2. Clone Configuration

```bash
mv ~/.config/nvim ~/.config/nvim.backup
git clone git@github.com:christhuong/nvim-configs.git ~/.config/nvim
```

### 3. Install Language Servers & Tools

**TypeScript/JavaScript**

```bash
npm install -g typescript typescript-language-server
npm install -g eslint_d
npm install -g prettier
```

**Additional LSP servers (optional)**

```bash
# Ruby
gem install solargraph
```

### 4. First Launch

1. **Start Neovim**: `nvim`
2. **Install plugins**: Lazy.nvim will automatically install all plugins on first launch
3. **Install TreeSitter parsers**:
   ```vim
   :TSInstall typescript javascript python lua json css html vim ruby
   ```
4. **Restart Neovim** to ensure everything loads correctly

## 🎯 Cheatsheet

### Basic Vim Navigation

| Key             | Action                  |
| --------------- | ----------------------- |
| `h j k l`       | Move left/down/up/right |
| `w b`           | Word forward/backward   |
| `0 $`           | Start/end of line       |
| `gg G`          | First/last line         |
| `{ }`           | Paragraph up/down       |
| `Ctrl+u Ctrl+d` | Half page up/down       |
| `Ctrl+b Ctrl+f` | Full page up/down       |

### Essential Vim Commands

| Key        | Action                     |
| ---------- | -------------------------- |
| `i a`      | Insert before/after cursor |
| `I A`      | Insert start/end of line   |
| `o O`      | New line below/above       |
| `v V`      | Visual mode character/line |
| `Ctrl+v`   | Visual block mode          |
| `y p`      | Yank (copy) and paste      |
| `d`        | Delete (cut)               |
| `u Ctrl+r` | Undo/redo                  |
| `.`        | Repeat last command        |

### Custom Keybindings (Leader = Space)

#### File Operations

| Key          | Action                  |
| ------------ | ----------------------- |
| `jj` or `jk` | Escape from insert mode |
| `<leader>ww` | Save file               |
| `<leader>qq` | Quit without saving     |
| `<leader>wq` | Save and quit           |
| `<Esc>`      | Clear search highlight  |

#### Movement & Editing

| Key         | Action           |
| ----------- | ---------------- |
| `Ctrl+j`    | Move line down   |
| `Ctrl+k`    | Move line up     |
| `<leader>j` | Hop jump to word |

#### File Navigation

| Key         | Action                     |
| ----------- | -------------------------- |
| `<leader>m` | Toggle file tree           |
| `<leader>r` | Find current file in tree  |
| `Ctrl+n`    | Toggle file tree           |
| `<leader>e` | Find file in tree (toggle) |

#### File Search (FZF)

| Key          | Action                         |
| ------------ | ------------------------------ |
| `<leader>ff` | Find git files                 |
| `<leader>fa` | Find all files                 |
| `<leader>fw` | Search text in files (ripgrep) |
| `<leader>fc` | Search word under cursor       |
| `<leader>o`  | Switch buffers                 |
| `<leader>fl` | Search lines in current buffer |
| `<leader>fs` | Git status files               |
| `<leader>fh` | File history                   |

#### Splits & Tabs

| Key           | Action                |
| ------------- | --------------------- |
| `<leader>v`   | Vertical split        |
| `<leader>s`   | Horizontal split      |
| `=`           | Increase split width  |
| `-`           | Decrease split width  |
| `<leader>t`   | New tab               |
| `J`           | Previous tab          |
| `K`           | Next tab              |
| `<leader>1-9` | Go to tab number      |
| `Ctrl+t`      | Move split to new tab |

#### Git Operations

| Key           | Action                  |
| ------------- | ----------------------- |
| `<leader>gs`  | Git status              |
| `<leader>glb` | Toggle line blame       |
| `<leader>gd`  | Git diff this file      |
| `gj`          | Next git hunk           |
| `gk`          | Previous git hunk       |
| `cp`          | Copy relative file path |
| `cP`          | Copy absolute file path |

#### Terminal

| Key          | Action                          |
| ------------ | ------------------------------- |
| `<leader>.`  | Open terminal in vertical split |
| `jj` or `jk` | Exit terminal mode              |

#### Formatting & Code

| Key         | Action              |
| ----------- | ------------------- |
| `<leader>p` | Format current file |

### LSP Keybindings (Language Server)

| Key         | Action               |
| ----------- | -------------------- |
| `gd`        | Go to definition     |
| `gD`        | Go to declaration    |
| `gi`        | Go to implementation |
| `gr`        | Find references      |
| `<leader>k` | Hover documentation  |
| `<space>D`  | Type definition      |
| `<space>R`  | Rename symbol        |
| `<space>i`  | Code actions         |
| `<space>d`  | Previous diagnostic  |
| `<space>e`  | Next diagnostic      |

### Completion (nvim-cmp)

| Key          | Action                 |
| ------------ | ---------------------- |
| `Ctrl+n/j`   | Next suggestion        |
| `Ctrl+p/k`   | Previous suggestion    |
| `Ctrl+Space` | Trigger completion     |
| `Enter`      | Confirm selection      |
| `Shift+Tab`  | Expand snippet or jump |

### Plugin-Specific

#### TreeSitter

```vim
:TSInstall <language>    " Install language parser
:TSUpdate               " Update all parsers
:TSInfo                 " Show parser info
```

#### Lazy.nvim (Plugin Manager)

```vim
:Lazy                   " Open plugin manager UI
:Lazy sync              " Update all plugins
:Lazy clean             " Remove unused plugins
:Lazy profile           " Show startup times
```

#### Git (Fugitive)

```vim
:Git                    " Git status
:Git add %              " Stage current file
:Git commit             " Commit changes
:Gwrite                 " Stage and write
:Gdiffsplit             " Show git diff
```

#### File Tree (NvimTree)

| Key (in tree) | Action                 |
| ------------- | ---------------------- |
| `Enter`       | Open file/folder       |
| `a`           | Create new file/folder |
| `d`           | Delete                 |
| `r`           | Rename                 |
| `x`           | Cut                    |
| `c`           | Copy                   |
| `p`           | Paste                  |
| `R`           | Refresh                |
| `H`           | Toggle hidden files    |

### Useful Vim Commands

```vim
:e <file>               " Edit file
:w                      " Write file
:q                      " Quit
:wq                     " Write and quit
:q!                     " Force quit
:vs                     " Vertical split
:sp                     " Horizontal split
:tabnew                 " New tab
:tabclose               " Close tab
:buffers                " List buffers
:b <number>             " Switch to buffer
```

## 🎨 Customization

- **Themes**: Edit `lua/visuals.lua`
- **Key mappings**: Edit `lua/keymaps.lua`
- **Plugin configs**: Edit `lua/plugins.lua`
- **Neovim settings**: Edit `lua/settings.lua`

## 🔧 Troubleshooting

**Plugins not loading?**

```vim
:Lazy sync
```

**LSP not working?**

```vim
:checkhealth lsp
```

**Icons not showing?**

- Install a Nerd Font and set it in your terminal

**FZF commands not found?**

```bash
brew install fzf ripgrep
```

## 🤝 Credits

Original inspiration from [AstroVim](https://github.com/kabinspace/AstroVim) and various community configurations.
