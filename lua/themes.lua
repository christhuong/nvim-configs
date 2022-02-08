-- colors and theme
-- colorscheme ayu
-- let ayucolor="dark"
-- let g:ayu_italic_comment = 1
-- let g:ayu_sign_contrast = 1
vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = 1
vim.cmd [[ colorscheme tokyonight ]]

-- fzf layout customizations
vim.cmd [[ autocmd! FileType fzf ]]
vim.cmd [[
  autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler
]]
vim.g.fzf_layout = { ['down'] = '~40%' }
-- fzf color customizations
vim.cmd [[
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

-- not highlight error message at the bottom
vim.cmd [[ highlight ErrorMsg NONE ]]
vim.cmd [[ highlight SignColumn guibg=NONE ]]
