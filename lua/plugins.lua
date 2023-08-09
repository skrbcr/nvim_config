return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'sheerun/vim-polyglot'
    use {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    }
    use {
    	'nvim-lualine/lualine.nvim',
    	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
    }
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'tpope/vim-commentary'
    use 'ryanoasis/vim-devicons'
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    
    -- Linux 専用
    if vim.fn.has('unix') == 1 then
        use 'pappasam/coc-jedi'
        use 'lervag/vimtex'
        use 'cdelledonne/vim-cmake'
    end
    -- windows 専用
    if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    end
end)


