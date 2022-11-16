-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- 文字コード
vim.bo.fenc = 'utf-8'
-- バックアップファイルを作らない
vim.o.bk = false
-- スワップファイルを作らない
vim.bo.swf = false
-- 編集中のファイルが変更されたら自動で読み直す
vim.o.ar = true
-- 入力中のコマンドをステータスに表示
vim.o.sc = true

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
vim.o.cot = 'menuone,noinsert'
vim.cmd [[
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
]]
-- inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
-- inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
-- ]]
 
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
        neotree = true,
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
-- require("nvim-tree").setup()

