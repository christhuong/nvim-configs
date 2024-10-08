local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- leader key
vim.g.mapleader = ' '

-- quick escape from insert mode
map('i', 'jj', '<ESC>', default_opts)
map('i', 'jk', '<ESC>', default_opts)

-- escape search highlight
map('n', '<Esc>', ':noh<CR><ESC>', default_opts)

-- quit
map('n', '<leader>qq', ':q!<CR>', default_opts)
map('n', '<leader>ww', ':w<CR>', default_opts)
map('n', '<leader>wq', ':wq<CR>', default_opts)

-- move codes around
map('n', '<C-j>', ':m .+1<CR>==', default_opts)
map('n', '<C-k>', ':m .-2<CR>==', default_opts)
map('i', '<C-j>', '<ESC>:m .+1<CR>==gi', default_opts)
map('i', '<C-k>', '<ESC>:m .-2<CR>==gi', default_opts)
map('v', '<C-j>', ":m '>+1<CR>gv=gv", default_opts)
map('v', '<C-k>', ":m '<-2<CR>gv=gv", default_opts)

-- searching with fzf
map('n', '<leader>o', ':Buffers<CR>', default_opts)
map('n', '<leader>fs', ':GFiles?<CR>', default_opts)
map('n', '<leader>ff', ':GFiles<CR>', default_opts)
map('n', '<leader>fa', ':Files<CR>', default_opts)
map('n', '<leader>fw', ':Rg<CR>', default_opts)
map('n', '<leader>fc', ':Rg <C-R><C-W><CR>', default_opts)
map('n', '<leader>fl', ':Lines<CR>', default_opts)
map('n', '<leader>fh', ':History<CR>', default_opts)
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-v'] = 'vsplit',
  ['ctrl-s'] = 'split',
}

-- split screen
vim.opt.splitright = true
map('n', '<leader>v', ':vsplit<CR>', default_opts)
map('n', '<leader>s', ':split<CR>', default_opts)

-- copy current file / folder path
map('n', 'cp', ':let @* = expand("%")<CR>', default_opts)
map('n', 'cP', ':let @* = expand("%:p")<CR>', default_opts)

-- git commands
map('n', '<leader>gs', ':Git<CR>', default_opts)
map('n', '<leader>glb', ':Gitsigns toggle_current_line_blame<CR>', default_opts)
map('n', '<leader>gd', ':Gitsigns diffthis<CR>', default_opts)
map('n', 'gk', ':Gitsigns prev_hunk<CR>', default_opts)
map('n', 'gj', ':Gitsigns next_hunk<CR>', default_opts)

-- easy jump
map('n', '<leader>j', ':HopWordMW<CR>', default_opts)

-- resize splits
map('n', '=', ':exe "vertical resize +10"<CR>', default_opts)
map('n', '-', ':exe "vertical resize -10"<CR>', default_opts)

-- terminal
vim.opt.autowriteall = true
map('t', 'jj', '<C-\\><C-n>', default_opts)
map('t', 'jk', '<C-\\><C-n>', default_opts)
map('n', '<leader>.', ':vs +term<CR>i', default_opts)

-- tabs mappings
map('n', 'J', 'gT', default_opts)
map('n', 'K', 'gt', default_opts)
map('n', '<leader>1', '1gt', default_opts)
map('n', '<leader>2', '2gt', default_opts)
map('n', '<leader>3', '3gt', default_opts)
map('n', '<leader>4', '4gt', default_opts)
map('n', '<leader>5', '5gt', default_opts)
map('n', '<leader>6', '6gt', default_opts)
map('n', '<leader>7', '7gt', default_opts)
map('n', '<leader>8', '8gt', default_opts)
map('n', '<leader>9', '9gt', default_opts)
map('n', '<leader>t', ':tabnew<CR>', default_opts)
map('n', '<C-t>', '<C-w>T', default_opts) -- open slit into new tab

-- nvimtree
map('n', '<leader>m', ':NvimTreeToggle<CR>', default_opts)
map('n', '<leader>r', ':NvimTreeFindFile<CR>', default_opts)

-- formatting
-- map('n', '<leader>p', ':silent exec "!yarn eslint %:p --fix"<CR>', default_opts)
map('n', '<leader>p', ':FormatWrite<CR>', default_opts)

-- commands
local create_user_command = vim.api.nvim_create_user_command

create_user_command('Cdeh', ':e ~/eh', {})
create_user_command('Cdfrontendcore', ':e ~/eh/frontend-core', {})
create_user_command('Cdemploymenthero', ':e ~/eh/employment-hero', {})
create_user_command('Cdnvim', ':e ~/.config/nvim', {})
create_user_command('Cdreporeport', ':e ~/thuong/repo-report', {})
