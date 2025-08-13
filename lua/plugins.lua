--[[
├── 🔧 LSP & Development
│   ├── neovim/nvim-lspconfig          # Language Server Protocol
│   └── mhartington/formatter.nvim     # Code formatting (Prettier, ESLint)
├── 🎯 Completion & Snippets  
│   ├── hrsh7th/nvim-cmp               # Auto-completion engine
│   ├── hrsh7th/cmp-nvim-lsp           # LSP completion source
│   ├── hrsh7th/cmp-buffer             # Buffer completion source
│   ├── hrsh7th/cmp-path               # File path completion
│   ├── hrsh7th/cmp-cmdline            # Command line completion
│   ├── L3MON4D3/LuaSnip               # Snippet engine
│   ├── saadparwaiz1/cmp_luasnip       # Snippet completion source
│   └── github/copilot.vim             # Official GitHub Copilot AI suggestions
├── 🌈 Syntax & Highlighting
│   └── nvim-treesitter/nvim-treesitter # Modern syntax highlighting
├── 🔍 File Management & Search
│   ├── junegunn/fzf                   # Fuzzy finder core
│   ├── junegunn/fzf.vim               # Fuzzy finder for Vim
│   └── nvim-tree/nvim-tree.lua        # File tree explorer
│   ├── nvim-tree/nvim-web-devicons    # File type icons
├── 🚀 Navigation & Movement
│   └── phaazon/hop.nvim               # Quick cursor jumps
├── ✍️ Text Editing
│   ├── tomtom/tcomment_vim            # Smart commenting
│   └── tpope/vim-surround             # Surround text objects
├── 📚 Git Integration
│   ├── tpope/vim-fugitive             # Git commands in Vim
│   ├── nvim-lua/plenary.nvim          # Lua utility library
│   ├── lewis6991/gitsigns.nvim        # Git diff indicators
│   └── ruanyl/vim-gh-line             # GitHub line links
├── 🐍 Python Development
│   ├── pyright (LSP)                  # Type checking & IntelliSense
│   ├── ruff                           # Super fast linting & import sorting
│   └── black (formatter)              # Code formatting
├── 💎 Ruby Development
│   ├── ruby-lsp                       # Official Ruby LSP
│   └── rubocop (formatter)            # Linting & code formatting
├── 📝 Notes taking
│   ├── xolox/vim-notes                # Note taking system
│   └── xolox/vim-misc                 # Utility functions
├── 🎨 UI & Themes
│   ├── Luxed/ayu-vim                  # Ayu color scheme
│   ├── arzg/vim-colors-xcode          # Xcode color scheme  
│   ├── folke/tokyonight.nvim          # Tokyo Night theme
│   ├── vim-airline/vim-airline        # Status line
│   ├── vim-airline/vim-airline-themes # Status line themes
--]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    ft = { "javascript", "typescript", "typescriptreact", "javascriptreact", "lua", "python", "ruby", "go", "rust" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lsp_on_attach = function(client, bufnr)
        -- Correctly disable formatting capabilities
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
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

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      -- TypeScript/JavaScript LSP
      lspconfig.ts_ls.setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
      })

      -- ESLint setup
      lspconfig.eslint.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client, bufnr)
          lsp_on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      -- Python LSP (pyright) - provides excellent type checking and IntelliSense
      lspconfig.pyright.setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
      })

      -- Python linting with ruff (super fast linter)
      lspconfig.ruff.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client, bufnr)
          -- Disable hover in favor of pyright
          client.server_capabilities.hoverProvider = false
          lsp_on_attach(client, bufnr)
        end,
      })

      -- Ruby LSP (official Ruby LSP by Shopify)
      lspconfig.ruby_lsp.setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
        settings = {
          rubyLsp = {
            enabledFeatures = {
              "codeActions",
              "diagnostics", 
              "documentHighlights",
              "documentLink",
              "documentSymbols",
              "foldingRanges",
              "formatting",
              "hover",
              "inlayHint",
              "onTypeFormatting",
              "selectionRanges",
              "semanticHighlighting",
              "completion",
              "codeLens",
              "definition",
              "workspaceSymbols",
              "signatureHelp",
            },
          },
        },
      })
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "Format", "FormatWrite" },
    config = function()
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
          
          -- Python formatting with black
          python = { require("formatter.filetypes.python").black },
          
          -- Ruby formatting with rubocop
          ruby = {
            function()
              return {
                exe = "rubocop",
                args = { "-A", "--format", "quiet", "--stderr", "--stdin", vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
        },
      })
      vim.api.nvim_create_augroup('BufWritePostFormatter', {})
      vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'FormatWrite',
        group = 'BufWritePostFormatter',
        pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json', '*.py', '*.rb' },
      })
    end,
  },

  -- GitHub Copilot (Official)
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Enable Copilot for specific file types
      vim.g.copilot_filetypes = {
        ["*"] = true,
        gitcommit = false,
        gitrebase = false,
        help = false,
        markdown = false,
        yaml = false,
      }
      
      -- Copilot Tab completion settings
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-Y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-H>", 'copilot#Previous()', { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Next()', { silent = true, expr = true })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "󰡱",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "󰜰",
        Module = "󰏗",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "󰒻",
        Keyword = "󰌋",
        Snippet = "󰘦",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "󰕘",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "󰉁",
        Operator = "󰆕",
        TypeParameter = "󰊄",
        Key = "󰌋",
        Namespace = "󰌗",
        Null = "󰟢",
        Number = "󰎠",
        String = "󰉿",
        Boolean = "󰨙",
        Array = "󰅪",
        Object = "󰅩",
        Copilot = "",
        TabNine = "󰏚",
      }
      
      local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      
      cmp.setup({
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or "", vim_item.kind)
            
            -- Source names
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              nvim_lua = "[Lua]",
              copilot = "[Copilot]",
              cmp_tabnine = "[TabNine]",
            })[entry.source.name]
            
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
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
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
      })
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate", "TSInfo", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "markdown",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "css",
          "html",
          "python",
          "ruby",
        },
        autopairs = { enable = false },
        incremental_selection = { enable = true },
        indent = { enable = true },
        rainbow = {
          enable = true,
          disable = { "html" },
          extended_mode = false,
          max_file_lines = nil,
        },
        autotag = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end,
  },

  -- File search
  {
    "junegunn/fzf",
    lazy = false,
    priority = 1000,
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = "junegunn/fzf",
    lazy = false,
    cmd = { "Files", "Rg", "Buffers", "History", "BLines", "Lines", "Tags", "Ag", "GFiles" },
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false, -- Load immediately to ensure commands are available
    priority = 1000,
    cmd = { 
      "NvimTreeToggle", 
      "NvimTreeFocus", 
      "NvimTreeOpen", 
      "NvimTreeClose", 
      "NvimTreeRefresh",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
      "NvimTreeResize",
      "NvimTreeCollapse",
      "NvimTreeCollapseKeepBuffers"
    },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
      { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Find file in tree" },
    },
    config = function()
      local screen_w = vim.opt.columns:get()
      local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
      local width = math.floor(screen_w)
      local height = math.floor(screen_h)
      
      require("nvim-tree").setup({
        respect_buf_cwd = true,
        renderer = {
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              git = {
                deleted = "",
                ignored = "◌",
                renamed = "➜",
                staged = "✓",
                unmerged = "",
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
          -- Diagnostics disabled in nvim-tree to avoid sign conflicts
          enable = false,
        },
        view = {
          width = width,
          adaptive_size = true,
          preserve_window_proportions = true,
          number = true,
          relativenumber = false,
          signcolumn = "no",
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
    end,
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- Navigation
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    keys = {
      { "f", mode = { "n", "x", "o" } },
      { "F", mode = { "n", "x", "o" } },
      { "t", mode = { "n", "x", "o" } },
      { "T", mode = { "n", "x", "o" } },
    },
    cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern" },
    config = function()
      require("hop").setup()
    end,
  },

  -- Comments
  {
    "tomtom/tcomment_vim",
    keys = {
      { "gc", mode = { "n", "v" } },
      { "gcc", mode = "n" },
      { "<C-_>", mode = { "n", "v" } },
    },
    event = "VeryLazy",
  },

  -- Surround
  {
    "tpope/vim-surround",
    keys = { "cs", "ds", "ys" },
  },

  -- Git
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gwrite", "Gread", "Gdiffsplit", "Gvdiffsplit", "GBrowse" },
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "Gitsigns" },
    config = function()
      require('gitsigns').setup({
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
      })
    end,
  },
  -- GitHub line links
  {
    "ruanyl/vim-gh-line",
    cmd = { "GH", "GB" },
    keys = {
      { "<leader>gh", mode = { "n", "v" } },
      { "<leader>gb", mode = { "n", "v" } },
    },
  },

  -- Notes
  {
    "xolox/vim-notes",
    dependencies = "xolox/vim-misc",
    cmd = { "Note", "NoteFromSelectedText", "DeleteNote", "SearchNotes" },
  },
  {
    "xolox/vim-misc",
    lazy = true,
  },

  -- Themes
  {
    "Luxed/ayu-vim",
    lazy = true,
  },
  {
    "arzg/vim-colors-xcode",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    branch = "main",
  },

  -- Status line
  {
    "vim-airline/vim-airline",
    dependencies = "vim-airline/vim-airline-themes",
    event = "VeryLazy",
  },
  {
    "vim-airline/vim-airline-themes",
    lazy = true,
  },
})
