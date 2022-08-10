local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function(use)
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "storm"
            vim.cmd [[colorscheme tokyonight]]
        end
    }
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-ui-select.nvim' }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { "junegunn/fzf", run = ":call fzf#install()" }
    use 'tpope/vim-fugitive'
    use 'kdheepak/lazygit.nvim'
    use 'ThePrimeagen/harpoon'
    use 'neovim/nvim-lspconfig'
    use {
        'kevinhwang91/nvim-bqf',
        config = function()
            require('bqf').setup({
                auto_enable = true,
                auto_resize_height = false
            })
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use({
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-treesitter.configs').setup {
                autotag = {
                    enable = true,
                }
            }
        end,
    })
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'quangnguyen30192/cmp-nvim-ultisnips',
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup {
                completion = {
                    autocomplete = false
                },
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                    end,
                },
                mapping = {
                    ["<C-p>"] = function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            cmp.complete()
                        end
                    end,
                    ["<C-n>"] = function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            cmp.complete()
                        end
                    end,
                    ["<C-e>"] = cmp.mapping.close(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ["<C-y>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    },
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    }
                },
                sources = {
                    {name = "nvim_lsp"},
                    {name = 'ultisnips'},
                    {name = "buffer", keyword_length = 8},
                    {name = "path"},
                }
            }
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use 'ggandor/lightspeed.nvim'
    use 'tpope/vim-surround'
    use 'sirver/UltiSnips'
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight',
                    section_separators = '',
                    component_separators = '',
                    globalstatus = true
                }
            }
        end
    }
    use 'mattn/emmet-vim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {
                { path = '~/Wiki/', syntax = 'markdown', ext = '.md' }
            }
        end
    }

    -- Running tests
    use 'tpope/vim-dispatch'
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
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    }
}

require("telescope").setup {
    defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top"
        }
    }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")

vim.g.dispatch_no_maps = 1

vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<S-tab>"
vim.g.UltiSnipsSnippetDirectories={ os.getenv('HOME') .. '/.config/nvim/UltiSnips' }
