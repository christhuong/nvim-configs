--[[
📋 PLUGIN OVERVIEW:
├── 🔧 LSP & Development
│   ├── neovim/nvim-lspconfig          # TypeScript, Python, Ruby LSP servers
│   └── mhartington/formatter.nvim     # Auto-formatting (Prettier, Black, RuboCop)
├── 🎯 Auto-Completion & AI  
│   ├── hrsh7th/nvim-cmp               # Completion engine with LSP integration
│   ├── hrsh7th/cmp-nvim-lsp           # LSP completion source
│   ├── hrsh7th/cmp-buffer             # Buffer text completion
│   ├── hrsh7th/cmp-path               # File path completion
│   ├── hrsh7th/cmp-cmdline            # Command line completion
│   ├── L3MON4D3/LuaSnip               # Snippet engine
│   ├── saadparwaiz1/cmp_luasnip       # Snippet completion integration
│   └── github/copilot.vim             # GitHub Copilot AI suggestions
├── 🌈 Syntax & Highlighting
│   └── nvim-treesitter/nvim-treesitter # Modern syntax highlighting (TS/JS/Python/Ruby)
├── 🔍 File Management & Search
│   ├── junegunn/fzf                   # Fuzzy finder core (floating window)
│   ├── junegunn/fzf.vim               # Fuzzy finder commands
│   ├── nvim-tree/nvim-tree.lua        # Floating file tree (preserves split ratios)
│   └── nvim-tree/nvim-web-devicons    # File type icons
├── 🚀 Navigation & Movement
│   └── phaazon/hop.nvim               # Quick cursor jumps
├── 🎯 Text Manipulation
│   ├── tomtom/tcomment_vim            # Smart commenting (gc, gcc)
│   └── tpope/vim-surround             # Surround text objects (cs, ds, ys)
├── 📚 Git Integration
│   ├── tpope/vim-fugitive             # Git commands (:Git, :Gdiff)
│   ├── nvim-lua/plenary.nvim          # Lua utility library
│   ├── lewis6991/gitsigns.nvim        # Git diff indicators in sign column
│   └── ruanyl/vim-gh-line             # Open GitHub links (<leader>gh, <leader>gb)
├── 📝 Note Taking
│   ├── xolox/vim-notes                # Note management system
│   └── xolox/vim-misc                 # Required utilities
├── 🎨 Themes & UI
│   ├── Luxed/ayu-vim                  # Ayu color scheme
│   ├── arzg/vim-colors-xcode          # Xcode themes
│   ├── folke/tokyonight.nvim          # Tokyo Night theme
│   ├── vim-airline/vim-airline        # Status line
│   └── vim-airline/vim-airline-themes # Status line themes

🔧 LANGUAGE SUPPORT:
├── TypeScript/JavaScript → ts_ls + eslint + prettier
├── Python → pyright + ruff + black  
├── Ruby → ruby-lsp + rubocop
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
  -- ============================================================================
  -- 🔧 LANGUAGE SERVER PROTOCOL (LSP)
  -- ============================================================================
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },  -- Load when opening files
    ft = { "javascript", "typescript", "typescriptreact", "javascriptreact", "lua", "python", "ruby" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP completion integration
    },
    config = function()
      -- Common LSP keybindings and setup applied to all language servers
      local lsp_on_attach = function(client, bufnr)
        -- Disable LSP formatting (we use formatter.nvim instead for consistency)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        local opts = { noremap = true, silent = true }
        -- Diagnostic navigation
        vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)  -- Previous error/warning
        vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)  -- Next error/warning
        -- LSP navigation keybindings (buffer-specific)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)     -- Go to declaration
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)  -- Go to implementation
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)      -- Go to definition
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)      -- Show references
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)    -- Show hover documentation
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)  -- Go to type definition
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)       -- Rename symbol
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>i', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)  -- Show code actions
      end
      -- Enhanced LSP capabilities for better completion integration
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      -- TYPESCRIPT/JAVASCRIPT: ts_ls provides IntelliSense, type checking, and refactoring
      lspconfig.ts_ls.setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
      })
      -- ESLINT: Code linting and auto-fixing for JavaScript/TypeScript
      lspconfig.eslint.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client, bufnr)
          lsp_on_attach(client, bufnr)
          -- Auto-fix ESLint issues on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      -- PYTHON: Pyright for comprehensive type checking and IntelliSense
      lspconfig.pyright.setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,        -- Automatically find Python packages
              useLibraryCodeForTypes = true, -- Use library stubs for better type info
              diagnosticMode = "workspace",  -- Check entire workspace, not just open files
            },
          },
        },
      })
      -- PYTHON: Ruff for super-fast linting and import sorting
      lspconfig.ruff.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client, bufnr)
          -- Let pyright handle hover documentation (ruff focuses on linting)
          client.server_capabilities.hoverProvider = false
          lsp_on_attach(client, bufnr)
        end,
      })
      -- RUBY: Official Ruby LSP with comprehensive IDE features
      lspconfig.ruby_lsp.setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
        settings = {
          rubyLsp = {
            -- Enable all available Ruby LSP features
            enabledFeatures = {
              "codeActions",           -- Quick fixes and refactoring
              "diagnostics",           -- Error and warning detection
              "documentHighlights",    -- Highlight matching symbols
              "documentLink",          -- Clickable links in comments
              "documentSymbols",       -- Outline view support
              "foldingRanges",         -- Code folding
              "formatting",            -- Code formatting
              "hover",                 -- Documentation on hover
              "inlayHint",             -- Inline type hints
              "onTypeFormatting",      -- Format as you type
              "selectionRanges",       -- Smart selection expansion
              "semanticHighlighting",  -- Enhanced syntax highlighting
              "completion",            -- Auto-completion
              "codeLens",              -- Inline actionable information
              "definition",            -- Go to definition
              "workspaceSymbols",      -- Project-wide symbol search
              "signatureHelp",         -- Function parameter hints
            },
          },
        },
      })
    end,
  },
  
  -- ============================================================================
  -- 🎨 CODE FORMATTING
  -- ============================================================================
  {
    "mhartington/formatter.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "Format", "FormatWrite" },  -- Available commands
    config = function()
      require("formatter").setup({
        logging = false,
        -- Configure formatters by file type
        filetype = {
          lua = { require("formatter.filetypes.lua").stylua },
          javascript = { require("formatter.filetypes.javascript").prettier },
          javascriptreact = { require("formatter.filetypes.javascript").prettier },
          typescript = { require("formatter.filetypes.typescript").prettier },
          typescriptreact = { require("formatter.filetypes.typescript").prettier },
          json = { require("formatter.filetypes.json").prettier },
          -- Python: Black for opinionated Python formatting
          python = { require("formatter.filetypes.python").black },
          -- Ruby: RuboCop with auto-correct for Ruby style guide compliance
          ruby = {
            function()
              return {
                exe = "rubocop",
                args = { 
                  "-A",                                    -- Auto-correct all correctable offenses
                  "--format", "quiet",                     -- Minimal output
                  "--stderr",                              -- Send output to stderr
                  "--stdin", vim.api.nvim_buf_get_name(0)  -- Read from stdin with filename
                },
                stdin = true,
              }
            end,
          },
        },
      })
      -- Auto-format supported files on save
      vim.api.nvim_create_augroup('BufWritePostFormatter', {})
      vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'FormatWrite',  -- Format and write the file
        group = 'BufWritePostFormatter',
        pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json', '*.py', '*.rb' },
      })
    end,
  },

  -- ============================================================================
  -- 🎯 AUTO-COMPLETION
  -- ============================================================================
  {
    "github/copilot.vim",
    event = "InsertEnter",  -- Load when entering insert mode
    config = function()
      -- Control which file types Copilot is active for
      vim.g.copilot_filetypes = {
        ["*"] = true,         -- Enable for all file types by default
        gitcommit = false,    -- Disable for git commit messages
        gitrebase = false,    -- Disable for git rebase
        help = false,         -- Disable for help files
        markdown = false,     -- Disable for markdown (avoid suggestions in docs)
        yaml = false,         -- Disable for YAML files
      }
      -- Custom keybindings (disable default Tab mapping)
      vim.g.copilot_no_tab_map = true
      -- Copilot keybindings in insert mode:
      vim.api.nvim_set_keymap("i", "<C-Y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })  -- Accept suggestion
      vim.api.nvim_set_keymap("i", "<C-H>", 'copilot#Previous()', { silent = true, expr = true })      -- Previous suggestion
      vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Next()', { silent = true, expr = true })          -- Next suggestion
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",  -- Load when entering insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP completion source
      "hrsh7th/cmp-buffer",       -- Buffer text completion
      "hrsh7th/cmp-path",         -- File path completion
      "hrsh7th/cmp-cmdline",      -- Command line completion
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completion integration
    },
    config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      cmp.setup({
        -- Snippet expansion setup
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },    -- Highest priority: LSP suggestions
          { name = "luasnip" },     -- Second: Code snippets
          { name = "buffer" },      -- Third: Text from buffers
          { name = "path" },        -- Fourth: File paths
        },
        -- Key mappings for completion navigation
        mapping = {
          -- Navigation keys (two options for each direction)
          ["<C-k>"] = cmp.mapping.select_prev_item(),    -- Previous item
          ["<C-p>"] = cmp.mapping.select_prev_item(),    -- Previous item (alternative)
          ["<C-j>"] = cmp.mapping.select_next_item(),    -- Next item
          ["<C-n>"] = cmp.mapping.select_next_item(),    -- Next item (alternative)
          -- Accept completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
      })
    end,
  },

  -- ============================================================================
  -- 🌈 MODERN SYNTAX HIGHLIGHTING
  -- ============================================================================
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate", "TSInfo", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable" },
    build = ":TSUpdate",  -- Auto-update parsers when plugin updates
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Languages to auto-install parsers for
        ensure_installed = {
          "lua",          -- Neovim config files
          "vim",          -- Vim script
          "vimdoc",       -- Vim documentation
          "markdown",     -- Documentation files
          "javascript",   -- JS development
          "typescript",   -- TS development
          "tsx",          -- React/TypeScript components
          "vue",          -- Vue.js components
          "json",         -- Configuration files
          "css",          -- Stylesheets
          "html",         -- Web markup
          "python",       -- Python development
          "ruby",         -- Ruby development
        },
        -- Rainbow parentheses for better code readability
        rainbow = {
          enable = true,
          disable = { "html" },      -- Disable for HTML (can be messy)
        },
        autotag = { enable = true },  -- Auto-close HTML/XML tags
      })
    end,
  },

  -- ============================================================================
  -- 🔍 FUZZY FINDING & SEARCH
  -- ============================================================================
  {
    "junegunn/fzf",
    lazy = false,    -- Load immediately
    priority = 1000, -- High priority loading
    build = function()
      vim.fn["fzf#install"]()  -- Install/update FZF binary
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = "junegunn/fzf",
    lazy = false,    -- Load immediately for keybindings
    -- Available commands for fuzzy searching:
    cmd = { 
      "Files",    -- Find files by name
      "Rg",       -- Search text content (ripgrep)
      "Buffers",  -- Switch between open buffers
      "History",  -- Recent files
      "BLines",   -- Search lines in current buffer
      "Lines",    -- Search lines in all open buffers
      "Tags",     -- Search tags
      "Ag",       -- Search with ag (silver searcher)
      "GFiles"    -- Git-tracked files
    },
  },

  -- ============================================================================
  -- 📁 FILE TREE EXPLORER
  -- ============================================================================
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",  -- Pretty file icons
    lazy = false,    -- Load immediately to ensure commands are available
    priority = 1000, -- High priority loading
    -- Available nvim-tree commands:
    cmd = { 
      "NvimTreeToggle",             -- Show/hide tree
      "NvimTreeFocus",              -- Focus tree window
      "NvimTreeOpen",               -- Open tree
      "NvimTreeClose",              -- Close tree
      "NvimTreeRefresh",            -- Refresh tree content
      "NvimTreeFindFile",           -- Find current file in tree
      "NvimTreeFindFileToggle",     -- Toggle tree and find current file
      "NvimTreeResize",             -- Resize tree window
      "NvimTreeCollapse",           -- Collapse tree nodes
      "NvimTreeCollapseKeepBuffers" -- Collapse but keep open files expanded
    },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle floating file tree" },
      { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Find current file in tree" },
    },
    config = function()
      require("nvim-tree").setup({
        -- Basic behavior
        hijack_cursor = true,     -- DEFAULT: false
        update_cwd = true,        -- DEFAULT: false
        update_focused_file = {
          enable = true,        -- DEFAULT: false
        },
        diagnostics = {
          -- Diagnostics disabled in nvim-tree to avoid sign conflicts
          enable = false,
        },
        view = {
          float = {
            enable = true,              -- Enable floating mode (no sidebar disruption)
            quit_on_focus_loss = true,  -- Auto-close when clicking outside
            open_win_config = {
              relative = "editor",                             -- Position relative to editor
              border = "rounded",                              -- Rounded border style
              width = math.floor(vim.o.columns * 0.8),         -- 80% of screen width
              height = math.floor(vim.o.lines * 0.8),          -- 80% of screen height
              row = math.floor(vim.o.lines * 0.1),             -- Center vertically
              col = math.floor(vim.o.columns * 0.1),           -- Center horizontally
              style = "minimal",                               -- Clean appearance
            },
          },
        },
        actions = {
          open_file = {
            quit_on_open = true,  -- Close floating tree after opening file
          },
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,  -- Loaded automatically by other plugins
  },

  -- ============================================================================
  -- 🚀 QUICK NAVIGATION
  -- ============================================================================
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

  -- ============================================================================
  -- 🎯 TEXT MANIPULATION
  -- ============================================================================
  {
    "tomtom/tcomment_vim",
    keys = {
      { "gc", mode = { "n", "v" } },   -- Toggle comment (selection/motion)
      { "gcc", mode = "n" },           -- Toggle comment (current line)
      { "<C-_>", mode = { "n", "v" } }, -- Alternative comment toggle
    },
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    keys = { "cs", "ds", "ys" },  -- cs=change, ds=delete, ys=add surroundings
  },

  -- ============================================================================
  -- 📚 GIT INTEGRATION
  -- ============================================================================
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
      require('gitsigns').setup({})
    end,
  },
  -- GitHub/GitLab line links - Open current line/selection on remote
  {
    "ruanyl/vim-gh-line",
    cmd = { "GH", "GB" },  -- GH=open line, GB=open blame
    keys = {
      { "<leader>gh", mode = { "n", "v" } },  -- Open line/selection on GitHub
      { "<leader>gb", mode = { "n", "v" } },  -- Open blame view on GitHub
    },
  },

  -- ============================================================================
  -- 📝 NOTE TAKING
  -- ============================================================================
  {
    "xolox/vim-notes",
    dependencies = "xolox/vim-misc",  -- Required utility library
    cmd = { 
      "Note",                 -- Create/open notes
      "NoteFromSelectedText", -- Create note from selection
      "DeleteNote",           -- Delete notes
      "SearchNotes"           -- Search through notes
    },
  },
  {
    "xolox/vim-misc",
    lazy = true,  -- Loaded automatically by vim-notes
  },

  -- ============================================================================
  -- 🎨 COLOR THEMES
  -- ============================================================================
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

  -- ============================================================================
  -- 📊 STATUS LINE & TABLINE
  -- ============================================================================
  {
    "vim-airline/vim-airline",
    dependencies = "vim-airline/vim-airline-themes",
    event = "VeryLazy",  -- Load after initial UI setup
  },
  {
    "vim-airline/vim-airline-themes",
    lazy = true,
  },
})
