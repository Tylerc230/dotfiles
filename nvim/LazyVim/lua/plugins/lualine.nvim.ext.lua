local icons = LazyVim.config.icons
-- Could also return function(opts) and replace the last element in opts.sections.lualine_c
return {
  "nvim-lualine/lualine.nvim",
  opts = {
  options = {
      globalstatus = false,
    },
    sections = {
      lualine_c = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path({length = 0}) },
      },
    },
  },
}
