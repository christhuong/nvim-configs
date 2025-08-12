-- 🎨 THEMES
--
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = 1
-- vim.cmd [[ colorscheme tokyonight ]]
--
-- vim.g.ayucolor = "light"
-- vim.g.ayucolor = "mirage"
-- vim.g.ayucolor = "dark"
-- vim.cmd [[ colorscheme ayu ]]
-- vim.g.ayu_italic_comment = 1
-- vim.g.ayu_sign_contrast = 1
-- vim.g.ayu_extended_palette = 1
--
vim.cmd [[ colorscheme xcodedarkhc ]]
-- vim.cmd [[ colorscheme xcodelight ]]

-- 🔍 FZF
-- vim.g.fzf_layout = { ['window'] = { ['width'] = 1, ['height'] = 1 } }
vim.g.fzf_layout = { ['window'] = { ['width'] = 1, ['height'] = 1, ['border'] = 'none' } }
vim.g.fzf_preview_window = {'right:30%', 'ctrl-/'}  -- Show preview on right
-- vim.g.fzf_preview_window = ''  -- Hide preview window
-- Hide UI elements when FZF is active
vim.cmd [[
  autocmd FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
]]
-- FZF color scheme integration
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

-- 📈 TABS & STATUS LINES
vim.g.airline_theme = 'transparent'
vim.g.airline_highlighting_cache = 0
vim.cmd [[
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#fnamemod = ':t'           " Show only filename
  let g:airline#extensions#tabline#show_tab_count = 0
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#tab_min_count = 1
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#formatter = 'jsformatter' " Format: f/p/file-name.js
  " Tabline separators (clean/transparent style)
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = ' '
  let g:airline#extensions#tabline#right_sep = ' '
  let g:airline#extensions#tabline#right_alt_sep = ' '
  " Hide unnecessary sections for clean look
  let g:airline_section_x = ''    " Hide filetype/encoding
  let g:airline_section_y = ''    " Hide file format
  let g:airline_section_z = ''    " Hide position info
  let g:airline_section_error = ''
  let g:airline_section_warning = ''
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
vim.cmd [[
  " set laststatus=0 noruler    " Hide statusline
  " set showtabline=0           " Hide tabline
  "
  highlight ErrorMsg NONE                    " Less intrusive error messages
  highlight SignColumn guibg=NONE            " Transparent sign column (git indicators)
  "
  highlight TabLine guibg=NONE guifg=#5C6370 gui=NONE       " Inactive tabs
  highlight TabLineFill guibg=NONE gui=NONE                 " Tab bar background
  highlight TabLineSel guibg=NONE guifg=#ABB2BF gui=bold    " Active tab
  "
  highlight StatusLine guibg=NONE guifg=#5C6370 gui=NONE    " Active window statusline
  highlight StatusLineNC guibg=NONE guifg=#3E4451 gui=NONE  " Inactive window statusline
  highlight VertSplit guibg=NONE guifg=#3E4451 gui=NONE     " Window split separator
  "
  highlight link airline_tabfill TabLineFill
  highlight link airline_tab TabLine
  highlight link airline_tabsel TabLineSel
]]
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Reapply transparent settings after any colorscheme change
    vim.cmd [[
      highlight TabLine guibg=NONE guifg=#5C6370 gui=NONE
      highlight TabLineFill guibg=NONE gui=NONE  
      highlight TabLineSel guibg=NONE guifg=#ABB2BF gui=bold
      highlight StatusLine guibg=NONE guifg=#5C6370 gui=NONE
      highlight StatusLineNC guibg=NONE guifg=#3E4451 gui=NONE
      highlight VertSplit guibg=NONE guifg=#3E4451 gui=NONE
      highlight SignColumn guibg=NONE
    ]]
  end,
})
