-- This fil can be loaded by calling `lua require('plugins')` from your init.vim

-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'sheerun/vim-polyglot'
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
    	'nvim-lualine/lualine.nvim',
    	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- use {
    --     'romgrk/barbar.nvim',
    --     requires = {'kyazdani42/nvim-web-devicons'}
    -- }
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons',
        after = "catppuccin",
        config = function()
            local mocha = require("catppuccin.palettes").get_palette "mocha"
            require("bufferline").setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get {
                    styles = { "italic", "bold" },
                    custom = {
                    all = {
                        fill = { bg = "#000000" },
                    },
                    mocha = {
                        background = { fg = mocha.text },
                    },
                    latte = {
                        background = { fg = "#000000" },
                    },
                },
            },
        }
        end
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }
    use 'tpope/vim-commentary'
    use 'ryanoasis/vim-devicons'
    
    -- Linux 専用
    if vim.fn.has('unix') == 1 then
    	use {'neoclide/coc.nvim', branch = 'release'}
        use {'pappasam/coc-jedi'}
    end
    -- windows 専用
    if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
	use 'windwp/nvim-autopairs'
        use 'lervag/vimtex'
        use 'Shougo/deoplete.nvim'
        use {
            'hrsh7th/vim-vsnip',
            requires = { 'hrsh7th/vim-vsnip-integ' }
        }
    end
end)


