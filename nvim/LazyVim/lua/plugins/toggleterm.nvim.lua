return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    version = '*',
    keys = {
      { "<leader>v", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', desc = "Open Term" },
    },
    config = function()
      require("toggleterm").setup {
        start_in_insert = false,
      }
    end
}
}
