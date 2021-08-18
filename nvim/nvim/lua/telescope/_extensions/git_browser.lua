local actions = require('telescope.actions')
local action_set = require('telescope.actions.set')
local action_state = require('telescope.actions.state')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local previewers = require "telescope.previewers"
local utils = require "telescope.utils"
local putils = require "telescope.previewers.utils"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values
local Path = require "plenary.path"
local pfiletype = require "plenary.filetype"

local function git_show_command(opts)
    local cf = opts.current_file and Path:new(opts.current_file):make_relative(opts.cwd)
    local value = opts.commit_sha .. ":" .. cf
    return { "git", "--no-pager", "show", value }
end

local function preview_file_at_commit(prompt_bufnr, type, opts)
    local entry = action_state.get_selected_entry()
    opts.current_file = entry.value
    local cmd = git_show_command(opts)
    local file_version = opts.commit_sha..":"..entry.value
    local results = utils.get_os_command_output(cmd, opts.cwd)
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

local preview_git_file =  utils.make_default_callable(function (opts)
    return previewers.new_buffer_previewer {
        title = "Git File Preview",
        dynamic_title = function(self, entry)
            return "Git File: "..entry.value.." @ "..opts.commit_sha
        end,
        define_preview = function(self, entry, _)
            local lopts = vim.deepcopy(opts)
            lopts.current_file = entry.value
            local cmd = git_show_command(lopts)
            putils.job_maker(cmd, self.state.bufnr, {
                value = entry.value,
                bufname = self.state.bufname,
                cwd = opts.cwd,
                callback = function(bufnr)
                end
            })
            local ft = pfiletype.detect(entry.value)
            putils.highlighter(self.state.bufnr, ft)
        end
    }
end, {})

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
        previewer =  preview_git_file.new(opts) ,
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
