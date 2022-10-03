local M = {}

function M.config()
  local status_ok, nvimtree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

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
    ignore_ft_on_setup = {
      "dashboard",
      "startify",
      "alpha",
    },
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      side = "left",
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
