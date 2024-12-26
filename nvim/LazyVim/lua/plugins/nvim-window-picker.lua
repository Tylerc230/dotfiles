return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    opt = {
      show_prompt = false,
    },
    config = function()
      require'window-picker'.setup({
        show_prompt = false,
        filter_rules = {
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { 'notify' },

          },
        },
        highlights = {
          statusline = {
            unfocused = {
              fg = '#ededed',
              bg = '#444444',
              bold = true,
            },
          },
          winbar = {
            unfocused = {
              fg = '#ededed',
              bg = '#444444',
              bold = true,
            },
          },
        },
      })
    end,
    keys = {
      {"<leader>ww", "<cmd>lua vim.api.nvim_set_current_win(require('window-picker').pick_window())<CR>"}

    }
  }
}
