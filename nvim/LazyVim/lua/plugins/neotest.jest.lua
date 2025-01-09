return {
  {
    "nvim-neotest/neotest-jest",
    config = function()
      LazyVim.on_load("neotest", function()
        require("neotest-jest")({
          jestCommand = "jest",
        })
      end)
    end,
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = { "neotest-jest" },
      log_level = vim.log.levels.DEBUG, -- Set the log level
    },
  },
}
