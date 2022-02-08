local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- leader key
vim.g.mapleader = ' '

-- quick escape
map('i', 'jk', '<ESC>', default_opts)
map('i', 'jj', '<ESC>', default_opts)

-- escape search highlight
map('i', '<Esc>', ':noh<CR><ESC>', default_opts)

-- move codes around
map('n', '<C-j>', ':m .+1<CR>==', default_opts)
map('n', '<C-k>', ':m .-2<CR>==', default_opts)
map('i', '<C-j>', '<ESC>:m .+1<CR>==gi', default_opts)
map('i', '<C-k>', '<ESC>:m .-2<CR>==gi', default_opts)
map('v', '<C-j>', ":m '>+1<CR>gv=gv", default_opts)
map('v', '<C-k>', ":m '<-2<CR>gv=gv", default_opts)

-- searching with fzf
map('n', '<leader>o', ':Buffers<CR>', default_opts)
map('n', '<leader>f', ':GFiles<CR>', default_opts)
map('n', '<leader>a', ':Files<CR>', default_opts)
map('n', '<leader>w', ':Rg<CR>', default_opts)
map('n', '<leader>l', ':Lines<CR>', default_opts)
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

-- git
map('n', '<leader>gs', ':Git<CR>', default_opts)
map('n', '<leader>gb', ':Git blame<CR>', default_opts)
map('n', '<leader>gd', ':Gdiff<CR>', default_opts)

-- easy jump
map('n', '<leader>j', ':HopWordMW<CR>', default_opts)

-- resize splits
map('n', '<silent> =', ':exe "vertical resize +10"<CR>', default_opts)
map('n', '<silent> -', ':exe "vertical resize -10"<CR>', default_opts)

-- terminal
vim.opt.autowriteall = true
map('t', 'jj', '<C-\\><C-n>', default_opts)
map('t', 'jk', '<C-\\><C-n>', default_opts)
-- open terminal in a v-split
map('n', '<leader>.', ':vsplit<CR>:terminal<CR>i', default_opts)

-- tabs mappings
map('n', '<leader>1', '1gt', default_opts)
map('n', '<leader>2', '2gt', default_opts)
map('n', '<leader>3', '3gt', default_opts)
map('n', '<leader>4', '4gt', default_opts)
map('n', '<leader>5', '5gt', default_opts)
map('n', '<leader>0', ':tablast<CR>', default_opts)
map('n', '<leader>n', ':tabnew<CR>', default_opts)
map('n', '<leader>t', '<C-w>T', default_opts)

-- nvimtree
map('n', '<leader>m', ':NvimTreeToggle<CR>', default_opts)
map('n', '<leader>r', ':NvimTreeFindFile<CR>', default_opts)
