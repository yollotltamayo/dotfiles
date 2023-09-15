-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- this is essential.

    use 'karb94/neoscroll.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use { 'catppuccin/nvim', as = 'catppuccin' }

    use 'folke/tokyonight.nvim'

    use { 'glepnir/dashboard-nvim' }
    --use {
    --    'VonHeikemen/lsp-zero.nvim',
    --    requires = {
    --        -- LSP Support
    --        { 'neovim/nvim-lspconfig' },
    --        { 'williamboman/mason.nvim' },
    --        { 'williamboman/mason-lspconfig.nvim' },

    --        -- Autocompletion
    --        { 'hrsh7th/nvim-cmp' },
    --        { 'hrsh7th/cmp-buffer' },
    --        { 'hrsh7th/cmp-path' },
    --        { 'saadparwaiz1/cmp_luasnip' },
    --        { 'hrsh7th/cmp-nvim-lsp' },
    --        { 'hrsh7th/cmp-nvim-lua' },

    --        -- Snippets
    --        { 'L3MON4D3/LuaSnip' },
    --        { 'rafamadriz/friendly-snippets' },
    --    }
    --}
    use { "kylechui/nvim-surround" , tag = "*" }
    use { "williamboman/mason.nvim" }
    use { 'jose-elias-alvarez/null-ls.nvim'}

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "ellisonleao/gruvbox.nvim" }

    use { "ibhagwan/fzf-lua",
        -- optional for icon support
        requires = { "nvim-tree/nvim-web-devicons" }
    }


    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use { 'saadparwaiz1/cmp_luasnip' }

    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }

    use { "lewis6991/gitsigns.nvim" }

end)
