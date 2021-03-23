vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sbdchd/neoformat'

    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'

    use 'tpope/vim-surround'
    use 'SirVer/ultisnips'
    use 'mattn/emmet-vim'
    use 'terrortylor/nvim-comment'

    use 'vimwiki/vimwiki'
    use 'junegunn/goyo.vim'

    use 'skywind3000/asyncrun.vim'
    use 'voldikss/vim-floaterm'

    use 'ayu-theme/ayu-vim'
    use 'pineapplegiant/spaceduck'
    use 'bluz71/vim-nightfly-guicolors'
end)

-- Plugin Setup
require('nvim_comment').setup()

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
}

require('compe').setup {
    enabled = true;
    autocomplete = false;

    source = {
        path = true;
        buffer = true;
        calc = false;
	vsnip = false;
        nvim_lsp = true;
        nvim_lua = true;
    };
}

-- Plugin Options
vim.g.floaterm_opener = 'edit'
vim.g.floaterm_autoclose = 2
vim.g.floaterm_title = ''
vim.g.floaterm_height = 0.8

vim.g.vimwiki_list = {{ path = '~/Wiki', syntax = 'markdown', ext = '.md' }}

vim.g.UltiSnipsSnippetDirectories={ os.getenv('HOME') .. '/.config/nvim/UltiSnips' }
vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<S-tab>"
