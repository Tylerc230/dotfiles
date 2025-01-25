local actions = require("telescope.actions")
return {
  "nvim-telescope/telescope.nvim",
  keys = {

      { "<leader>gC", "<cmd>Telescope git_bcommits<CR>", desc = "Buffer Commits" },
  },
  opts = {
    defaults = {
      path_display = { "smart" },
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
