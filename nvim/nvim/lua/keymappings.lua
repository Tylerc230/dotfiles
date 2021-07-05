local map = vim.api.nvim_set_keymap
-- Map leader to space
vim.g.mapleader = ' '
local options = {noremap = true, silent = true}
-- better window movement
map('n', '<leader>h', '<C-w>h', options)
map('n', '<leader>j', '<C-w>j', options)
map('n', '<leader>k', '<C-w>k', options)
map('n', '<leader>l', '<C-w>l', options)
map('n', '<leader>t', ':Telescope find_files<CR>', options)
map('n', '<leader>r', ':Telescope oldfiles<CR>', options)
map('n', '<leader>/', ':Telescope live_grep prompt_prefix=🔍<CR>', options)
map('n', '<leader>b', ':Telescope buffers<CR>', options)
map('n', '<leader>gb', ':Telescope git_branches<CR>', options)
map('n', '<leader>f', '<CMD>NvimTreeToggle<CR>', options)
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

--" resize current buffer by +/- 5 
--:
map('n', '<C-right>', ':vertical resize +5<cr>', options)
map('n', '<C-left>', ':vertical resize -5<cr>', options)
map('n', '<C-up>', ':resize +5<cr>', options)
map('n', '<C-down>', ':resize -5<cr>', options)


