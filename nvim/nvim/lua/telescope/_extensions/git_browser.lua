local actions = require('telescope.actions')
local action_set = require('telescope.actions.set')
local action_state = require('telescope.actions.state')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local previewers = require "telescope.previewers"
local utils = require "telescope.utils"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values

local function preview_file_at_commit(prompt_bufnr, type, opts)
    --vnew|execute "0r !date" |setlocal noma|setlocal ro
    --nvim_get_current_buf()                                
    --print(vim.api.nvim_create_buf(1, 1))
    local entry = action_state.get_selected_entry()
    local file_version = opts.commit_sha..":"..entry.value
    local results = utils.get_os_command_output({
        "git", 
        "show", 
        file_version
    }, opts.cwd)
    local buffer_handle = vim.api.nvim_create_buf(1,1)
    vim.api.nvim_buf_set_lines(buffer_handle, 0, 0, 0, results)
    vim.api.nvim_buf_set_name(buffer_handle, file_version)
    entry.bufnr = buffer_handle
    local cmd = action_state.select_key_to_edit_key(type)
    action_set.edit(prompt_bufnr, cmd)
    vim.cmd("filetype detect")
    vim.opt_local.readonly = true
    vim.opt_local.modifiable = false 
end

local function run_files_for_commit(opts)
    opts = opts or {}
    local commit_sha = utils.get_default(opts.commit_sha, utils.get_default(opts.branch, "HEAD"))
    pickers.new(opts, {
        prompt_title = "Files at :"..commit_sha,
        finder = finders.new_oneshot_job(
            {
                "git",
                "ls-tree",
                "--name-only",
                "-r",
                commit_sha
            },
            opts
        ),
        previewer = conf.file_previewer(opts),
        sorter = conf.file_sorter(opts),
        attach_mappings = function() 
            action_set.select:replace(function(prompt_bufnr, type)
                preview_file_at_commit(prompt_bufnr, type, opts)

            end)
            return true
        end


    }):find()
end
local function run_logs_for_branch(opts)
    opts = opts or {}
    opts.branch = utils.get_default(opts.branch, "HEAD")
    local results = utils.get_os_command_output({
        "git",
        "log",
        "--pretty=oneline",
        "--abbrev-commit",
        opts.branch
    }, opts.cwd)

    pickers.new(opts, {
        prompt_title = "Commits on: "..opts.branch,
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
            action_set.select:replace(function()
                local entry = action_state.get_selected_entry()
                opts.commit_sha = entry.value
                run_files_for_commit(opts)

            end)
            return true
        end,
    }):find()
end
return require('telescope').register_extension {
    exports = {
        run_logs_for_branch = run_logs_for_branch,
        run_files_for_commit = run_files_for_commit
    }
}
