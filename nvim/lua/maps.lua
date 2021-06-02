local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

vim.g.mapleader = ' '

map('n', 'gh', "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<C-h>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map('i', '<C-h>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
map('n', 'gf', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
map('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
map('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
map('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

map('n', '0', "getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^'", {silent = true, noremap = true, expr = true})

map('n', '<leader>p', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
map('n', '<leader>n', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
map('n', '<leader>dd', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)

map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

map('n', '<leader><C-n>', ':next<CR>', opts)
map('n', '<leader><C-p>', ':prev<CR>', opts)
map('n', '<C-q>', ':copen<CR>', opts)
map('n', '<C-n>', ':cnext<CR>', opts)
map('n', '<C-p>', ':cprev<CR>', opts)
map('n', '<leader><Tab>', ':b#<CR>', opts)
map('n', '<leader>ff', ":lua require'telescope.builtin'.find_files{}<CR>", opts)
map('n', '<leader>fg', ":lua require'telescope.builtin'.git_status{}<CR>", opts)
map('n', '<leader>fb', ":lua require'telescope.builtin'.buffers{}<CR>", opts)
map('n', '<A-d>', ':FloatermToggle<CR>', opts)
map('t', '<A-d>', '<C-\\><C-n>:FloatermToggle<CR>', opts)

map('i', '<C-space>', 'compe#complete()', { noremap=true, silent=true, expr=true })
map('i', '<C-y>', 'compe#confirm("<C-y>")', { noremap=true, silent=true, expr=true })
map('i', '<C-e>', 'compe#close("<C-e>")', { noremap=true, silent=true, expr=true })
map('n', '<leader>gs', ':Git<CR>', opts)
map('n', '<leader>gb', ':Git blame<CR>', opts)
map('n', '<leader>gd', ':Gdiffsplit!<CR>', opts)
map('n', '<leader>gl', ':Git log -100<CR>', opts)
map('n', '<leader>gc', ":lua require'telescope.builtin'.git_branches{}<CR>", opts)
map('n', '<leader>dh', ':diffget //2<CR>', opts)
map('n', '<leader>dl', ':diffget //3<CR>', opts)
map('n', 'Y', '"+y', opts)
map('v', 'Y', '"+y', opts)
map('n', '/', '/\\v', { noremap=true })
map('n', '<leader>/', ':grep ', { noremap=true })

map('n', '<leader>e', ':FloatermNew vifm<CR>', opts)
map('n', '<leader>lg', ':FloatermNew lazygit<CR>', opts)
map('n', '<leader>rt', ':AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 npm run test %<CR>', opts)

-- TEMP
vim.cmd [[ autocmd TermOpen * startinsert ]]
vim.cmd [[ autocmd FileType fzf set nonu nornu ]]
