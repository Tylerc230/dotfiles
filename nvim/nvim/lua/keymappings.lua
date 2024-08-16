
vim.g.mapleader = ' '
vim.g.maplocalleader = '  '
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        g = {
            name = "git",
            b = { ':Telescope git_branches<CR>', "Git Branches" },
            s = { '<CMD>Git<CR>', "Git Status"},
            c = { '<CMD>Telescope git_status<CR>', "Git Changes" },
            h = { '<CMD>Telescope git_stash<CR>', "Git Stash"},
            l = {
                l = {  '<CMD>Telescope git_commits<CR>', "Git log" },
                b = {'<CMD>Telescope git_bcommits<CR>', "Git log (buffer)"}
            }
        },
        o = {
            o = {':ObsidianQuickSwitch<CR>', "Quick Open Note"},
            t = {':ObsidianToday<CR>', "Today's note"},
            y = {':ObsidianYesterday<CR>', "Yesterday's note"},
            c = {':ObsidianToggleCheckbox<CR>', "Toggle checkbox"}
        },
        c = {
            i = { ':call nerdcommenter#Comment(0, "Toggle")<CR>', "Toggle comment"},
            h = { ':lua require("telescope.builtin").command_history()<CR>', "Command History"},
            c = { ':lua require("telescope.builtin").commands()<CR>', "All commands"}
        },
        w = { '<CMD>lua require(\'nvim-window\').pick()<CR>', "Choose Window"},
        h = {'<C-w>h', "Window left"},
        j = {'<C-w>j', "Window down"},
        k = {'<C-w>k', "Window up"},
        l = {'<C-w>l', "Window right"},
        H = {'<C-w>H', "Move Window left"},
        J = {'<C-w>J', "Move Window down"},
        K = {'<C-w>K', "Move Window up"},
        L = {'<C-w>L', "Move Window right"},
        R = {'<cmd>Lspsaga rename<CR>', "Rename"},
        z = {
            h = { "<CMD>lua require('telescope').extensions.zsh_history.scripts()<CR>", "Zsh history"},
        },
        p = { ':Telescope neoclip<CR>', "Clipboard history"},
        i = {"V=<ESC>", "Indent line"},
        I = { 'gg=G', "Indent file"},
        n = { '<cmd>Legendary<CR>', "Command Pallete" },
        v = { '<Cmd>exe v:count1 . "ToggleTerm"<CR>', "Open Term" },
        ["/"] = { ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', "Grep Files"},
        ["*"] = { ':Telescope grep_string prompt_prefix=🔍<CR>'},
        f = {
            t = { ':Telescope find_files<CR>', "Find Files"},
            r = { ':Telescope frecency workspace=CWD<CR>', "Recent Files"},
            b = { ':Telescope buffers<CR>', "Find Buffers"},
            f = { '<CMD>NvimTreeToggle<CR>', "Open NVimTree"},
            F = { '<CMD>NvimTreeFindFile<CR>', "Open File in NVimTree"},
        },
        ["<leader>"] = {
            w = {'<cmd>HopWord<CR>', "Hop Word"},
            l = { '<cmd>HopLine<CR>', "Hop Line"},
            ["/"] = { '<CMD>let @/=""<CR>', "Clear search"},
        }
    },
    g = {
        d = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition"},
        t = {"<Cmd>lua vim.diagnostic.open_float()<CR>", "Show error at line"},
        T = { '<cmd>Telescope diagnostics<CR>', "List all diagnostics in workspace"},
        i = {"<Cmd>lua vim.lsp.buf.hover()<CR>", "Get info"},
        f = {'<Cmd>Lspsaga code_action<CR>', "Select code action"},-- This duplicates go to file
        r = {'<cmd>Telescope lsp_references<CR>', "Show symbol references"},
        m = {'<cmd>Telescope lsp_document_symbols<CR>', "Search symbols in doc"},
        a = { '<Cmd>Lspsaga finder<CR>', "Show all references and definitions in list"},
        s = { ':Telescope lsp_dynamic_workspace_symbols<CR>', "Search symbols in workspace"}

    },
    ['<C-right>'] = { ':vertical resize +5<cr>', "Increase width"},
    ['<C-left>'] = { ':vertical resize -5<cr>', "Decrease width"},
    ['<C-up>'] = {  ':resize +5<cr>', "Increase Height"},
    ['<C-down>'] = {  ':resize -5<cr>', "Decrease Height"},
})

wk.register({
    ["<leader>"] = {
        ["<leader>"] = {
            w = {'<cmd>HopWord<CR>', "Hop Word"},
            l = { '<cmd>HopLine<CR>', "Hop Line"},
        },
        i = {'=', "Indent"},
        c = {
            i = { ':call nerdcommenter#Comment(0, "Toggle")<CR>', "Toggle comment"}
        },
    }
}, {mode = "v"})
-- Add mappings for gnn/grc (increase node selection using treesitter)
local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
map('n', '<leader><leader>j', '<CMD>Telescope neorg search_headings<CR>', options)
map('n', '<C-y>', ':ClangdSwitchSourceHeader<cr>', options)
