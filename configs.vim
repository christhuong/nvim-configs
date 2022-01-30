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
set mouse=a
set hlsearch " highlight search
set incsearch " search as you type
set ignorecase " required for smartcase to work
set smartcase " case-sensitive when uppercase present
set autoindent
set smartindent   " be smart about indentation
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
set nobackup
set nowritebackup
set noswapfile
set number
set rnu
set noshowmode " get rid of -- INSERT -- line
set termguicolors " enable true colors support
set timeoutlen=1000
set ttimeoutlen=0

" coc definitions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint'
  \ ]

" vim notes
let g:notes_directories = ['~/Documents/Notes'] " where to look for notes
let g:notes_suffix = '.md' " what to look for

autocmd BufWritePre * StripWhitespace

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
