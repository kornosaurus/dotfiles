require('lsp/sumneko')
require('lsp/omnisharp')
require('lsp/tsserver')
require('lsp/efm')

vim.cmd [[
    au! BufWrite,BufEnter,InsertLeave * lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
]]
