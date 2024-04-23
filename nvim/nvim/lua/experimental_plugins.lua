return {
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
        "nvim-telescope/telescope-project.nvim",
        config = function()
            local project_actions = require("telescope._extensions.project.actions")
            require('telescope').setup {
                extensions = {
                    project = {
                        base_dirs = {
                        },
                        hidden_files = true, -- default: false
                        theme = "dropdown",
                        order_by = "asc",
                        search_by = "title",
                        sync_with_nvim_tree = true, -- default false
                        -- default for on_project_selected = find project files
                        on_project_selected = function(prompt_bufnr)
                            -- Do anything you want in here. For example:
                            project_actions.change_working_directory(prompt_bufnr, false)
                            require("harpoon.ui").nav_file(1)
                        end
                    }
                }
            }
        end
    },
    --{
        --"doctorfree/cheatsheet.nvim",
        --event = "VeryLazy",
        --dependencies = {
            --{ "nvim-telescope/telescope.nvim" },
            --{ "nvim-lua/popup.nvim" },
            --{ "nvim-lua/plenary.nvim" },
        --},
        --config = function()
            --local ctactions = require("cheatsheet.telescope.actions")
            --require("cheatsheet").setup({
                --bundled_cheetsheets = false,
                --bundled_plugin_cheatsheets = false,
                --include_only_installed_plugins = true,
                --telescope_mappings = {
                    --["<CR>"] = ctactions.select_or_fill_commandline,
                    --["<A-CR>"] = ctactions.select_or_execute,
                    --["<C-Y>"] = ctactions.copy_cheat_value,
                    --["<C-E>"] = ctactions.edit_user_cheatsheet,
                --},
            --})
        --end,
    --},
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
}
