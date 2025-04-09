local actions = require("telescope.actions")
return {
  "nvim-telescope/telescope.nvim",
  keys = {

    { "<leader>gC", "<cmd>Telescope git_bcommits<CR>", desc = "Buffer Commits" },
  },
  opts = {

    extensions = {
      frecency = {
        default_workspace = "CWD",
        show_unindexed = false,
      },
    },

    pickers = {
      git_branches = {
        mappings = {
          n = {
            -- ["l"] = git_browser_actions.logs_for_branch,
          },
        },
      },
      buffers = {
        mappings = {
          n = {
            ["D"] = require("telescope.actions").delete_buffer,
          },
        },
      },
    },
    defaults = {
      path_display = { "filename_first" },
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
          ["<C-c>"] = actions.close,
        },
        n = {
          ["<C-h>"] = "which_key",
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
          ["<C-c>"] = actions.close,
          ["q"] = actions.close,
          ["<esc>"] = false,
        },
      },
    },
  },
}
