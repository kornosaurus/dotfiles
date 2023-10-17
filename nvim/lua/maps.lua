vim.g.mapleader = ' '

-- Lsp
-- TODO: move to on_attach callback
vim.keymap.set('i', '<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>")
-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>') Handled by fzf-lua
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async=true})<CR>')
vim.keymap.set('n', '<leader>c', "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP: Code action" })
vim.keymap.set('v', '<leader>c', "<cmd>lua vim.lsp.buf.range_code_action()<CR>", { desc = "LSP: Code action" })
vim.keymap.set('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP: Rename" })
vim.keymap.set('n', '<leader>d', "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>")

-- Buffers
vim.keymap.set('n', '<leader>q', ':bdelete<CR>')

-- Search
vim.api.nvim_create_user_command(
    'Grep',
    function(opts)
        vim.cmd('grep! ' .. opts.args)
        vim.cmd('redraw!')
        vim.cmd('bot copen')
    end,
    { nargs = 1 }
)

vim.cmd [[
    vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
]]

vim.keymap.set('n', '<leader>a', '*:%s//&')
vim.keymap.set('n', '<leader>s', '*:%s//')
vim.keymap.set('v', '<leader>a', 'y:<C-u>%s/<C-r>"/&')
vim.keymap.set('v', '<leader>s', 'y:<C-u>%s/<C-r>"/')
-- vim.keymap.set('n', '/', '/\\v')
-- vim.keymap.set('n', '/', '/\\v')
-- vim.keymap.set('n', '<leader>/', ':Grep ')
-- vim.keymap.set('n', '<leader>*', function()
--     vim.cmd('Grep -w ' .. vim.fn.expand('<cword>'))
-- end)

-- Move line(s)
vim.keymap.set('n', "<C-j>", ":m .+1<CR>==")
vim.keymap.set('n', "<C-k>", ":m .-2<CR>==")
-- vim.keymap.set('i', "<C-j>", "<Esc>:m .+1<CR>==gi")
-- vim.keymap.set('i', "<C-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set('v', "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "<C-k>", ":m '<-2<CR>gv=gv")

-- Misc
vim.keymap.set('n', '<M-q>', ':lopen<CR>')
vim.keymap.set('n', ']d', ':lafter<CR>')
vim.keymap.set('n', '[d', ':lbefore<CR>')
vim.keymap.set('n', '<C-q>', ':bot copen<CR>')
vim.keymap.set('n', '<C-n>', ':cnext<CR>')
vim.keymap.set('n', '<C-p>', ':cprev<CR>')
vim.keymap.set('n', '<leader><Tab>', '<C-^>')
vim.keymap.set('n', 'Y', '"+y')
vim.keymap.set('v', 'Y', '"+y')
vim.keymap.set('n', '<esc><esc>', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Wezterm
vim.keymap.set('n', '<leader>gg',
    '<cmd>!wezterm cli split-pane --right --cwd ' .. vim.fn.getcwd() .. ' -- lazygit <CR><CR>', { desc = 'GIT: Lazygit' })
