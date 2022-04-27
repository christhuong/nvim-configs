# nvim-configs

⚡️ My nvim configs as a simple editor ⚡️

## Install

Clone this repo to your nvim configs folder

```shell
git clone git@github.com:christhuong/nvim-configs.git ~/.config/nvim
```

Install vim-plug then using vim-plug to install plugins

```shell
:PlugInstall
```

Modify and install neccessary LSPs. 
The default configs require `pyright` for python, `eslint_d` and `tsserver` for typescript and `solargraph` for ruby.

```shell
npm i -g pyright
npm install -g eslint_d
npm install -g typescript typescript-language-server
gem install solargraph
```

Install tree sitter languages

```shell
:TSInstall typescript javascript python ruby json css html lua vim
```

## Credits

A lot of configs are copied from https://github.com/kabinspace/AstroVim
