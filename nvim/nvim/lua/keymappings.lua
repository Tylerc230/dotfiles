
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
        c = {
            i = { ':call nerdcommenter#Comment(0, "Toggle")<CR>', "Toggle comment"},
            h = { ':lua require("telescope.builtin").command_history()<CR>', "Command History"}
        },
        w = { '<CMD>lua require(\'nvim-window\').pick()<CR>', "Choose Window"},
        h = {'<C-w>h', "Window left"},
        j = {'<C-w>j', "Window down"},
        k = {'<C-w>k', "Window up"},
        l = {'<C-w>l', "Window right"},
        H = {'<C-w>H', "Window left"},
        J = {'<C-w>J', "Window down"},
        K = {'<C-w>K', "Window up"},
        L = {'<C-w>L', "Window right"},
        R = {'<cmd>Lspsaga rename<CR>', "Rename"},
        z = {
            h = { "<CMD>lua require('telescope').extensions.zsh_history.scripts()<CR>", "Zsh history"},
        },
        p = { ':Telescope neoclip<CR>', "Clipboard history"},
        i = {"V=<ESC>", "Indent line"},
        I = { 'gg=G', "Indent file"},
        n = { '<cmd>Legendary<CR>', "Command Pallete" },
        v = { '<Cmd>exe v:count1 . "ToggleTerm"<CR>', "Open Term" },
        f = {
            t = { ':Telescope find_files<CR>', "Find Files"},
            r = { ':Telescope frecency workspace=CWD<CR>', "Recent Files"},
            ["/"] = { ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', "Grep Files"},
            b = { ':Telescope buffers<CR>', "Find Buffers"},
            ["*"] = { ':Telescope grep_string prompt_prefix=🔍<CR>'},
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
        f = {'<Cmd>Lspsaga code_action<CR>', "Select code action"},
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

local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
--map('n', '<leader>p', ':Telescope neoclip<CR>', options)
--map('n', '<leader>ch', ':lua require("telescope.builtin").command_history()<CR>', options)
--map('n', '<leader><leader>/', '<CMD>let @/=""<CR>', options)
map('n', '<leader><leader>j', '<CMD>Telescope neorg search_headings<CR>', options)
--map('n', '<leader>ci', ':call nerdcommenter#Comment(0, "Toggle")<CR>', options)
--map('v', '<leader>ci', ':call nerdcommenter#Comment(0, "Toggle")<CR>', options)
--map('n', '<leader>i', 'V=<ESC>', options)
--map('n', '<leader>I', 'gg=G', options)
--map('n', '<C-right>', ':vertical resize +5<cr>', options)
--map('n', '<C-left>', ':vertical resize -5<cr>', options)
--map('n', '<C-up>',  w, options)
--map('n', '<C-down>', ':resize -5<cr>', options)
map('n', '<C-y>', ':ClangdSwitchSourceHeader<cr>', options)
