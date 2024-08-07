local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local action_state = require("telescope.actions.state")
local terms = require("toggleterm.terminal")
local lazy = require("toggleterm.lazy")
local ui = lazy.require("toggleterm.ui")
local commandline = lazy.require("toggleterm.commandline")
local fn = vim.fn
local api = vim.api

local toggleterm =  require'toggleterm'
local command = api.nvim_create_user_command
command(
    "TermEdit",
    function(opts)
        local num = (opts.count and opts.count >= 1) and opts.count or terms.get_toggled_id()
        -- only works when terminal alredy open, else it creates the wrong one
        local term = terms.get_or_create_term(num)
        local parsed = require("toggleterm.commandline").parse(opts.args)
        if not term:is_open() then term:open(parsed.size, parsed.direction) end
        local original_send = term.send
        term.send = function(self, cmd, go_back)
        cmd = type(cmd) == "table" and table.concat(cmd, "") or cmd
        fn.chansend(self.job_id, cmd)
        self:scroll_bottom()
        if go_back and self:is_focused() then
            ui.goto_previous()
            ui.stopinsert()
        elseif not go_back and not term:is_focused() then
            self:focus()
        end
    end

        toggleterm.exec_command(opts.args, opts.count)
        term.send = original_send
    end,
    { count = true, complete = commandline.term_exec_complete, nargs = "*" }
)

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
return require('telescope').register_extension {
    exports = {
        scripts = function(opts)
            opts = opts or {}
            local hist_list = [[
            /bin/zsh --login -c "export HISTFILE=~/.zsh_history; export HISTSIZE=500000; fc -R && fc -lrf 0"
            ]]
            local handle = io.popen(hist_list)
            local result = handle:read("*a")
            handle:close()
            local commands = {}
            local commandNumberMap = {}
            for s in result:gmatch("[^\r\n]+") do
                for number, date, time, command in s:gmatch(" *([0-9]+)  ([^%s]*) ([^%s]*)  (.*)") do
                    if commandNumberMap[command] == nil then
                        table.insert(commands, {
                            number = number,
                            date = date,
                            time = time,
                            command = command
                        })
                        commandNumberMap[command] = number
                    end
                end
            end
            --preivew of command around selected would be nice (how since we dedupe?)
            pickers.new(opts, {
                prompt_title = 'Commands',
                finder = finders.new_table {
                    results = commands,
                    entry_maker = function(command)
                        local display = string.format("%s %s %s", command.number, command.date, command.command)
                        return {
                            value = command,
                            display = display,
                            text = display,
                            ordinal = display,
                        }
                    end
                },
                sorter = sorters.get_substr_matcher(),
                attach_mappings = function(prompt_bufnr, map)
                    local current_term_buffer = function() 
                        local last_term_buffer = vim.g["last_term_number"]
                        if last_term_buffer == nil then
                            return 1
                        end
                        return last_term_buffer
                    end
                    local execute_command = function()
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        toggleterm.exec(selection.value.command, current_term_buffer());
                        --local command = current_term_buffer() .. "TermExec cmd='" .. selection.value.command .. "'"
                        --print(command)
                        --print(selection.value.command)
                        --vim.cmd(command)
                    end

                    local edit_command = function()
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        local command = current_term_buffer() .. "TermEdit cmd='" .. selection.value.command .. "'"
                        vim.cmd(command)
                    end

                    local yank_command = function()
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.api.nvim_call_function("setreg", {"+", selection.value.command})
                    end

                    local save_term_number = function(term_number)
                        return function()
                            vim.g["last_term_number"] = term_number
                        end
                    end


                    map('n', '<CR>', execute_command)
                    map('i', '<CR>', execute_command)
                    map('n', 'e', edit_command)
                    map('n', 'y', yank_command)
                    map('n', '1', save_term_number(1))
                    map('n', '2', save_term_number(2))
                    map('n', '3', save_term_number(3))
                    map('n', '4', save_term_number(4))
                    map('n', '5', save_term_number(5))
                    map('n', '6', save_term_number(6))
                    map('n', '7', save_term_number(7))
                    map('n', '8', save_term_number(8))

                    return true
                end
            }):find()
        end
    }
}
