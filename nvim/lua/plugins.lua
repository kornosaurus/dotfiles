require('packer').startup(function(use)
  use {
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'nvim-treesitter/nvim-treesitter'
  use 'sbdchd/neoformat'

  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  use 'tpope/vim-surround'
  use 'rstacruz/vim-closer'
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

-- Plugin Options
vim.api.nvim_set_var('floaterm_opener', 'edit')
