-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = 1
-- vim.cmd [[ colorscheme tokyonight ]]
-- vim.g.ayucolor = "light"
-- vim.g.ayucolor = "mirage"
vim.g.ayucolor = "dark"
vim.cmd [[ colorscheme ayu ]]
vim.g.ayu_italic_comment = 1
vim.g.ayu_sign_contrast = 1
vim.g.ayu_extended_palette = 1
-- vim.cmd [[ colorscheme xcodedarkhc ]]
-- vim.cmd [[ colorscheme xcodelight ]]

-- fzf layout customizations
-- vim.g.fzf_layout = { ['window'] = { ['width'] = 1, ['height'] = 1 } }
vim.g.fzf_layout = { ['window'] = { ['width'] = 1, ['height'] = 1, ['border'] = 'none' } }

vim.cmd [[
  autocmd FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
]]
-- vim.g.fzf_preview_window = '' -- hide preview window
vim.g.fzf_preview_window = {'right:30%', 'ctrl-/'} -- show preview window
-- fzf color customizations
vim.cmd [[
  let $FZF_DEFAULT_OPTS="--preview-window=noborder"
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
]]

-- airline
vim.g.airline_theme='transparent'
vim.cmd [[
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_count = 0
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#tab_min_count = 1
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#formatter = 'jsformatter' " f/p/file-name.js

  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = ''
  let g:airline_section_error = ''
  let g:airline_section_warning = ''

  " powerline symbols
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_left_sep = '·'
  let g:airline_left_alt_sep = '·'
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.dirty='✗'
]]

-- hides status bar and tabline
-- not highlight error message at the bottom
vim.cmd [[
  " set laststatus=0 noruler
  " set showtabline=0
  highlight ErrorMsg NONE
  highlight SignColumn guibg=NONE
]]

