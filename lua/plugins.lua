local Plug = vim.fn['plug#']

-- install plugins

vim.call('plug#begin', '~/.config/nvim/plugged')
-- lsp
Plug('neovim/nvim-lspconfig')
Plug('mhartington/formatter.nvim')
-- code completion
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')
-- syntax highlight
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
-- search files
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install()'] })
Plug('junegunn/fzf.vim')
-- folder tree
Plug('kyazdani42/nvim-tree.lua')
-- file icons
Plug('kyazdani42/nvim-web-devicons')
-- move cursor to any position
Plug('phaazon/hop.nvim')
-- comment code more easily
Plug('tomtom/tcomment_vim')
-- change the surroundings of codes
Plug('tpope/vim-surround') -- Must try!
-- perform git commands
Plug('tpope/vim-fugitive')
-- show git changes
Plug('nvim-lua/plenary.nvim')
Plug('lewis6991/gitsigns.nvim')
-- open git links
Plug('ruanyl/vim-gh-line')
-- take simple notes
Plug('xolox/vim-notes')
Plug('xolox/vim-misc')
-- code suggestions from Github
Plug('github/copilot.vim')
-- themes
Plug('Luxed/ayu-vim')
Plug('arzg/vim-colors-xcode')
Plug('folke/tokyonight.nvim', { branch = 'main' })
-- auto pairs
Plug('jiangmiao/auto-pairs')
-- start up dashboard
Plug('mhinz/vim-startify')
-- vim status line
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
-- indent lines
Plug("lukas-reineke/indent-blankline.nvim", { main = 'ibl', opts = {} })
-- colors
Plug('norcalli/nvim-colorizer.lua')
vim.call('plug#end')


-- setup plugins

require"hop".setup()
require'colorizer'.setup()

require("ibl").setup {
  indent = { char = "▏" },
  scope = { enabled = false },
}

-- <-- start configuring language server

local lsp_on_attach = function (client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.document_range_formatting = false
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>i', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')
for _, server in pairs({ 'tsserver' }) do
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
    on_attach = lsp_on_attach,
  })
end
lspconfig.eslint.setup({
  capabilities = lsp_capabilities,
  on_attach = function(client, bufnr)
    lsp_on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  settings = {
    workingDirectory = { mode = 'location' },
  },
  root_dir = lspconfig.util.find_git_ancestor
})

require("formatter").setup({
  logging = false,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = { require("formatter.filetypes.lua").stylua },
    javascript = { require("formatter.filetypes.javascript").prettier },
    javascriptreact = { require("formatter.filetypes.javascript").prettier },
    typescript = { require("formatter.filetypes.typescript").prettier },
    typescriptreact = { require("formatter.filetypes.typescript").prettier },
    json = { require("formatter.filetypes.json").prettier },
  },
})
vim.api.nvim_create_augroup('BufWritePostFormatter', {})
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'FormatWrite',
  group = 'BufWritePostFormatter',
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json' },
})

-- end of configuring language server -->

--  <-- start configuring code highlighting

require"nvim-treesitter.configs".setup {
  autopairs = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    disable = { "html" },
    extended_mode = false,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

-- end of configuring code highlighting -->

-- <-- start configuring git signs

-- require"gitsigns".setup({
--   signs = {
--     add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
--     change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
--     delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
--     topdelete = {
--       hl = "GitSignsDelete",
--       text = "契",
--       numhl = "GitSignsDeleteNr",
--       linehl = "GitSignsDeleteLn",
--     },
--     changedelete = {
--       hl = "GitSignsChange",
--       text = "▎",
--       numhl = "GitSignsChangeNr",
--       linehl = "GitSignsChangeLn",
--     },
--   },
-- })
require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

-- end of configuring git signs -->

-- <-- start configuring file tree

local screen_w = vim.opt.columns:get()
local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
local width = math.floor(screen_w)
local height = math.floor(screen_h)
require"nvim-tree".setup({
  respect_buf_cwd = true,
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          staged = "✓",
          unmerged = "",
          unstaged = "✗",
          untracked = "★",
        },
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
        },
      }
    }
  },
  filters = {
    dotfiles = false,
    custom = {
      ".git",
      "node_modules",
      ".cache",
    },
  },
  disable_netrw = false,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = width,
    adaptive_size = true,
    preserve_window_proportions = true,
    number = true,
    relativenumber = false,
    signcolumn = "no",
    -- float = {
    --   enable = true,
      -- open_win_config = {
      --   relative = "editor",
      --   width = width,
      --   height = height,
      -- }
    -- }
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      }
    },
  },
})

-- end of configuring file tree -->

-- <-- start configuring code suggestions

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
local luasnip = require"luasnip"
local cmp = require"cmp"
cmp.setup {
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  duplicates = {
    nvim_lsp = 1,
    luasnip = 1,
    cmp_tabnine = 1,
    buffer = 1,
    path = 1,
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  completion = {
    keyword_length = 1,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}

-- end of configuring code suggestions -->
