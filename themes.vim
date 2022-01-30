call plug#begin('~/.vim/plugged')
" theme
Plug 'ayu-theme/ayu-vim'
" vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" colors and theme
colorscheme ayu
let ayucolor="dark"

" nerdtree customizations
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['rb', 'js', 'html', 'haml', 'css', 'erb', 'jsx', 'scss', 'ts', 'tsx']
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeShowHidden=1

" airline
let g:airline_theme='transparent'
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0

" fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_action =
  \ {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-s': 'split'
  \ }
let g:fzf_colors =
  \ {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

" change current line number highlight color
highlight CursorLineNr guifg=White guibg=NONE
" not highlight error message at the bottom
highlight ErrorMsg NONE
highlight SignColumn guibg=NONE
