local map = vim.api.nvim_set_keymap
-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = '  '
local options = {noremap = true, silent = true}
-- better window movement
map('n', '<leader>h', '<C-w>h', options)
map('n', '<leader>j', '<C-w>j', options)
map('n', '<leader>k', '<C-w>k', options)
map('n', '<leader>l', '<C-w>l', options)
map('n', '<leader>H', '<C-w>H', options)
map('n', '<leader>J', '<C-w>J', options)
map('n', '<leader>K', '<C-w>K', options)
map('n', '<leader>L', '<C-w>L', options)


map('n', '<leader>t', ':Telescope find_files<CR>', options)
map('n', '<leader>r', ':Telescope frecency workspace=CWD<CR>', options)

map('n', '<leader>/', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', options)
map('n', '<leader>*', ':Telescope grep_string prompt_prefix=🔍<CR>', options)
map('n', '<leader>b', ':Telescope buffers<CR>', options)
map('n', '<leader>gb', ':Telescope git_branches<CR>', options)
map('n', '<leader>p', ':Telescope neoclip<CR>', options)
map('n', '<leader>ch', ':lua require("telescope.builtin").command_history()<CR>', options)
map('n', '<leader>f', '<CMD>NvimTreeToggle<CR>', options)
map('n', '<leader>F', '<CMD>NvimTreeFindFile<CR>', options)
map('n', '<leader>w', '<CMD>ChooseWin<CR>', options)
--map('n', '<leader>gs', '<CMD>Neogit<CR>', options)
map('n', '<leader>gs', '<CMD>Git<CR>', options)
map('n', '<leader>gh', '<CMD>Telescope git_stash<CR>', options)
map('n', '<leader>gll', '<CMD>Telescope git_commits<CR>', options)
map('n', '<leader>glL', '<CMD>Telescope git_bcommits<CR>', options)
map('n', '<leader>gc', '<CMD>Telescope git_status<CR>', options)
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
map('n', '<leader><leader>c', '<cmd>HopChar1<CR>', options)
map('v', '<leader><leader>c', '<cmd>HopChar1<CR>', options)
map('o', '<leader><leader>c', 'v<cmd>HopChar1<CR>', options)--can type d<leader><leader>c<char> to jump to char

map('n', '<leader>s', ':Telescope lsp_dynamic_workspace_symbols<CR>', options)
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
map('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', options)
map('n', '<leader>R', '<cmd>Lspsaga rename<CR>', options)
-- add all these to a menu https://nvimdev.github.io/lspsaga/
map('n', 'gi', '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
--map('n', 'gt', '<Cmd>TroubleToggle lsp_document_diagnostics<CR>', options)
--map('n', 'gt', '<Cmd>Lspsaga show_line_diagnostics<CR>', options)
map('n', 'gt', '<Cmd>lua vim.diagnostic.open_float()<CR>', options)

map('n', '<leader>gf', '<Cmd>Lspsaga code_action<CR>', options)
map('n', '<leader>a', '<Cmd>Lspsaga finder<CR>', options)
--map('n', '<leader>gt', '<Cmd>TroubleToggle<CR>', options)
map('n', '<leader>m', '<cmd>Telescope lsp_document_symbols<CR>', options)
--map('n', '<leader>k', '<cmd>Lspsaga incoming_calls<CR>', options)-- need to find a new key for this
--map("n", "<space>i", "<cmd>lua vim.lsp.buf.formatting()<CR>", options)
map('n', '<leader>D', '<cmd>Telescope diagnostics<CR>', options)

--" resize current buffer by +/- 5 
--:
map('n', '<C-right>', ':vertical resize +5<cr>', options)
map('n', '<C-left>', ':vertical resize -5<cr>', options)
map('n', '<C-up>', ':resize +5<cr>', options)
map('n', '<C-down>', ':resize -5<cr>', options)
map('n', '<C-y>', ':ClangdSwitchSourceHeader<cr>', options)
