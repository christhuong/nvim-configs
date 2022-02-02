call plug#begin('~/.config/nvim/plugged')
" lsp
Plug 'neovim/nvim-lspconfig'
" syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" search (requires global fzf and ripgrep)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" folder tree
Plug 'scrooloose/nerdtree'
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
Plug 'mhinz/vim-signify'
" take simple notes
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
" code suggestions from Github
Plug 'github/copilot.vim'
" themes
Plug 'Luxed/ayu-vim'
" vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
