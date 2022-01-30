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
noremap <leader>c :Rg <CR>
noremap <leader>l :Lines <CR>
let g:fzf_action =
  \ {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-s': 'split'
  \ }

" quick saving / edit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>x :x<cr>

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

" easy jump
nmap <leader>j <Plug>(easymotion-overwin-w)
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

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

" coc
set shortmess+=c
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>e <Plug>(coc-diagnostic-next)
nmap <leader>d <Plug>(coc-diagnostic-prev)
nmap <leader>i <Plug>(coc-codeaction)
" make <CR> auto-select the first completion item
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" nerdtree
noremap <silent><leader>m :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
