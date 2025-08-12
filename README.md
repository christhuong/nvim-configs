# ⚡️ My simple and minimal neovim setup ⚡️

## Getting ready

```shell
brew install neovim fzf ripgrep
```

```shell
mv ~/.config/nvim ~/.config/nvim.backup
git clone git@github.com:christhuong/nvim-configs.git ~/.config/nvim
```

```shell
npm install -g typescript typescript-language-server vscode-langservers-extracted
npm install -g eslint prettier
```

```vim
:TSInstall typescript javascript tsx json css html vim ruby python lua
```

## 🎯 Cheatsheet

### Basic Vim Navigation

| Key             | Action                    |
| --------------- | ------------------------- |
| `h j k l`       | Move left/down/up/right   |
| `w b`           | Word forward/backward     |
| `0 $`           | Start/end of line         |
| `gg G`          | First/last line           |
| `{ }`           | Paragraph up/down         |
| `Ctrl+u Ctrl+d` | Half page up/down         |
| `Ctrl+b Ctrl+f` | Full page up/down         |
| `Ctrl+e`        | Scroll down               |
| `Ctrl+o`        | Jump to previous location |
| `Ctrl+i`        | Jump to next location     |

### Advanced Movement

| Key       | Action                       |
| --------- | ---------------------------- |
| `gi`      | Go to last insertion point   |
| `g;`      | Go to next change            |
| `g,`      | Go to previous change        |
| `f<char>` | Find character after cursor  |
| `t<char>` | Move to before char          |
| `F<char>` | Find character before cursor |
| `;`       | Repeat last f/t/F/T          |
| `,`       | Reverse last f/t/F/T         |
| `[m`      | Move to start of method      |
| `]m`      | Move to end of method        |
| `%`       | Jump to matching bracket     |

### Opening Files & History

| Key                    | Action                 |
| ---------------------- | ---------------------- |
| `gf`                   | Open file under cursor |
| `gx`                   | Open link under cursor |
| `q/`                   | Open search history    |
| `q:`                   | Open command history   |
| `Ctrl+f` (in cmd mode) | Open command history   |

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
| `@:`       | Repeat last command        |
| `@@`       | Repeat last repeat         |

### Text Formatting & Manipulation

| Key/Command        | Action                             |
| ------------------ | ---------------------------------- |
| `guiw`             | Lowercase current word             |
| `gUiw`             | UPPERCASE current word             |
| `:sort` / `:sort!` | Sort lines ascending/descending    |
| `:%s/old/new/g`    | Replace all occurrences            |
| `:&&`              | Repeat last substitute             |
| `:~`               | Repeat substitute with new pattern |

### Line Operations

| Command    | Action                          |
| ---------- | ------------------------------- |
| `:1,40d`   | Delete lines 1-40               |
| `:2,$d`    | Delete from line 2 to end       |
| `:.,$d`    | Delete from current line to end |
| `:%d`      | Delete all lines                |
| `:.,.+10d` | Delete current line + next 10   |

### Insert Mode Shortcuts

| Key            | Action                       |
| -------------- | ---------------------------- |
| `Ctrl+a`       | Insert last inserted text    |
| `Ctrl+h`       | Delete character (backspace) |
| `Ctrl+w`       | Delete current word          |
| `Ctrl+u`       | Delete to start of line      |
| `Ctrl+t`       | Add indentation              |
| `Ctrl+d`       | Remove indentation           |
| `Ctrl+o`       | Normal mode for one command  |
| `Ctrl+r <reg>` | Paste from register          |
| `Ctrl+r =`     | Calculate and insert result  |
| `Ctrl+v`       | Insert literal character     |

### Visual Mode Operations

| Key       | Action                           |
| --------- | -------------------------------- |
| `Ctrl+v`  | Switch to block visual mode      |
| `Shift+v` | Switch to line visual mode       |
| `U`       | Uppercase selection              |
| `R` / `S` | Delete selection and insert      |
| `I`       | Insert at beginning of each line |

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

| Key           | Action                           |
| ------------- | -------------------------------- |
| `<leader>gs`  | Git status                       |
| `<leader>glb` | Toggle line blame                |
| `<leader>gd`  | Git diff this file               |
| `<leader>gh`  | Open line/selection on GitHub    |
| `<leader>gb`  | Open line/selection GitHub blame |
| `gj`          | Next git hunk                    |
| `gk`          | Previous git hunk                |
| `cp`          | Copy relative file path          |
| `cP`          | Copy absolute file path          |

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

### Folding

| Key  | Action                |
| ---- | --------------------- |
| `zi` | Toggle folding        |
| `zo` | Open fold             |
| `zc` | Close fold            |
| `za` | Toggle fold           |
| `zM` | Close all folds       |
| `zR` | Open all folds        |
| `[z` | Move to start of fold |
| `]z` | Move to end of fold   |

### Vim-Surround (Plugin)

| Key    | Action                      |
| ------ | --------------------------- |
| `cs'"` | Change surrounding ' to "   |
| `ds'`  | Delete surrounding '        |
| `yss)` | Surround entire line with)  |
| `yspt` | Surround paragraph with tag |

### Abbreviations

| Command             | Action                    |
| ------------------- | ------------------------- |
| `:ab <abbr> <word>` | Add abbreviation          |
| `:una <abbr>`       | Remove abbreviation       |
| `:abc`              | Remove all abbreviations  |
| `Ctrl+v` (insert)   | Don't expand abbreviation |

### Shell Integration

| Command/Key     | Action                       |
| --------------- | ---------------------------- |
| `:r! <command>` | Insert command output        |
| `!!<command>`   | Replace line with cmd output |
| `:read! <cmd>`  | Insert shell command output  |

### Advanced Commands

| Command         | Action                   |
| --------------- | ------------------------ |
| `Ctrl+r/Ctrl+t` | Navigate command matches |
| `:tabonly`      | Close all other tabs     |
| `%` (filename)  | Represents current file  |

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

## Other setup

### Increase key repeats

```shell
defaults write NSGlobalDomain KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write NSGlobalDomain InitialKeyRepeat -int 10
```

```shell
osascript -e 'id of app "Cursor"'
defaults write 'com.todesktop.230313mzl4w4u92' ApplePressAndHoldEnabled -bool false
# defaults write 'com.microsoft.VSCode' ApplePressAndHoldEnabled -bool false
```
