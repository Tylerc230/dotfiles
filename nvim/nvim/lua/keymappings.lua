
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
        w = { '<CMD>lua require(\'nvim-window\').pick()<CR>', "Choose Window"},
        h = {'<C-w>h', "Window left"},
        j = {'<C-w>j', "Window down"},
        k = {'<C-w>k', "Window up"},
        l = {'<C-w>l', "Window right"},
        H = {'<C-w>H', "Window left"},
        J = {'<C-w>J', "Window down"},
        K = {'<C-w>K', "Window up"},
        L = {'<C-w>L', "Window right"},
        f = {
            t = { ':Telescope find_files<CR>', "Find Files"},
            r = { ':Telescope frecency workspace=CWD<CR>', "Recent Files"},
            ["/"] = { ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', "Grep Files"},
            b = { ':Telescope buffers<CR>', "Find Buffers"},
            ["*"] = { ':Telescope grep_string prompt_prefix=🔍<CR>'},
            f = { '<CMD>NvimTreeToggle<CR>', "Open NVimTree"},
            F = { '<CMD>NvimTreeFindFile<CR>', "Open File in NVimTree"},
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

    }
})

local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
-- better window movement
--map('n', '<leader>h', '<C-w>h', options)
--map('n', '<leader>j', '<C-w>j', options)
--map('n', '<leader>k', '<C-w>k', options)
--map('n', '<leader>l', '<C-w>l', options)
--map('n', '<leader>H', '<C-w>H', options)
--map('n', '<leader>J', '<C-w>J', options)
--map('n', '<leader>K', '<C-w>K', options)
--map('n', '<leader>L', '<C-w>L', options)


--map('n', '<leader>t', ':Telescope find_files<CR>', options)
--map('n', '<leader>r', ':Telescope frecency workspace=CWD<CR>', options)

--map('n', '<leader>/', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', options)
--map('n', '<leader>*', ':Telescope grep_string prompt_prefix=🔍<CR>', options)
--map('n', '<leader>b', ':Telescope buffers<CR>', options)
--map('n', '<leader>gb', ':Telescope git_branches<CR>', options)
map('n', '<leader>p', ':Telescope neoclip<CR>', options)
map('n', '<leader>ch', ':lua require("telescope.builtin").command_history()<CR>', options)
--map('n', '<leader>f', '<CMD>NvimTreeToggle<CR>', options)
--map('n', '<leader>F', '<CMD>NvimTreeFindFile<CR>', options)
--map('n', '<leader>w', '<CMD>lua require(\'nvim-window\').pick()<CR>', options)
--map('n', '<leader>gs', '<CMD>Neogit<CR>', options)
--map('n', '<leader>gs', '<CMD>Git<CR>', options)
--map('n', '<leader>gh', '<CMD>Telescope git_stash<CR>', options)
--map('n', '<leader>gll', '<CMD>Telescope git_commits<CR>', options)
--map('n', '<leader>glL', '<CMD>Telescope git_bcommits<CR>', options)
--map('n', '<leader>gc', '<CMD>Telescope git_status<CR>', options)
map('n', '<leader><leader>/', '<CMD>let @/=""<CR>', options)
map('n', '<leader><leader>j', '<CMD>Telescope neorg search_headings<CR>', options)
map('n', '<leader>ci', ':call nerdcommenter#Comment(0, "Toggle")<CR>', options)
map('v', '<leader>ci', ':call nerdcommenter#Comment(0, "Toggle")<CR>', options)
map('n', '<leader>i', 'V=<ESC>', options)
map('n', '<leader>I', 'gg=G', options)
map('v', '<leader>i', '=', options)
map('n', '<leader>v', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', options)
--map('n', '<leader>n', '<CMD>vert Tnew<CR>', options)
map('n', '<leader>zh', "<CMD>lua require('telescope').extensions.zsh_history.scripts()<CR>", options)
map('n', '<leader><leader>w', '<cmd>HopWord<CR>', options)
map('n', '<leader><leader>l', '<cmd>HopLine<CR>', options)
map('v', '<leader><leader>w', '<cmd>HopWord<CR>', options)
map('v', '<leader><leader>l', '<cmd>HopLine<CR>', options)
map('n', '<leader>n', '<cmd>Legendary<CR>', options)

--map('n', '<leader>s', ':Telescope lsp_dynamic_workspace_symbols<CR>', options)
--map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
--map('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', options)
map('n', '<leader>R', '<cmd>Lspsaga rename<CR>', options)
-- add all these to a menu https://nvimdev.github.io/lspsaga/
--map('n', 'gi', '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
--map('n', 'gt', '<Cmd>TroubleToggle lsp_document_diagnostics<CR>', options)
--map('n', 'gt', '<Cmd>Lspsaga show_line_diagnostics<CR>', options)
--map('n', 'gt', '<Cmd>lua vim.diagnostic.open_float()<CR>', options)

--map('n', '<leader>gf', '<Cmd>Lspsaga code_action<CR>', options)
--map('n', '<leader>a', '<Cmd>Lspsaga finder<CR>', options)
--map('n', '<leader>gt', '<Cmd>TroubleToggle<CR>', options)
--map('n', '<leader>m', '<cmd>Telescope lsp_document_symbols<CR>', options)
--map('n', '<leader>k', '<cmd>Lspsaga incoming_calls<CR>', options)-- need to find a new key for this
--map("n", "<space>i", "<cmd>lua vim.lsp.buf.formatting()<CR>", options)
--map('n', '<leader>D', '<cmd>Telescope diagnostics<CR>', options)

--" resize current buffer by +/- 5 
--:
map('n', '<C-right>', ':vertical resize +5<cr>', options)
map('n', '<C-left>', ':vertical resize -5<cr>', options)
map('n', '<C-up>', ':resize +5<cr>', options)
map('n', '<C-down>', ':resize -5<cr>', options)
map('n', '<C-y>', ':ClangdSwitchSourceHeader<cr>', options)
