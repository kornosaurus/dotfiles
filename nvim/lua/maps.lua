vim.g.mapleader = ' '

-- Lsp
-- TODO: move to on_attach callback
vim.keymap.set('i', '<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { desc = 'LSP: Goto References' })
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async=true})<CR>')
vim.keymap.set('n', '<leader>cc', "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP: Code action" })
vim.keymap.set('v', '<leader>cc', "<cmd>lua vim.lsp.buf.range_code_action()<CR>", { desc = "LSP: Code action" })
vim.keymap.set('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP: Rename" })
vim.keymap.set('n', '<leader>dd', "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>")

-- Move line(s)
vim.keymap.set('n', "<A-j>", ":m .+1<CR>==")
vim.keymap.set('n', "<A-k>", ":m .-2<CR>==")
vim.keymap.set('i', "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set('i', "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set('v', "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "<A-k>", ":m '<-2<CR>gv=gv")

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
vim.keymap.set('n', '/', '/\\v')
-- vim.keymap.set('n', '<leader>/', ':Grep ')
vim.keymap.set('n', '<leader>*', function()
    vim.cmd('Grep -w ' .. vim.fn.expand('<cword>'))
end)

-- Misc
vim.keymap.set('n', '<leader>:', function() require('telescope.builtin').commands() end, { desc = 'Commands' })
vim.keymap.set('n', '<M-q>', ':lopen<CR>')
vim.keymap.set('n', ']e', ':lafter<CR>')
vim.keymap.set('n', '[e', ':lbefore<CR>')
vim.keymap.set('n', '<C-q>', ':bot copen<CR>')
vim.keymap.set('n', '<C-n>', ':cnext<CR>')
vim.keymap.set('n', '<C-p>', ':cprev<CR>')
vim.keymap.set('n', '<leader><Tab>', '<C-^>')
vim.keymap.set('n', 'Y', '"+y')
vim.keymap.set('v', 'Y', '"+y')
vim.keymap.set('n', '<esc><esc>', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- DAP
vim.keymap.set('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = 'Set breakpoint' })
vim.keymap.set('n', '<leader>B', 'lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { desc = 'Set conditional breakpoint' })
vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', { desc = 'DAP: Continue' })
vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', { desc = 'DAP: Step over' })
vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', { desc = 'DAP: Step into' })
vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".run_to_cursor()<CR>', { desc = 'DAP: Run to cursor' })
vim.keymap.set('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', { desc = 'DAP: Repl open' })
vim.keymap.set('n', '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', { desc = 'DAP: Open UI' })

-- Formatting
vim.keymap.set('n', '<leader>fj', ':%!jq<CR>')
vim.keymap.set('v', '<leader>fj', ':!jq<CR>')
