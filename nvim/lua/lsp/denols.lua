require'lspconfig'.denols.setup{
    init_options = {
        enable = true,
        lint = true,
        unstable = false
    },
    diagnostics = {
        enable = false
    }
}
