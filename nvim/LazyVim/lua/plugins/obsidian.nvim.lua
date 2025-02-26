return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    keys = {
      { "<leader>oo", ":ObsidianQuickSwitch<CR>", "Quick Open Note" },
      { "<leader>ot", ":ObsidianToday<CR>", "Today's note" },
      { "<leader>oy", ":ObsidianYesterday<CR>", "Yesterday's note" },
      { "<leader>oc", ":ObsidianToggleCheckbox<CR>", "Toggle checkbox" },
      { "<leader>os", ":ObsidianSearch<CR>", "Search notes" },
      { "<leader>od", ":ObsidianDailies -14<CR>", "Open dailies list" },
      { "<leader>ss", ":ObsidianTOC<CR>", "Obsidian TOC", ft = "markdown" },
    },
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      ui = {
        enable = false,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
        },
        --{
        --name = "work",
        --path = "~/Documents/WorkVault/",
        --},
      },

      templates = {
        folder = "Templates",
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "dailies",
        template = "DailyTemplate.md",
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url }) -- Mac OS
      end,

      follow_img_func = function(url)
        vim.fn.jobstart({ "open", url }) -- Mac OS
      end,
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

    },
    lazy = true,
  },
}
