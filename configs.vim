syntax on
filetype plugin indent on
set autoindent " auto-indent
set background=dark
set clipboard=unnamed
set encoding=UTF-8
set expandtab " tab is spaces
set foldlevel=2 " start folding at level 2
set foldmethod=syntax " fold by syntax
set foldnestmax=10 " fold nested to 10 levels
set hidden
set hlsearch " highlight search
set ignorecase " required for smartcase to work
set incsearch " search as you type
set lazyredraw
set mouse=a " mouse support
set nobackup " don't make backups
set nofoldenable " don't fold
set noshowmode " get rid of -- INSERT -- line
set noswapfile " don't use swap files
set nowritebackup " don't write backups
set number " show line numbers
set regexpengine=0
set rnu " show relative number
set shiftwidth=2 " even if there are tabs, preview as 2 spaces
set smartcase " case-sensitive when uppercase present
set smartindent   " be smart about indentation
set smarttab
set softtabstop=2
set tabstop=2
set termguicolors " enable true colors support
set timeoutlen=1000 " set key map timeout to 1 second
set ttimeoutlen=0 " set typing timeout to 0 seconds

" coc-vim configs
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint'
  \ ]

" vim notes configs
let g:notes_directories = ['~/Documents/Notes'] " where to look for notes
let g:notes_suffix = '.md' " note extension

" auto stripe white spaces
autocmd BufWritePre * StripWhitespace

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
