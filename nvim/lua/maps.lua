local nmap = require("keymap").nmap
local imap = require("keymap").imap
local vmap = require("keymap").vmap

vim.g.mapleader = ' '

-- TODO Move plugin maps to correct after/plugin/<pluginname>.lua
-- TODO Add description to all maps

-- Lsp
nmap('K', "<cmd>lua vim.lsp.buf.hover()<CR>")
nmap('<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>")
imap('<C-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nmap('<leader>gf', '<cmd>lua vim.lsp.buf.format({async=true})<CR>')
nmap('<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>")
vmap('<leader>ca', "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
nmap('<leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>")
nmap('<leader>dd', "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>")

-- Git
nmap('<leader>gg', ':LazyGit<CR>')
nmap('<leader>gs', ":Telescope git_status<CR>")
nmap('<leader>gd', ':Gvdiffsplit<CR>')

-- Buffers
nmap("<C-j>", ":bnext<CR>")
nmap("<C-k>", ":bprevious<CR>")
nmap("<C-x>", ":bd<CR>")

nmap("<A-j>", ":m .+1<CR>==")
nmap("<A-k>", ":m .-2<CR>==")

-- File explorer
nmap('<leader>e', ':NnnPicker %:p:h<CR>')

-- Misc
nmap('<M-q>', ':lopen<CR>')
nmap('<M-n>', ':lafter<CR>')
nmap('<M-p>', ':lbefore<CR>')
nmap('<C-q>', ':copen<CR>')
nmap('<C-n>', ':cnext<CR>')
nmap('<C-p>', ':cprev<CR>')
nmap('<leader><Tab>', '<C-^>')
nmap('<leader>ff', ":Telescope find_files<CR>")
nmap('<leader>fb', ":Telescope buffers<CR>")
nmap('Y', '"+y')
vmap('Y', '"+y')
nmap('/', '/\\v', nil, { noremap=true })
nmap('<leader>/', ':Telescope live_grep<CR>', nil, { noremap=true })
nmap('<leader>*', ':Telescope grep_string<CR>', nil, { noremap=true })
nmap('<esc><esc>', ':nohlsearch<CR>')

-- DAP
nmap('<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
nmap('<leader>B', 'lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
nmap('<F5>', '<cmd>lua require"dap".continue()<CR>')
nmap('<F10>', '<cmd>lua require"dap".step_over()<CR>')
nmap('<F11>', '<cmd>lua require"dap".step_into()<CR>')
nmap('<F12>', '<cmd>lua require"dap".run_to_cursor()<CR>')
nmap('<leader>dr', '<cmd>lua require"dap".repl.open()<CR>')
nmap('<leader>du', '<cmd>lua require("dapui").toggle()<CR>')

-- Formatting
nmap('<leader>fj', ':%!jq<CR>')
vmap('<leader>fj', ':!jq<CR>')

nmap('<leader>tf', ':Dispatch jest -- %<CR>')
