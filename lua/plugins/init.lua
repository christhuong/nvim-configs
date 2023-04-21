local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
-- lsp
Plug('neovim/nvim-lspconfig')
Plug('jose-elias-alvarez/null-ls.nvim')
-- code completion
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')
-- syntax highlight
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
-- search files
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug('junegunn/fzf.vim')
-- folder tree
Plug('kyazdani42/nvim-tree.lua')
-- file icons
Plug('kyazdani42/nvim-web-devicons')
-- move cursor to any position
Plug('phaazon/hop.nvim')
-- highlight redundant white spaces
Plug('ntpeters/vim-better-whitespace')
-- comment code more easily
Plug('tomtom/tcomment_vim')
-- change the surroundings of codes
Plug('tpope/vim-surround') -- Must try!
-- perform git commands
Plug('tpope/vim-fugitive')
-- show git changes
Plug('nvim-lua/plenary.nvim')
Plug('lewis6991/gitsigns.nvim')
-- open git links
Plug('ruanyl/vim-gh-line')
-- take simple notes
Plug('xolox/vim-notes')
Plug('xolox/vim-misc')
-- code suggestions from Github
Plug('github/copilot.vim')
-- themes
Plug('Luxed/ayu-vim')
Plug('arzg/vim-colors-xcode')
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
-- indentation
Plug('lukas-reineke/indent-blankline.nvim')
-- auto pairs
Plug('jiangmiao/auto-pairs')
-- start up dashboard
Plug('mhinz/vim-startify')
-- vim status line
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
-- colors
Plug('norcalli/nvim-colorizer.lua')
vim.call('plug#end')

require"hop".setup()
require"plugins.lsp".config()
require"plugins.treesitter".config()
require"plugins.null-ls".config()
require"plugins.cmp".config()
require"plugins.gitsigns".config()
require"plugins.indentline".config()
require"plugins.nvim-tree".config()

vim.opt.termguicolors = true -- enable true colors support for colorizer
require'colorizer'.setup()
