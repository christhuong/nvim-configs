" quick escape
inoremap jk <ESC>
inoremap jj <ESC>
" escape search highlight
nnoremap <Esc> :noh<CR><Esc>

" leader key
let mapleader=" "

" move codes around
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" searching with fzf
noremap <leader>o :Buffers <CR>
noremap <leader>f :GFiles<CR>
noremap <leader>a :Files <CR>
noremap <leader>w :Rg <CR>
noremap <leader>l :Lines <CR>
let g:fzf_action =
  \ {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-s': 'split'
  \ }

" split screen
set splitright
noremap <leader>v :vsplit<cr>
noremap <leader>s :split<cr>

" copy current file / folder path
nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" git
noremap <leader>gs :Git<cr>
noremap <leader>gb :Git blame<cr>
noremap <leader>gd :Gdiff<cr>

" easy jump
nmap <leader>j :HopWordMW<cr>

" resize splits
nnoremap <silent> = :exe "vertical resize +10"<CR>
nnoremap <silent> - :exe "vertical resize -10"<CR>

" terminal
set autowriteall
tnoremap jj <C-\><C-n>
" open terminal in a v-split
nnoremap <leader>. :vsplit<CR>:terminal<CR>i
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" tabs mappings
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap <leader>n :tabnew<cr>
noremap <leader>t <c-w>T

" nvimtree
noremap <silent><leader>m :NvimTreeToggle<CR>
map <leader>r :NvimTreeFindFile<cr>
