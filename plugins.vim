call plug#begin('~/.vim/plugged')
" language syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
" search for files, folders and more (requires global fzf and ripgrep)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" show the folder tree
Plug 'scrooloose/nerdtree'
" file and folder icons
Plug 'ryanoasis/vim-devicons'
" move cursor to any position in current screen
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
Plug 'mhinz/vim-signify'
" auto pairs
Plug 'jiangmiao/auto-pairs'
" take simple notes
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
" code suggestions from Github
Plug 'github/copilot.vim'
" themes
Plug 'ayu-theme/ayu-vim'
" vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
