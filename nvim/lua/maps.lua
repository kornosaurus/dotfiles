vim.g.mapleader = ' '

-- Lsp
-- TODO: move to on_attach callback
vim.keymap.set('i', '<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'rn', "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP: Rename" })
vim.keymap.set('n', '<leader>d', "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>")

vim.cmd [[
    vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
]]

vim.keymap.set('n', '<leader>ss', ':%s/')
vim.keymap.set('n', '<leader>sa', '*:%s//&')
vim.keymap.set('n', '<leader>sw', '*:%s//')
vim.keymap.set('v', '<leader>a', 'y:<C-u>%s/<C-r>"/&')
vim.keymap.set('v', '<leader>s', 'y:<C-u>%s/<C-r>"/')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('n', '/', '/\\v')

-- Move line(s)
vim.keymap.set('n', "<A-j>", ":m .+1<CR>==")
vim.keymap.set('n', "<A-k>", ":m .-2<CR>==")
vim.keymap.set("x", "<A-j>", ":m '>+1<CR><CR>gv=gv")
vim.keymap.set("x", "<A-k>", ":m '<-2<CR><CR>gv=gv")

-- Misc
vim.keymap.set('n', 'H', ':bprev<CR>')
vim.keymap.set('n', 'L', ':bnext<CR>')
vim.keymap.set('n', '<M-q>', ':lopen<CR>')
vim.keymap.set('n', ']d', ':lafter<CR>')
vim.keymap.set('n', '[d', ':lbefore<CR>')
vim.keymap.set('n', '<C-q>', ':bot copen<CR>')
vim.keymap.set('n', '<C-n>', ':cnext<CR>')
vim.keymap.set('n', '<C-p>', ':cprev<CR>')
vim.keymap.set('n', '<leader>w', ':tabclose<CR>')
vim.keymap.set('n', '<leader>q', ':bdelete<CR>')
vim.keymap.set('n', '<leader><Tab>', '<C-^>')
vim.keymap.set('n', 'Y', '"+y')
vim.keymap.set('v', 'Y', '"+y')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<leader>yp', function() vim.fn.setreg("+", vim.fn.expand("%")) end, { desc = 'Yank path' })
vim.keymap.set('n', '<leader>yP', function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, { desc = 'Yank absolute path' })
