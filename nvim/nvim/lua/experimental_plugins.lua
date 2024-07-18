return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = false,
        ft = "markdown",
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
            workspaces = {
                --{
                --name = "personal",
                --path = "~/Documents/Personal",
                --},
                {
                    name = "work",
                    path = "~/Documents/WorkVault/",
                },
            },

            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "dailies",
            },
            follow_url_func = function(url)
                vim.fn.jobstart({"open", url})  -- Mac OS
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
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = {
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        'mrjones2014/legendary.nvim',
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        version = 'v2.13.9',
        priority = 10000,
        lazy = false,
        config = function()
            require('legendary').setup({
                include_builtin = false,
                include_legendary_cmds = false,
                commands = {
                    {
                        ':ObsidianSearch {query}',
                        description = 'Search for text in workspace. ',
                    },
                    {
                        ':ObsidianNew',
                        description = 'Create new note',
                    },
                    {
                        ':ObsidianOpen',
                        description = 'Open current note in obsidian app',
                    },
                    {
                        ':ObsidianQuickSwitch',
                        description = 'Switch to different note',
                    },
                    {
                        ':ObsidianToday',
                        description = 'Open today\'s journal',
                    },
                    {
                        ':ObsidianYesterday',
                        description = 'Open yesterdays\'s journal (weekdays only)',
                    },
                    {
                        ':ObsidianDailies {range}',
                        description = 'Open list of notes. range -2 1 = tomorrow to 2 days ago',
                        unfinished = true
                    },
                    {
                        ':ObsidianPasteImg [image_name]',
                        description = 'Paste image from clipboard into note ',
                        unfinished = true
                    },
                    {
                        ':ObsidianToggleCheckbox',
                        description = 'Toggle the current checkbox',
                    },
                    {
                        ':ObsidianLink',
                        description = 'Link to existing file (in visual)',
                    },
                    {
                        ':ObsidianLinkNew',
                        description = 'Link to new file (selected text becomes note title an link title)',
                    },
                    {
                        ':NoiceDismiss',
                        description = 'Dismiss all notifications',
                    },
                    {
                        ':GBrowse',
                        description = 'find file in code.amazon.com',
                    }

                }
            })
        end
        -- sqlite is only needed if you want to use frecency sorting
        -- dependencies = { 'kkharji/sqlite.lua' }
    },
    {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = { config = { icon_preset = "diamond" } },
                    ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
                    ["core.integrations.nvim-cmp"] = {},
                    ["core.qol.todo_items"] = {},
                    ["core.summary"] = {},
                    ["core.export"] = {},
                    ["core.integrations.telescope"] = {},
                    --["core.ui.calendar"] = {},
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                dotfiles = "~/dotfiles/notes",
                                notes = "~/notes",
                            },
                            default_workspace = "notes",
                        },

                    },
                    ["core.keybinds"] = {
                        -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
                        config = {
                            default_keybinds = true,
                            neorg_leader = "<LocalLeader>",
                        },
                    },
                },
            }
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", "luarocks.nvim" },
        lazy = false,
        version = "*"
    },
    {
        "AckslD/nvim-neoclip.lua",
        requires = {
            {'nvim-telescope/telescope.nvim'},
        },
        config = function()
            require('neoclip').setup()
        end,
    },
    {
        "levouh/tint.nvim",
        config = function()
            require("tint").setup()
        end
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    { url = "ssh://git.amazon.com:2222/pkg/Vim-code-browse" },
}
