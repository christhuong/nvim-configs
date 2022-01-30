call plug#begin('~/.vim/plugged')
" search for file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" show folder tree with icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" language pack
Plug 'sheerun/vim-polyglot'
" go to a code position
Plug 'easymotion/vim-easymotion' " Must try!
" highlight redundant white space
Plug 'ntpeters/vim-better-whitespace'
" comment code
Plug 'tomtom/tcomment_vim'
" vim surround
Plug 'tpope/vim-surround' " Must try!
" git commands
Plug 'tpope/vim-fugitive'
" show git change in the number column
Plug 'mhinz/vim-signify'
" auto pairs
Plug 'jiangmiao/auto-pairs'
" prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'json', 'vue'] }
" coc vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver'
" taking notes
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'github/copilot.vim'
call plug#end()
