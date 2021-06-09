local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

require('packer').startup(function(use)
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "storm"
            vim.cmd [[colorscheme tokyonight]]
        end
    }
    use 'kevinhwang91/nvim-bqf'
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
    }
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
                    sign = false,
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
                border_style = "single",
                rename_prompt_prefix = '➤',
                server_filetype_map = {}
            }
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-compe'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use 'steelsojka/pears.nvim'
    use 'tpope/vim-surround'
    use 'sirver/UltiSnips'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight',
                    section_separators = '',
                    component_separators = ''
                }
            }
        end
    }
    use 'vimwiki/vimwiki'
    use 'mhinz/vim-startify'
    use 'tpope/vim-fugitive'
    use 'skywind3000/asyncrun.vim'
    use {
        'voldikss/vim-floaterm',
        config = function()
            vim.cmd [[ hi link FloatermBorder Normal ]]
        end
    }
end)

-- Plugin Setup
require('pears').setup()

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

require('bqf').setup {
    auto_resize_height = false,
}

require('telescope').load_extension('fzy_native')

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

vim.g.startify_custom_header = {}
vim.g.startify_change_to_dir = 0
