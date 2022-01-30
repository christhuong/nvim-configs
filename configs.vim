syntax on
filetype plugin indent on
set background=dark
set hidden
set encoding=UTF-8
set clipboard=unnamed
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2 " even if there are tabs, preview as 2 spaces
set lazyredraw
set regexpengine=0
set expandtab " tab is spaces
set mouse=a " mouse support
set hlsearch " highlight search
set incsearch " search as you type
set ignorecase " required for smartcase to work
set smartcase " case-sensitive when uppercase present
set autoindent " auto-indent
set smartindent   " be smart about indentation
set foldmethod=syntax " fold by syntax
set foldnestmax=10 " fold nested to 10 levels
set nofoldenable " don't fold
set foldlevel=2 " start folding at level 2
set nobackup " don't make backups
set nowritebackup " don't write backups
set noswapfile " don't use swap files
set number " show line numbers
set rnu " show relative number
set noshowmode " get rid of -- INSERT -- line
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
let g:notes_suffix = '.md' " what to look for

" auto stripe white spaces
autocmd BufWritePre * StripWhitespace

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
