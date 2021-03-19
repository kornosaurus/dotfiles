require('lsp/sumneko')
require('lsp/omnisharp')
require('lsp/tsserver')

vim.cmd [[
    au! BufWrite,BufEnter,InsertLeave * lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
]]
