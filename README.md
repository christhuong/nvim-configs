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

```shell
pip install pyright ruff black
gem install ruby-lsp rubocop
```

## 🎨 Customization

- **Themes**: Edit [lua/visuals.lua](lua/visuals.lua)
- **Key mappings**: Edit [lua/keymaps.lua](lua/keymaps.lua)
- **Plugin configs**: Edit [lua/plugins.lua](lua/plugins.lua)
- **Neovim settings**: Edit [lua/settings.lua](lua/settings.lua)

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

## 📖 Key-maps reference

📚 **[Complete key-maps cheat sheet for this nvim setup](KEYMAP_CHEATSHEET.md)**
