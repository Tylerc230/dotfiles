return {
  "LintaoAmons/bookmarks.nvim",
    keys = {
    { "<leader>mm", ":BookmarksMark<CR>", desc = "Mark bookmark" },
    { "<leader>mt", ":BookmarksTree<CR>", desc = "Bookmark tree" },
  },
  -- pin the plugin at specific version for stability
  -- backup your bookmark sqlite db when there are breaking changes
  -- tag = "v2.3.0",
  dependencies = {
    { "kkharji/sqlite.lua" },
    { "nvim-telescope/telescope.nvim" },
    { "stevearc/dressing.nvim" }, -- optional: better UI
  },
  opts = {}
}
