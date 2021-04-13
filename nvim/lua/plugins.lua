local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

require('packer').startup(function(use)
    use {
        'bluz71/vim-moonfly-colors',
        config = function()
            vim.cmd [[colorscheme moonfly]]
            vim.cmd [[highlight StatusLineNC gui=underline guibg=#080808 guifg=#1c1c1c]]
            vim.cmd [[highlight StatusLine   guibg=#080808 guifg=#080808]]
            vim.cmd [[highlight SignColumnNC guibg=#080808 guifg=#1c1c1c]]
            vim.cmd [[highlight VertSplit    guibg=#080808 guifg=#1c1c1c]]
        end
    }

    use 'wbthomason/packer.nvim'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use 'neovim/nvim-lspconfig'
    use {
        'glepnir/lspsaga.nvim',
        config = function()
            require('lspsaga').init_lsp_saga {
                use_saga_diagnostic_sign = true,
                error_sign = '',
                warn_sign = '',
                hint_sign = '',
                infor_sign = '',
                dianostic_header_icon = '   ',
                code_action_icon = ' ',
                code_action_prompt = {
                    enable = true,
                    sign = true,
                    sign_priority = 20,
                    virtual_text = true,
                },
                finder_definition_icon = '  ',
                finder_reference_icon = '  ',
                max_preview_lines = 10,
                finder_action_keys = {
                    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>'
                },
                code_action_keys = {
                    quit = 'q',exec = '<CR>'
                },
                rename_action_keys = {
                    quit = '<C-c>', exec = '<CR>'
                },
                definition_preview_icon = '  ',
                border_style = 1,
                rename_prompt_prefix = '➤',
                server_filetype_map = {}
            }
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-compe'

    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    use 'tpope/vim-surround'
    use 'SirVer/ultisnips'
    use 'mattn/emmet-vim'
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function()
            require('statusline')
        end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua'
    }

    use 'vimwiki/vimwiki'
    use 'junegunn/goyo.vim'

    use 'skywind3000/asyncrun.vim'
    use {
        'voldikss/vim-floaterm',
        config = function()
            vim.cmd [[ hi link FloatermBorder Normal ]]
        end
    }
end)

-- Plugin Setup
require('gitsigns').setup {
    signs = {
        add = {hl = 'GitSignsAdd', text = '▎'},
        change = {hl = 'GitSignsChange', text = '▎'},
        delete = {hl = 'GitSignsDelete', text = '◢'},
        topdelete = {hl = 'GitSignsDelete', text = '◥'},
        changedelete = {hl = 'GitSignsChangeDelete', text = '▌'},
    }
}

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

vim.g.vsnip_filetypes = {
    javascriptreact = {'javascript'},
    typescriptreact = {'typescript'}
}

vim.g.UltiSnipsSnippetDirectories={ os.getenv('HOME') .. '/.config/nvim/UltiSnips' }
vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<S-tab>"

vim.g.indent_blankline_char = '▏'
