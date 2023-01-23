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
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'tpope/vim-commentary'
    use 'ryanoasis/vim-devicons'
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    
    -- Linux 専用
    if vim.fn.has('unix') == 1 then
        use 'cdelledonne/vim-cmake'
        use 'pappasam/coc-jedi'
        use 'lervag/vimtex'
    end
    -- windows 専用
    if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    end
end)


