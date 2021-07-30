local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local previewers = require "telescope.previewers"
local utils = require "telescope.utils"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values
return require('telescope').register_extension {
    exports = {
        run_logs_for_branch = function(opts)
            opts = opts or {}
            local results = utils.get_os_command_output({
                "git",
                "log",
                "--pretty=oneline",
                "--abbrev-commit",
                opts.branch
            }, opts.cwd)

            pickers.new(opts, {
                prompt_title = "Git Commits on Branch: "..opts.branch,
                finder = finders.new_table {
                    results = results,
                    entry_maker = opts.entry_maker or make_entry.gen_from_git_commits(opts),
                },
                previewer = {
                    previewers.git_commit_diff_to_parent.new(opts),
                    previewers.git_commit_diff_to_head.new(opts),
                    previewers.git_commit_diff_as_was.new(opts),
                    previewers.git_commit_message.new(opts),
                },
                sorter = conf.file_sorter(opts),
                attach_mappings = function()
                    actions.select_default:replace(actions.git_checkout)
                    return true
                end,
            }):find()
        end
    }
}
