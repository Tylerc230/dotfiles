local function choose_win()
  return function()
    local window_id = require("window-picker").pick_window()
    if window_id == nil then
      return
    end
    vim.api.nvim_set_current_win(window_id)
  end
end

local function close_win()
  return function()
    local window_id = require("window-picker").pick_window({ filter_rules = { autoselect_one = false } })
    if window_id == nil then
      return
    end
    vim.api.nvim_win_close(window_id, false)
  end
end
return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    opt = {
      show_prompt = false,
    },
    config = function()
      require("window-picker").setup({
        show_prompt = false,
        filter_rules = {
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "notify" },
            buftype = {},--remote 'termainal'
          },
        },
      })
    end,
    keys = {
      { "<leader>ww", choose_win() },
      { "<leader>wd", close_win() },
    },
  },
}
