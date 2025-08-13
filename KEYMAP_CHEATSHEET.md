# 🚀 My Key Mappings Cheatsheet

---

## 🔧 Basic Configuration

| Setting        | Value     |
| -------------- | --------- |
| **Leader Key** | `<Space>` |

---

## 🧭 Basic Vim Operations

### Essential Movement

| Key             | Action                   | Description                  |
| --------------- | ------------------------ | ---------------------------- |
| `h j k l`       | Move left/down/up/right  | Basic directional movement   |
| `w b`           | Word forward/backward    | Move by words                |
| `e`             | End of word              | Jump to end of current word  |
| `0 $`           | Start/end of line        | Line boundaries              |
| `gg G`          | First/last line          | File boundaries              |
| `{ }`           | Paragraph up/down        | Move by paragraphs           |
| `Ctrl+u Ctrl+d` | Half page up/down        | Scroll half pages            |
| `Ctrl+b Ctrl+f` | Full page up/down        | Scroll full pages            |
| `Ctrl+e`        | Scroll down              | Scroll without moving cursor |
| `%`             | Jump to matching bracket | Bracket/parentheses matching |

### Mode Operations

| Key       | Action                     | Description               |
| --------- | -------------------------- | ------------------------- |
| `i a`     | Insert before/after cursor | Enter insert mode         |
| `I A`     | Insert start/end of line   | Insert at line boundaries |
| `o O`     | New line below/above       | Create new lines          |
| `v V`     | Visual mode character/line | Visual selection modes    |
| `Ctrl+v`  | Visual block mode          | Block visual selection    |
| `jj` `jk` | Escape to normal mode      | Quick escape from insert  |
| `<Esc>`   | Clear search highlighting  | Remove search highlights  |

### Essential Commands

| Key        | Action                 | Description               |
| ---------- | ---------------------- | ------------------------- |
| `y p`      | Yank (copy) and paste  | Copy and paste operations |
| `d`        | Delete (cut)           | Delete/cut operations     |
| `u Ctrl+r` | Undo/redo              | Undo and redo changes     |
| `.`        | Repeat last command    | Repeat last edit          |
| `@:`       | Repeat last Ex command | Repeat last colon command |
| `@@`       | Repeat last repeat     | Repeat last macro/repeat  |

### Insert Mode Shortcuts

| Key            | Action                       | Description               |
| -------------- | ---------------------------- | ------------------------- |
| `Ctrl+a`       | Insert last inserted text    | Repeat last insertion     |
| `Ctrl+h`       | Delete character (backspace) | Delete character backward |
| `Ctrl+w`       | Delete current word          | Delete word backward      |
| `Ctrl+u`       | Delete to start of line      | Delete to line beginning  |
| `Ctrl+t`       | Add indentation              | Indent current line       |
| `Ctrl+d`       | Remove indentation           | Unindent current line     |
| `Ctrl+o`       | Normal mode for one command  | Temporary normal mode     |
| `Ctrl+r <reg>` | Paste from register          | Insert from register      |
| `Ctrl+r =`     | Calculate and insert result  | Insert calculation result |
| `Ctrl+v`       | Insert literal character     | Insert special characters |

### Visual Mode Operations

| Key       | Action                           | Description                      |
| --------- | -------------------------------- | -------------------------------- |
| `Ctrl+v`  | Switch to block visual mode      | Block selection                  |
| `Shift+v` | Switch to line visual mode       | Line selection                   |
| `U`       | Uppercase selection              | Transform selection to uppercase |
| `R` / `S` | Delete selection and insert      | Replace selection with new text  |
| `I`       | Insert at beginning of each line | Multi-line insert                |

---

## 🔍 Advanced Navigation & Movement

### Jump Commands

| Key      | Action                     | Description                     |
| -------- | -------------------------- | ------------------------------- |
| `Ctrl+o` | Jump to previous location  | Navigate backward in jumplist   |
| `Ctrl+i` | Jump to next location      | Navigate forward in jumplist    |
| `gi`     | Go to last insertion point | Return to where you last edited |
| `g;`     | Go to next change          | Navigate through change list    |
| `g,`     | Go to previous change      | Navigate through change list    |
| `gf`     | Open file under cursor     | Open file path under cursor     |
| `gx`     | Open link under cursor     | Open URL/link under cursor      |

### Character Navigation

| Key       | Action                       | Description                   |
| --------- | ---------------------------- | ----------------------------- |
| `f<char>` | Find character after cursor  | Quick character navigation    |
| `t<char>` | Move to before char          | Jump till character           |
| `F<char>` | Find character before cursor | Backward character navigation |
| `T<char>` | Till character backward      | Jump till character backward  |
| `;`       | Repeat last f/t/F/T          | Repeat last character search  |
| `,`       | Reverse last f/t/F/T         | Reverse last character search |

### Quick Navigation (Hop Plugin)

| Key         | Mode                   | Action            | Description                  |
| ----------- | ---------------------- | ----------------- | ---------------------------- |
| `<leader>j` | Normal                 | `:HopWordMW<CR>`  | Jump to any word on screen   |
| `f`         | Normal/Visual/Operator | Hop forward       | Quick jump forward           |
| `F`         | Normal/Visual/Operator | Hop backward      | Quick jump backward          |
| `t`         | Normal/Visual/Operator | Hop till          | Jump till character          |
| `T`         | Normal/Visual/Operator | Hop till backward | Jump till character backward |

### History & Search

| Key                    | Action               | Description                 |
| ---------------------- | -------------------- | --------------------------- |
| `q/`                   | Open search history  | Browse previous searches    |
| `q:`                   | Open command history | Browse previous commands    |
| `Ctrl+f` (in cmd mode) | Open command history | Command line history window |

---

## ✂️ Text Editing & Manipulation

### Line Movement

| Key     | Mode   | Action              | Description                          |
| ------- | ------ | ------------------- | ------------------------------------ |
| `<C-j>` | Normal | Move line down      | Move current line down               |
| `<C-k>` | Normal | Move line up        | Move current line up                 |
| `<C-j>` | Insert | Move line down      | Move current line down (from insert) |
| `<C-k>` | Insert | Move line up        | Move current line up (from insert)   |
| `<C-j>` | Visual | Move selection down | Move selected lines down             |
| `<C-k>` | Visual | Move selection up   | Move selected lines up               |

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

### Text Formatting

| Key/Command        | Action                             | Description             |
| ------------------ | ---------------------------------- | ----------------------- |
| `guiw`             | Lowercase current word             | Change word case        |
| `gUiw`             | UPPERCASE current word             | Change word case        |
| `:sort` / `:sort!` | Sort lines ascending/descending    | Sort selected lines     |
| `:%s/old/new/g`    | Replace all occurrences            | Global find and replace |
| `:&&`              | Repeat last substitute             | Repeat substitution     |
| `:~`               | Repeat substitute with new pattern | Advanced substitution   |

### Line Operations

| Command    | Action                          | Description                |
| ---------- | ------------------------------- | -------------------------- |
| `:1,40d`   | Delete lines 1-40               | Delete line range          |
| `:2,$d`    | Delete from line 2 to end       | Delete to end of file      |
| `:.,$d`    | Delete from current line to end | Delete from cursor to end  |
| `:%d`      | Delete all lines                | Clear entire buffer        |
| `:.,.+10d` | Delete current line + next 10   | Delete relative line range |

### Folding

| Key  | Action                | Description              |
| ---- | --------------------- | ------------------------ |
| `zi` | Toggle folding        | Enable/disable folding   |
| `zo` | Open fold             | Open fold under cursor   |
| `zc` | Close fold            | Close fold under cursor  |
| `za` | Toggle fold           | Toggle fold under cursor |
| `zM` | Close all folds       | Close all folds in file  |
| `zR` | Open all folds        | Open all folds in file   |
| `[z` | Move to start of fold | Navigate to fold start   |
| `]z` | Move to end of fold   | Navigate to fold end     |

---

## 📁 File & Project Management

### File Operations

| Key          | Mode   | Action             | Description                                  |
| ------------ | ------ | ------------------ | -------------------------------------------- |
| `<leader>ww` | Normal | `:w<CR>`           | Save current file                            |
| `<leader>wq` | Normal | `:wq<CR>`          | Save and quit                                |
| `<leader>qq` | Normal | `:q!<CR>`          | Force quit without saving                    |
| `cp`         | Normal | Copy relative path | Copy current file relative path to clipboard |
| `cP`         | Normal | Copy absolute path | Copy current file absolute path to clipboard |

### NvimTree (Floating File Explorer)

| Key         | Mode   | Action               | Description                             |
| ----------- | ------ | -------------------- | --------------------------------------- |
| `<C-n>`     | Normal | Toggle floating tree | Show/hide floating file tree            |
| `<leader>e` | Normal | Find file in tree    | Find and highlight current file in tree |
| `<leader>m` | Normal | Toggle tree          | Alternative tree toggle                 |
| `<leader>r` | Normal | Find file            | Find current file in tree               |

#### NvimTree Actions (Within Tree Window)

| Key (in tree) | Action                 | Description            |
| ------------- | ---------------------- | ---------------------- |
| `Enter`       | Open file/folder       | Open selected item     |
| `a`           | Create new file/folder | Add new item           |
| `d`           | Delete                 | Delete selected item   |
| `r`           | Rename                 | Rename selected item   |
| `x`           | Cut                    | Cut selected item      |
| `c`           | Copy                   | Copy selected item     |
| `p`           | Paste                  | Paste cut/copied item  |
| `R`           | Refresh                | Refresh tree view      |
| `H`           | Toggle hidden files    | Show/hide hidden files |

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

#### FZF Actions (Within FZF Window)

| Key      | Action           | Description                            |
| -------- | ---------------- | -------------------------------------- |
| `Ctrl-t` | Open in new tab  | Open selected file in new tab          |
| `Ctrl-v` | Vertical split   | Open selected file in vertical split   |
| `Ctrl-s` | Horizontal split | Open selected file in horizontal split |
| `Ctrl-/` | Toggle preview   | Show/hide file preview                 |

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

## 🛠️ Development & Formatting

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

## 🔌 Plugin Management & Commands

### Lazy.nvim (Plugin Manager)

| Command         | Action                 | Description           |
| --------------- | ---------------------- | --------------------- |
| `:Lazy`         | Open plugin manager UI | Manage plugins        |
| `:Lazy sync`    | Update all plugins     | Sync plugin updates   |
| `:Lazy clean`   | Remove unused plugins  | Clean unused plugins  |
| `:Lazy profile` | Show startup times     | Performance profiling |

### Git (Fugitive)

| Command       | Action             | Description            |
| ------------- | ------------------ | ---------------------- |
| `:Git`        | Git status         | Open Git status window |
| `:Git add %`  | Stage current file | Add file to staging    |
| `:Git commit` | Commit changes     | Create commit          |
| `:Gwrite`     | Stage and write    | Stage and save file    |
| `:Gdiffsplit` | Show git diff      | Visual diff view       |

---

## ⚙️ Advanced Features

### Custom Commands

| Command                            | Description                         |
| ---------------------------------- | ----------------------------------- |
| `:Cdnvim`                          | Change to Neovim config directory   |
| `:Cdzshrc`                         | Open .zshrc file                    |
| `:CommitAndPushAllFiles [message]` | Git add, commit, and push all files |

### Text Abbreviations

| Command             | Action                    | Description              |
| ------------------- | ------------------------- | ------------------------ |
| `:ab <abbr> <word>` | Add abbreviation          | Create text abbreviation |
| `:una <abbr>`       | Remove abbreviation       | Delete abbreviation      |
| `:abc`              | Remove all abbreviations  | Clear all abbreviations  |
| `Ctrl+v` (insert)   | Don't expand abbreviation | Prevent abbreviation     |

### Shell Integration

| Command/Key     | Action                       | Description                 |
| --------------- | ---------------------------- | --------------------------- |
| `:r! <command>` | Insert command output        | Insert shell command result |
| `!!<command>`   | Replace line with cmd output | Replace current line        |
| `:read! <cmd>`  | Insert shell command output  | Read command output         |

### Advanced Vim Commands

| Command         | Action                   | Description              |
| --------------- | ------------------------ | ------------------------ |
| `Ctrl+r/Ctrl+t` | Navigate command matches | Command line navigation  |
| `:tabonly`      | Close all other tabs     | Keep only current tab    |
| `%` (filename)  | Represents current file  | Current file placeholder |

### Useful Vim Commands

| Command       | Action           | Description              |
| ------------- | ---------------- | ------------------------ |
| `:e <file>`   | Edit file        | Open file for editing    |
| `:w`          | Write file       | Save current file        |
| `:q`          | Quit             | Close current window     |
| `:wq`         | Write and quit   | Save and close           |
| `:q!`         | Force quit       | Close without saving     |
| `:vs`         | Vertical split   | Create vertical split    |
| `:sp`         | Horizontal split | Create horizontal split  |
| `:tabnew`     | New tab          | Create new tab           |
| `:tabclose`   | Close tab        | Close current tab        |
| `:buffers`    | List buffers     | Show open buffers        |
| `:b <number>` | Switch to buffer | Jump to buffer by number |

---

## 💡 Pro Tips

1. **FZF workflow**: `<leader>ff` → files, `<leader>fs` → Git changes, `<leader>fw` → text search
2. **Quick escape**: `jj` or `jk` from insert mode is faster than reaching for Escape
3. **Line movement**: `<C-j>` and `<C-k>` work in all modes for moving lines around
4. **Git workflow**: `<leader>gs` → Git status → `gj`/`gk` navigate changes → `<leader>gh` open on GitHub
5. **LSP power**: `gd` for definition, `<leader>k` for docs, `<space>i` for quick fixes
6. **Completion flow**: `<C-j>`/`<C-k>` to navigate, `<CR>` to accept, `<C-Y>` for Copilot
7. **Terminal workflow**: Use `:file <name>` to rename terminal buffers for organization
8. **Floating windows**: Both file tree (`<C-n>`) and FZF preserve your split ratios
9. **Visual block editing**: `Ctrl+v` for column editing - perfect for multi-line changes
10. **Command repetition**: `.` repeats edits, `@:` repeats Ex commands, `@@` repeats last macro
11. **Interactive search**: Use `:%s/old/new/gc` for interactive find and replace with confirmation
12. **File navigation**: `gf` opens file under cursor - great for imports and file references
