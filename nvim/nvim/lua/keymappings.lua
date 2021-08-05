local map = vim.api.nvim_set_keymap
-- Map leader to space
vim.g.mapleader = ' '
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
map('n', '<leader>r', ':Telescope oldfiles<CR>', options)
map('n', '<leader>/', ':Telescope live_grep prompt_prefix=🔍<CR>', options)
map('n', '<leader>b', ':Telescope buffers<CR>', options)
map('n', '<leader>gb', ':Telescope git_branches<CR>', options)
map('n', '<leader>f', '<CMD>NvimTreeToggle<CR>', options)
map('n', '<leader>F', '<CMD>NvimTreeFindFile<CR>', options)
map('n', '<leader>w', '<CMD>ChooseWin<CR>', options)
map('n', '<leader>gs', '<CMD>Git<CR>', options)
map('n', '<leader>gll', '<CMD>Telescope git_commits<CR>', options)
map('n', '<leader>gc', '<CMD>Telescope git_status<CR>', options)
map('n', '<leader><leader>/', '<CMD>let @/=""<CR>', options)
map('n', '<leader>ci', '<plug>NERDCommenterToggle', options)
map('n', '<leader>i', 'V=<ESC>', options)
map('v', '<leader>i', '=', options)
map('n', '<leader>v', '<CMD>Ttoggle<CR>', options)
map('n', '<leader>n', '<CMD>vert Tnew<CR>', options)
map('n', '<leader>zh', "<CMD>lua require('telescope').extensions.zsh_history.scripts()<CR>", options)
map('n', '<leader><leader>w', '<cmd>HopWord<CR>', options)
map('n', '<leader><leader>l', '<cmd>HopLine<CR>', options)

map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
map('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', options)
map('n', '<leader>R', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
map('n', 'gi', '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
--map('n', 'gt', '<Cmd>TroubleToggle lsp_document_diagnostics<CR>', options)
map('n', 'gt', '<Cmd>Lspsaga show_line_diagnostics<CR>', options)
--map('n', '<leader>gt', '<Cmd>TroubleToggle<CR>', options)
map('n', '<leader>m', '<cmd>Telescope lsp_document_symbols<CR>', options)
--map("n", "<space>i", "<cmd>lua vim.lsp.buf.formatting()<CR>", options)
map('n', '<leader>d', '<cmd>Telescope lsp_document_diagnostics<CR>', options)
map('n', '<leader>D', '<cmd>Telescope lsp_workspace_diagnostics<CR>', options)
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  { key = {"cd"}, cb = tree_cb("cd") },
  { key = "<BS>", cb = tree_cb("dir_up") },
  { key = "s", cb = tree_cb("split") },
  { key = "v", cb = tree_cb("vsplit") },
}

--" resize current buffer by +/- 5 
--:
map('n', '<C-right>', ':vertical resize +5<cr>', options)
map('n', '<C-left>', ':vertical resize -5<cr>', options)
map('n', '<C-up>', ':resize +5<cr>', options)
map('n', '<C-down>', ':resize -5<cr>', options)

