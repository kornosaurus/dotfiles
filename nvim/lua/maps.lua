local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

vim.g.mapleader = ' '

map('n', 'gh', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'gf', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
map('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
map('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
map('i', '<C-h>', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)

-- scroll down/up hover doc or scroll in definition preview
map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
map('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

map('n', '<leader>p', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
map('n', '<leader>n', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
map('n', '<leader>dd', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)

map('n', '<C-q>', ':copen<CR>', opts)
map('n', '<C-n>', ':cnext<CR>', opts)
map('n', '<C-p>', ':cprev<CR>', opts)
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
