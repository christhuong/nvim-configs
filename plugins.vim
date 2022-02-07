call plug#begin('~/.config/nvim/plugged')
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
" Code completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" search (requires global fzf and ripgrep)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" folder tree
" Plug 'scrooloose/nerdtree'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" icons
Plug 'ryanoasis/vim-devicons'
" move cursor to any position
Plug 'phaazon/hop.nvim'
" highlight redundant white spaces
Plug 'ntpeters/vim-better-whitespace'
" comment code more easily
Plug 'tomtom/tcomment_vim'
" change the surroundings of codes
Plug 'tpope/vim-surround' " Must try!
" perform git commands
Plug 'tpope/vim-fugitive'
" show git changes in the sign column
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
" take simple notes
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
" code suggestions from Github
Plug 'github/copilot.vim'
" themes
Plug 'Luxed/ayu-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

lua << EOF
require"hop".setup()
require"configs.cmp".config()
require"configs.gitsigns".config()
require"configs.lsp".config()
require"configs.null-ls".config()
require"configs.nvim-tree".config()
require"configs.treesitter".config()
EOF
