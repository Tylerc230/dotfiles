local actions = require("telescope.actions")
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
          ["<Down>"] = actions.cycle_history_next,
          ["<Up>"] = actions.cycle_history_prev,
          ["<C-c>"] = actions.close,
        },
        n = {
          ["<C-h>"] = "which_key",
          ["<Down>"] = actions.cycle_history_next,
          ["<Up>"] = actions.cycle_history_prev,
          ["<C-c>"] = actions.close,
          ["q"] = actions.close,
          ["<esc>"] = false,
        },
      },
    },
  },
}
