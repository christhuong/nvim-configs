local M = {}

function M.config()
  local status_ok, nvimtree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  local width = math.floor(screen_w)
  local height = math.floor(screen_h)

  nvimtree.setup {
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
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
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
      -- float = {
      --   enable = true,
      --   quit_on_focus_loss = true,
      --   open_win_config = {
      --     width = width,
      --     height = height,
      --     relative = "editor",
      --   }
      -- },
      adaptive_size = true,
      preserve_window_proportions = true,
      hide_root_folder = false,
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
  }
end

return M
