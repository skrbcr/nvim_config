-- 文字コード
vim.cmd 'set fenc=utf-8'

-- バックアップファイルを作らない
vim.cmd 'set nobackup'
-- スワップファイルを作らない
vim.cmd 'set noswapfile'
-- 編集中のファイルが変更されたら自動で読み直す
vim.cmd 'set autoread'
-- 入力中のコマンドをステータスに表示
vim.cmd 'set showcmd'

-- 行番号を表示
vim.wo.nu = true
vim.wo.rnu = true
-- ステータスライン
vim.o.ls = 2
-- 色設定
vim.o.tgc = true
vim.o.background = 'dark'
-- モードの表示をしない
vim.o.smd = false
-- カーソルline
vim.wo.cul = true
-- -- シンタックス
vim.bo.syn = 'ON'
-- -- 括弧入力時に対応する括弧を表示
-- set showmatch
-- -- 検索ハイライト
vim.o.hls = true
-- -- インクリメントサーチ
vim.o.is = true
-- -- 自動インデント
vim.bo.si = true
vim.bo.ai = true
-- -- Tabは半角スペース
vim.cmd	'set expandtab'
-- -- インデント幅
vim.cmd 'set shiftwidth=4'
-- -- Tab挿入時の文字幅
vim.cmd 'set softtabstop=4'
-- -- Tabの表示幅
vim.cmd 'set tabstop=4'
-- ビープ音を可視化
-- set visualbell
 
--[[ plugins ]]--
require('plugins')

-- カラースキーム
require("catppuccin").setup({
    flavour = "mocha",
    styles = {
        comments = {},
    },
    color_overrides = {
        all = {
            comment = "#808080",
        },
    },
    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.comment },
            LineNr = { fg = colors.comment }
        }
    end,
    integrations = {
    },
})
vim.cmd 'colorscheme catppuccin'
-- require('fern').setip{}
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    globalstatus = true,
  }
}

