-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.api.nvim_set_hl(0, "WindowPickerStatusLine", { link = "Search" })
vim.api.nvim_set_hl(0, "WindowPickerWinBar", { link = "Search" })
vim.api.nvim_set_hl(0, "WindowPickerStatusLineNC", { link = "DiffDelete" })
vim.api.nvim_set_hl(0, "WindowPickerWinBarNC", { link = "DiffDelete" })
vim.opt.fixeol = false
vim.opt.swapfile = false

local amazon_root = function(buf)
  local paths = LazyVim.root.detectors.pattern(buf, "packageInfo")
  for i, path in ipairs(paths) do
    paths[i] = path .. "/src"
  end
  return paths
end
vim.g.root_spec = { amazon_root, "lsp", { ".git", "lua" }, "cwd" }
vim.lsp.set_log_level("debug") -- temp
