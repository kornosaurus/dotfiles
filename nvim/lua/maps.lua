local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

vim.g.mapleader = ' '

map('n', 'gh', "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<C-h>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map('i', '<C-h>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', '<leader>ca', ":Telescope lsp_code_actions<CR>", opts)
map('v', '<leader>ca', ":<C-U>lua vim.lsp.buf.range_code_action()<CR>", opts)
map('n', '<leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map('n', '<leader>dd', "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)

map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

map('n', '<M-q>', ':lopen<CR>', opts)
map('n', '<M-n>', ':lafter<CR>', opts)
map('n', '<M-p>', ':lbefore<CR>', opts)
map('n', '<C-q>', ':copen<CR>', opts)
map('n', '<C-n>', ':cnext<CR>', opts)
map('n', '<C-p>', ':cprev<CR>', opts)
map('n', '<leader><Tab>', ':b#<CR>', opts)
map('n', '<leader>ff', ":lua require'telescope.builtin'.find_files{}<CR>", opts)
map('n', '<leader>fb', ":lua require'telescope.builtin'.buffers{}<CR>", opts)
map('n', '<A-d>', ':FloatermToggle<CR>', opts)
map('t', '<A-d>', '<C-\\><C-n>:FloatermToggle<CR>', opts)

map('i', '<C-space>', 'compe#complete()', { noremap=true, silent=true, expr=true })
map('i', '<C-y>', 'compe#confirm("<C-y>")', { noremap=true, silent=true, expr=true })
map('i', '<C-e>', 'compe#close("<C-e>")', { noremap=true, silent=true, expr=true })
map('n', '<leader>gs', ':Neogit<CR>', opts)
map('n', 'Y', '"+y', opts)
map('v', 'Y', '"+y', opts)
map('n', '/', '/\\v', { noremap=true })
map('n', '<leader>/', ':grep ', { noremap=true })

map('n', '<leader>e', ':FloatermNew nnn<CR>', opts)
map('n', '<leader>lg', ':FloatermNew lazygit<CR>', opts)

map('n', '<leader>tf', ':TestFile<CR>', opts)
map('n', '<leader>tn', ':TestNearest<CR>', opts)
map('n', '<leader>tl', ':TestLast<CR>', opts)
