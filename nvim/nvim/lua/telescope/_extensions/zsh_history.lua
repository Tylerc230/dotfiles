local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')

local no_sort_filter = function(opts)
    opts = opts or {}
    opts.ngram_len = 2

    -- TODO: Probably could use a better sorter here.
    local fuzzy_sorter = sorters.get_generic_fuzzy_sorter(opts)

    return sorters.Sorter:new {
        scoring_function = function(_, prompt, _, entry)
            local base_score = fuzzy_sorter:score(prompt, entry)

            if base_score == -1 then
                return -1
            end
            return 0 --entry.index
        end
    }
end
function commandAndNumber(line) 
    line:gmatch(" *([0-9]+)  .*  (.*)")
end

return require('telescope').register_extension {
    exports = {
        scripts = function(opts)
            opts = opts or {}
            local handle = io.popen("hist_list.sh")
            local result = handle:read("*a")
            handle:close()
            local commands = {}
            local commandNumberMap = {}
            local lines = {}
            for s in result:gmatch("[^\r\n]+") do
                table.insert(lines, s)
                for number, command in s:gmatch(" *([0-9]+)  .*  (.*)") do
                    if commandNumberMap[command] == nil then
                        table.insert(commands, command)
                        commandNumberMap[command] = number
                    end
                end
            end
            pickers.new(opts, {
                prompt_title = 'Commands',
                finder = finders.new_table {
                    results = lines
                },
                sorter = sorters.get_substr_matcher(),
                attach_mappings = function(prompt_bufnr, map)
                    local execute_command = function()
                        local selection = actions.get_selected_entry(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        local command = 'T ' .. selection.value
                        vim.cmd(command)
                    end

                    local edit_command = function()
                        local selection = actions.get_selected_entry(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        local command = 'T !' .. commandNumberMap[selection.value]
                        vim.cmd(command)
                    end

                    local yank_command = function()
                        local selection = actions.get_selected_entry(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        vim.api.nvim_exec("let @+ = '"..selection.value.."'", false)
                    end


                    map('n', '<CR>', execute_command)
                    map('i', '<CR>', execute_command)
                    map('n', 'e', edit_command)
                    map('n', 'y', yank_command)

                    return true
                end
            }):find()
        end
    }
}
