local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

vim.g.mapleader = ' '

-- Lsp
map('n', 'gh', "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<C-h>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map('i', '<C-h>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gf', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', opts)
map('n', '<leader>c', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map('v', '<leader>c', "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
map('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map('n', '<leader>d', "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", opts)

-- Git
map('n', '<leader>gg', ':LazyGit<CR>', opts)
map('n', '<leader>gs', ":Telescope git_status<CR>", opts)
map('n', '<leader>gd', ':Gvdiffsplit<CR>', opts)

-- Misc
map('n', '<M-q>', ':lopen<CR>', opts)
map('n', '<M-n>', ':lafter<CR>', opts)
map('n', '<M-p>', ':lbefore<CR>', opts)
map('n', '<C-q>', ':copen<CR>', opts)
map('n', '<C-n>', ':cnext<CR>', opts)
map('n', '<C-p>', ':cprev<CR>', opts)
map('n', '<leader><Tab>', '<C-^>', opts)
map('n', '<leader>ff', ":Telescope find_files<CR>", opts)
map('n', '<leader>fb', ":Telescope buffers<CR>", opts)
map('n', 'Y', '"+y', opts)
map('v', 'Y', '"+y', opts)
map('n', 'P', '"+p', opts)
map('n', '/', '/\\v', { noremap=true })
map('v', 's', ":s/\\v", { noremap=true })
map('n', '<leader>/', ':Telescope live_grep<CR>', { noremap=true })
map('n', '<leader>*', ':Telescope grep_string<CR>', { noremap=true })

-- Harpoon
map('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<leader>ho', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

map('n', '<C-j>', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', '<C-k>', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', '<C-l>', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', '<C-;>', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)

map('n', '<leader>tf', ':Dispatch jest -- %<CR>', opts)
