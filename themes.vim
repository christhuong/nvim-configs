" colors and theme
" colorscheme ayu
" let ayucolor="dark"
" let g:ayu_italic_comment = 1
" let g:ayu_sign_contrast = 1
let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
colorscheme tokyonight

" fzf layout customizations
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_layout = { 'down': '~40%' }
" fzf color customizations
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

" not highlight error message at the bottom
highlight ErrorMsg NONE
highlight SignColumn guibg=NONE
