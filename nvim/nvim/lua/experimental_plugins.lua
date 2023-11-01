return {
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
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
}
