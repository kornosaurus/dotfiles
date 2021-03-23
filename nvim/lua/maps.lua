local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

vim.g.mapleader = ' '

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
map('n', '<C-q>', ':copen<CR>', opts)
map('n', '<C-n>', ':cnext<CR>', opts)
map('n', '<C-p>', ':cprev<CR>', opts)
map('n', '<leader>q', ':lopen<CR>', opts)
map('n', '<leader>n', ':lnext<CR>', opts)
map('n', '<leader>p', ':lprev<CR>', opts)
map('n', '<leader><Tab>', ':b#<CR>', opts)
map('n', '<leader>ff', ':Files<CR>', opts)
map('n', '<leader>fb', ':Buffers<CR>', opts)
map('n', '<leader>e', ':FloatermNew vifm<CR>', opts)
map('i', '<C-space>', 'compe#complete()', { noremap=true, silent=true, expr=true })
map('i', '<CR>', 'compe#confirm("<CR>")', { noremap=true, silent=true, expr=true })
map('i', '<C-e>', 'compe#close("<C-e>")', { noremap=true, silent=true, expr=true })
map('n', '<leader>gs', ':Gstatus<cr>', opts)
map('n', '<leader>gb', ':Gblame<cr>', opts)
map('n', '<leader>gd', ':Gdiffsplit!<CR>', opts)
map('n', '<leader>gl', ':Git log -100<CR>', opts)
map('n', '<leader>dh', ':diffget //2<CR>', opts)
map('n', '<leader>dl', ':diffget //3<CR>', opts)
map('n', 'Y', '"+y', opts)
map('v', 'Y', '"+y', opts)
map('n', '/', '/\\v', { noremap=true })
map('n', '<leader>/', ':grep ', { noremap=true })
map('n', '<leader>lg', ':FloatermNew lazygit<CR>', opts)
map('n', '<leader>rt', ':Test %<CR>', opts)
map('n', '<leader>rl', ':Lint<CR>', opts)

-- TEMP
vim.cmd [[ autocmd TermOpen * startinsert ]]
vim.cmd [[ autocmd FileType fzf set nonu nornu ]]
vim.cmd [[ command! -nargs=* Test execute "AsyncRun npm run test -- -i <args>" <bar> copen 10 <bar> wincmd p ]]
vim.cmd [[ command! Lint execute "AsyncRun eslint_d %" <bar> copen 10 <bar> wincmd p ]]
