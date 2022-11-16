------------------------------------------
-- messy configs, will categorise later --
------------------------------------------
vim.opt.autoindent = true -- auto-indent
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.opt.completeopt = "menuone,noselect"
vim.opt.encoding = "UTF-8"
vim.opt.expandtab = true -- tab is spaces
vim.opt.foldmethod = "manual" -- fold manually
vim.opt.hidden = true
vim.opt.hlsearch = true -- highlight search
vim.opt.ignorecase = true -- required for smartcase to work
vim.opt.incsearch = true -- search as you type
vim.opt.lazyredraw = true -- faster scrolling
vim.opt.mouse = "a" -- mouse support
vim.opt.number = true -- show line numbers
vim.opt.regexpengine = 0
vim.opt.rnu = true -- show relative number
vim.opt.shiftwidth = 2 -- even if there are tabs, preview as 2 spaces
vim.opt.showmatch = true -- highlight matching parenthesis
vim.opt.showmode = false -- get rid of -- INSERT -- line
vim.opt.smartcase = true -- case-sensitive when uppercase present
vim.opt.smartindent = true -- be smart about indentation
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false -- don't use swap files
vim.opt.tabstop = 2
vim.opt.termguicolors = true -- enable true colors support
vim.opt.timeoutlen = 1000 -- set key map timeout to 1 second
vim.opt.ttimeoutlen = 0 -- set typing timeout to 0 seconds
vim.opt.writebackup = false -- don't write backups

-----------------------
-- vim notes configs --
-----------------------
vim.g.notes_directories = { "~/Documents/Notes" } -- where to look for notes
vim.g.notes_suffix = ".md" -- note extension

-------------------------------
-- colors and themes configs --
-------------------------------
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = 1
-- vim.cmd [[ colorscheme tokyonight ]]
-- vim.g.ayucolor = "light"
vim.g.ayucolor = "dark"
vim.cmd [[ colorscheme ayu ]]
vim.g.ayu_italic_comment = 1
vim.g.ayu_sign_contrast = 1
-- vim.cmd [[ colorscheme xcodedarkhc ]]
-- vim.cmd [[ colorscheme xcodelight ]]

-- fzf layout customizations
vim.g.fzf_layout = { ['down'] = '~40%' }
vim.cmd [[
  autocmd FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
]]
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
]]

-------------------
-- other configs --
-------------------
-- hides status bar and tabline
-- not highlight error message at the bottom
vim.cmd [[
  " set laststatus=0 noruler
  " set showtabline=0
  highlight ErrorMsg NONE
  highlight SignColumn guibg=NONE
]]

-- auto stripe white spaces
vim.cmd [[
  autocmd BufWritePre * StripWhitespace
]]
