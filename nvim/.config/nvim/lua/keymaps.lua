local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local M = {}

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)
map("n", "<leader>bc", ':BufferLinePickClose<cr>', options)
map('n', '<F2>', ':w<cr>', options)
map('n', '<F3>', ':wq<cr>', options)

-- nvim-tree
map('n', '<F4>', ':NvimTreeRefresh<cr>:NvimTreeToggle<cr>', options)

-- hop.nvim
map('n', '<leader>hw', ':HopWord<CR>', options)
map('n', '<leader>hl', ':HopLine<CR>', options)

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', options)
map('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>fn', '<cmd>DashboardNewFile<cr>', options)
map('n', '<leader>fm', '<cmd>Telescope marks<cr>', options)
