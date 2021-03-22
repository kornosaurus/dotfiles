local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

vim.g.mapleader = ' '

-- LSP
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>dq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
map('n', '<leader>dd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

map('n', '<leader><Tab>', ':b#<CR>', opts)

map('n', '<leader>ff', ':Files<CR>', opts)
map('n', '<leader>fb', ':Buffers<CR>', opts)

map('n', '<leader>e', ':FloatermNew vifm<CR>', opts)

map('i', '<C-space>', 'compe#complete()', { noremap=true, silent=true, expr=true })
map('i', '<CR>', 'compe#confirm("<CR>")', { noremap=true, silent=true, expr=true })
map('i', '<C-e>', 'compe#close("<C-e>")', { noremap=true, silent=true, expr=true })
